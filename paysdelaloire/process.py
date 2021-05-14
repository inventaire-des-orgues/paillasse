import os
import logging
import json
import pprint
import re
import unidecode
import csv
import requests
from tqdm import tqdm

logger = logging.getLogger('paysdelaloire')
logger.setLevel(logging.DEBUG)


def load_file(file):
    with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'export', file)) as fichier:
        return json.load(fichier)[2]['data']


def download_imports():
    api_key = os.environ.get("API_KEY")
    if not api_key:
        print("Variable d'environnement API_KEY non définie")
        return
    progress = tqdm(['44', '49', '53', '72', '85'], desc="Téléchargement des departements")
    for code_dep in progress:
        progress.set_description(desc="Téléchargement des departements " + code_dep)
        response = requests.get("https://inventaire-des-orgues.fr/api/v1/orgues/",
                                params={"code_departement": code_dep, "limit": 150},
                                headers={'Authorization': 'Token ' + api_key})
        with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'currentinventaire', code_dep + '.json'),
                  mode='wt') as file:
            json.dump(response.json(), file, indent=4, ensure_ascii=False)
    response = requests.get("https://inventaire-des-orgues.fr/api/v1/config.json",
                            headers={'Authorization': 'Token ' + api_key})
    with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'data', 'config.json'), mode='wt') as file:
        json.dump(response.json(), file, indent=4, ensure_ascii=False)


def load_import(departement):
    with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'currentinventaire',
                           departement + '.json')) as renseignements:
        return json.load(renseignements)['results']


def load_csv_file(file, key=lambda item: item[0],
                  value=lambda item: item[1] if item[1] and item[1] != 'None' else None):
    with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'data', file)) as fichier:
        return {key(item): value(item) for item in csv.reader(fichier)}


def to_dict(data):
    return {item['id']: item for item in data}


def load_imports():
    return {
        '44': load_import('44'),
        '49': load_import('49'),
        '53': load_import('53'),
        '72': load_import('72'),
        '85': load_import('85'),
    }


def extract_numero_departement(departement):
    return re.search('\\(([0-9]+)\\)', departement, re.IGNORECASE).group(1)


def find_current_organ(current, departement, _id):
    link = "http://orguepaysdelaloire.fr/inventory/admin_orgue.php?id=" + _id
    for item in current[departement]:
        for source in item['sources']:
            if source['lien'] == link:
                return item
    return {}


def generate_soufflerie(mecanique):
    result = mecanique['soufflerie_type']
    if mecanique['soufflerie_spec']:
        result += ", " + mecanique['soufflerie_spec']
    return result


def generate_sommiers(mecanique):
    result = mecanique['sommiers_type']
    if mecanique['sommiers_spec']:
        result += ", " + mecanique['sommiers_spec']
    return result


def generate_proprietaire(context, proprietaire):
    if proprietaire is None:
        return ''
    elif 'ville' in proprietaire.lower():
        return "commune"
    elif proprietaire == 'État' or proprietaire == 'Etat':
        return "etat"
    elif proprietaire == 'AOCN':
        return "association_culturelle"
    elif proprietaire == 'Diocèse':
        return "diocese"
    elif proprietaire == 'Paroisse':
        return "paroisse"
    elif (st in proprietaire for st in ['Communauté', 'Congrégation', 'Prieuré']):
        return "congregation"
    elif proprietaire == 'Collège':
        return "etablissement_scolaire"
    elif proprietaire == 'Institut':
        return "conservatoire"
    elif proprietaire == 'Hopital':
        return "hopital"
    else:
        context.log("Proprietaire {} n'existe pas".format(proprietaire))
        return None


def generate_etat(context, etat):
    if etat == 'Excellent':
        return "tres_bon"
    elif etat == 'Bon':
        return "bon"
    elif etat == 'Moyen':
        return "bon"
    elif etat == 'Mauvais':
        return "altere"
    elif etat == 'Injouable':
        return "degrade"
    else:
        context.log("Etat '{}' n'existe pas".format(etat))
        return None


def generate_transmission(context, transmission):
    if transmission == 'Mécanique':
        return "mecanique"
    elif transmission == 'Pneumatique Barker':
        return "mecanique_barker"
    elif transmission == 'Électrique':
        return "electrique"
    elif transmission == 'Électropneumatique':
        return "electro_pneumatique"
    elif transmission == 'Tubulaire':
        return "pneumatique"
    elif transmission == 'Informatique':
        return "numeriques"
    else:
        context.log("Transmission '{}' n'existe pas".format(transmission))
        return None


def generate_tirage(context, transmission):
    if transmission == 'Mécanique':
        return "mecanique"
    elif transmission == 'Électrique':
        return "electrique"
    elif transmission == 'Électropneumatique':
        return "electro_pneumatique"
    elif transmission == 'Tubulaire' or transmission == 'Pneumatique Barker':
        return "pneumatique_basse_pression"
    elif transmission == 'Informatique':
        return "numerique"
    else:
        context.log("Tirage '{}' n'existe pas".format(transmission))
        return None


def generate_transmission_commentaire(transmission):
    return None


def generate_tirage_commentaire(transmission):
    if transmission == 'Pneumatique Barker' or transmission == 'Tubulaire':
        return transmission
    else:
        return None


def build_accessoires(context, combinaisons):
    accessoires = []
    for i in range(1, 41):
        nom = combinaisons["comb_" + str(i) + "_nom"]
        if nom:
            # if accessoire not exit, log message
            acc = context.data["accessoires"].get(clean_accessoire(nom))
            if acc:
                if not acc == "None":
                    accessoires.extend(acc.split(','))
            else:
                context.log("Accessoire {} n'existe pas".format(nom))
    return accessoires


def clean_hauteur(hauteur):
    if not hauteur:
        return ''
    s = re.search('([-0-9IV/ ]+)', hauteur.replace("'", " ").replace("\\", "").replace("  ", " ").strip(),
                  re.IGNORECASE)
    return s.group(1) if s is not None else ''


def clean_jeu_nom(nom):
    if not nom:
        return ""
    return unidecode.unidecode(nom.strip().lower().replace("\\\'", "\'"))


def clean_accessoire(accessoire):
    if not accessoire:
        return ""
    return unidecode.unidecode(accessoire.replace("\\\'", "").replace("\'", "").replace("  ", " ").strip().lower())


def extract_facteur(facteur):
    match = re.search(r"^([^(]*)(\((.*)\))?$", facteur)
    return (clean_facteur_name(match.group(1)), match.group(3)) if match else (None, None)


def clean_facteur_name(nom):
    if not nom:
        return ""
    return re.sub(r"[^a-z]+", " ", unidecode.unidecode(nom).lower().replace("\\\'", "\'")).strip()


def build_jeu(context, nom, hauteur, description):
    clean_jeu_name = (clean_jeu_nom(nom) + ' ' + clean_hauteur(hauteur)).strip()
    jeu = context.data["jeux"].get(clean_jeu_name)
    if jeu is None:
        context.log("Jeu {} n'existe pas".format(clean_jeu_name))
        return None
    return {
        "type": {
            "nom": jeu[0],
            "hauteur": jeu[1],
        },
        "commentaire": description,
    }


def build_jeux(context, _type, definition):
    jeux = []
    for i in range(1, 25 if _type != 'ped' else 20):
        if definition[_type + "_" + str(i) + "_nom"]:
            jeu = build_jeu(context, definition[_type + "_" + str(i) + "_nom"],
                            definition[_type + "_" + str(i) + "_hauteur"], definition[_type + "_" + str(i) + "_spec"])
            if jeu is not None:
                jeux.append(jeu)
    return jeux


etendu = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']


def calc_etendue(note):
    """
    Calcule l'étendue d'un clavier à partir de C1 et du nombre des notes
    """
    return 'C1-' + etendu[(note - 1) % 12] + str((note - 1) / 12 + 1)


def buil_etendues(context, notes, _type):
    """
        Construit l'étendu d'un clavier par le nombre de note, considère que l'on commence toujours à C1
        Pour les claviers en dessous de 48 notes, on ne met rien car on ne connais pas à quel notes ils commences
    """
    if _type == 'ped':
        if notes == '25':
            return 'C1-C3'
        if notes == '26':
            return 'C1-C#3'
        if notes == '27':
            return 'C1-D3'
        if notes == '29':
            return 'C1-E3'
        if notes == '30':
            return 'C1-F3'
        if notes == '32':
            return 'C1-G3'
    if notes == '48':
        return 'C1-B5'
    if notes == '50':
        return 'C1-C#5'
    if notes == '51':
        return 'C1-D5'
    if notes == '53':
        return 'C1-E5'
    if notes == '54':
        return 'C1-F#5'
    if notes == '56':
        return 'C1-G5'
    if notes == '58':
        return 'C1-A5'
    if notes == '61':
        return 'C1-C6'
    context.log("L'étendu du clavier de {} notes n'est pas connus".format(notes))
    return ''


claverTypes = (
    ("Grand-Orgue", ["Grand orgue", "GRAND ORGUE", "Grand Orgue"]),
    ("Récit", ["Récit expressif", "Récif expressif", "Récit expressif et Grand orgue"]),
    ("Pédale", []),
    ("Positif", ["POSITIF", "Positif expressif"]),
    ("Positif de dos", []),
    ("Manuel", ["Clavier", "Clavier expressif"]),
    ("Echo", ["Écho"]),
    ("Solo", []),
    ("Résonnance", ["Résonance"]),
    ("Grand-Chœur", ["Grand-Chœur expressif"]),
    ("Hauptwerk", []),
    ("Pedalwerk", []),
    ("Brustwerk", []),
    ("Mittelwerk", []),
    ("Oberwerk", []),
    ("Rückpositiv", []),
    ("Positiv", []),
    ("Echowerk", []),
    ("Fernwerk", []),
    ("Bombarde", []),
    ("Pedal", []),
    ("I", ["1er clavier", "Premier clavier", "Clavier transpositeur"]),
    ("II", ["2ème clavier", "Deuxième clavier"]),
    ("Clavier d'accouplement", ["Accouplement"]),
    ("Chamade", ["Chamades"]),
    ("Schwellwerk", []),
)


def build_clavier_type(context, clavier):
    for _type, _list in claverTypes:
        if clavier == _type:
            return _type
        for test in _list:
            if clavier == test:
                return _type
    context.log("Clavier {} n'existe pas".format(clavier))


def build_clavier(context, _type, definition):
    if definition[_type + "_notes"]:
        return {
            "_type": build_clavier_type(context, definition[_type]) if _type != 'ped' else 'Pédalier',
            "etendue": buil_etendues(context, definition[_type + "_notes"], _type),
            "is_expressif": "expressif" in definition[_type] if _type != 'ped' else False,
            "jeux": build_jeux(context, _type, definition)
        }
    else:
        return None


siecles = {
    "XV": 1450,
    "XVI": 1550,
    "XVII": 1650,
    "XVIII": 1750,
    "XIX": 1850,
    "XX": 1950,
    "XXI": 2000,
}


def extract_date(text):
    match = re.search(r"([0-9]{4}|[XVI]{2,})(-[0-9]{2,4})?", text)
    if not match:
        return None, None, None
    circa = not ("v." in text or "?" in text)
    annee = match.group(1)
    if "X" in annee:
        annee = siecles.get(annee) if annee in siecles else None
        circa = False
    annee_fin = match.group(2)
    if annee_fin and len(annee_fin) == 3:
        annee_fin = annee[:2] + annee_fin[1:]
    return annee, annee_fin, circa


evenementTypes = (
    ("construction",
     ["construction", "orgue neuf", "orgue de", "orgue par", "premier orgue", "construit", "nouvel orgue",
      "attribue a "]),
    ("reconstruction", ["reconstruction", "reutilisant", "refection", "incorporation", "exhume"]),
    ("destruction", ["destruction", "incendit"]),
    ("restauration", ["restauration"]),
    ("deplacement", ["deplacement", "demenagement", "installation", "transfere", "achat", "transfert", "achete"]),
    ("relevage",
     ["relevage", "entretien", "travaux", "reparation", "installe", "remise en service", "remontage", "revision",
      "remise en etat"]),
    ("modifications",
     ["modification", "transformation", "reharmonisation", "agrandissement", "ajout de", "ajout du ", "a la place de",
      "transforme", "achevement", "jeux neufs", "electrification", "ventilateur"]),
    ("disparition", ["disparition", "destruction"]),
    ("degats", ["degat"]),
    ("inauguration", ["inauguration", "inaugure"]),
    ("classement_mh", ["classement"]),
    ("inscription_mh", ["inscription"]),
)


def extract_type(line):
    """
    Essaye d'extraire le type de l'événement
    """
    line = unidecode.unidecode(line.lower())
    for type, list in evenementTypes:
        for test in list:
            if test in line:
                return type
    return None


def normalize_facteur(context, facteur):
    facteurs = []
    fact = context.data["facteurs"].get(facteur)
    if fact and fact != "None":
        facteurs = fact.split(",")
    else:
        context.log("Facteur {} n'éxiste pas".format(facteur))
    return facteurs


def extract_evenement_facteur(context, line, annee, facteurs):
    found = set()
    line = unidecode.unidecode(line.lower())
    for nom, facteurAnnee in facteurs:
        if facteurAnnee == annee:
            found.add(nom)
        else:
            for part in nom.split(" "):
                if part in line:
                    found.add(nom)
    if len(found) == 0:
        # Chercher dans la liste complète des facteurs
        context.log("Pas de facteur trouvé dans \"{}\" pour {}".format(line, ','.join(map(str, facteurs))))
    _list = []
    for item in found:
        _list.extend(normalize_facteur(context, item))
    return _list


def build_evenements(context, historique, facteurs):
    evenements = []

    if historique['historique']:
        historiques = historique['historique'].split("\n")
        for line in historiques:
            match = re.search(r"(.*) : (.*)", line)
            resume = match.group(2) if match else line
            annee, annee_fin, circa = extract_date(match.group(0)) if match else extract_date(line)
            _type = extract_type(line)
            facteur = extract_evenement_facteur(context, line, annee, facteurs)
            if annee is None or _type is None or resume is None:
                context.log("Historique : {} pour ({}, {}, {})".format(line, annee, _type, resume))
                continue
            evenement = {
                "type": _type,
                "resume": resume,
                "annee": int(annee),
                "annee_fin": int(annee_fin) if annee_fin is not None else None,
                "circa": circa,
                "facteurs": facteur
            }
            evenements.append(evenement)
    return evenements


def has_not_evenements(evenements):
    return (len(evenements) == 0) or all('mh' in event["type"] for event in evenements)


class Export:
    """
        Classes contenant les exports de l'inventaire des paysdelaloire
    """

    def __init__(self):
        self.renseignements = load_file('inventaire_renseignements.json')
        self.mecaniques = to_dict(load_file('inventaire_mecanique.json'))
        self.administratif = to_dict(load_file('inventaire_administratif.json'))
        self.historique = to_dict(load_file('inventaire_historique.json'))
        self.sources = to_dict(load_file('inventaire_sources.json'))
        self.combinaisons = to_dict(load_file('inventaire_combinaisons.json'))
        self.claviers = {
            'c1': to_dict(load_file('inventaire_clavier1.json')),
            'c2': to_dict(load_file('inventaire_clavier2.json')),
            'c3': to_dict(load_file('inventaire_clavier3.json')),
            'c4': to_dict(load_file('inventaire_clavier4.json')),
            'ped': to_dict(load_file('inventaire_pedalier.json'))
        }

    def export_csv(self):
        """
            Export la liste de facteurs, des jeux et des accessoires
            pour construire ensuite une liste avec la valeur contenu sur l'inventaire
        """
        with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'csv', 'jeux.csv'), mode='wt') as file_jeux, \
                open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'csv', 'accessoires.csv'),
                     mode='wt') as file_accessoires, \
                open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'csv', 'facteurs.csv'),
                     mode='wt') as file_facteurs:
            csv_jeux = csv.writer(file_jeux, dialect='excel')
            jeux = set()
            for _type in self.claviers.keys():
                for definition in self.claviers[_type].values():
                    for i in range(1, 25 if _type != 'ped' else 20):
                        if definition[_type + "_" + str(i) + "_nom"]:
                            jeux.add((clean_jeu_nom(definition[_type + "_" + str(i) + "_nom"]),
                                      clean_hauteur(definition[_type + "_" + str(i) + "_hauteur"])))
            csv_jeux.writerows([[j[0], j[1], ''] for j in sorted(jeux, key=lambda tup: tup[0])])

            facteurs = set()
            for orgue in self.renseignements:
                for i in range(1, 8):
                    if orgue["facteur" + str(i)]:
                        facteurs.add(extract_facteur(orgue["facteur" + str(i)])[0])
            csv_facteurs = csv.writer(file_facteurs, dialect='excel')
            [csv_facteurs.writerow([f, '']) for f in sorted(facteurs)]

            csv_accessoires = csv.writer(file_accessoires, dialect='excel')
            accessoires = set()
            for combinaison in self.combinaisons.values():
                for i in range(1, 41):
                    nom = combinaison["comb_" + str(i) + "_nom"]
                    if nom:
                        accessoires.add(clean_accessoire(nom))
            csv_accessoires.writerows([[a, ''] for a in sorted(accessoires)])


class Context:
    def __init__(self, export, data):
        self.id = 0
        self.codification = ''
        self.orgue = None
        self.export = export
        self.data = data
        self.logFile = open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'csv', 'log.csv'), mode='wt')
        self.logCsv = csv.writer(self.logFile, dialect='excel')

    def __del__(self):
        self.logFile.close()
        tqdm.write('End...')

    def line(self, id, codification, orgue):
        self.id = id
        self.codification = codification
        self.orgue = orgue

    def log(self, message):
        tqdm.write(self.codification + ":" + message)
        self.logCsv.writerow([self.codification, message])


def process():
    """
    Process l'inventaire des pays de la loire
    """
    download_imports()
    current = load_imports()
    export = Export()
    export.export_csv()
    data = {
        'accessoires': load_csv_file('accessoires.csv'),
        'facteurs': load_csv_file('facteurs.csv'),
        'jeux': load_csv_file('jeux.csv', key=lambda item: item[0] + ' ' + item[1],
                              value=lambda item: (item[2], item[1]) if item[2] else None)
    }

    result = []
    context = Context(export, data)
    progress = tqdm(export.renseignements, desc="Convertion des orgues")
    for renseignement in progress:
        if renseignement['statut'] == "3":
            id = renseignement['id']
            departement = extract_numero_departement(renseignement['departement'])
            orgue = find_current_organ(current, departement, id)
            if orgue:
                context.line(id, orgue['codification'], orgue)
                try:
                    progress.set_postfix_str(s=orgue['codification'])
                    # Renseignements
                    orgue['emplacement'] = renseignement['emplacement'] if orgue['emplacement'] is None else orgue[
                        'emplacement']
                    orgue['designation'] = renseignement['instrument'] if orgue['designation'] is None else orgue[
                        'designation']
                    orgue['buffet'] = renseignement['buffet'] if orgue['buffet'] is None else orgue['buffet']
                    orgue['diapason'] = renseignement['diapason'] if orgue['diapason'] is None else orgue['diapason']
                    orgue['temperament'] = renseignement['temperament'] if orgue['temperament'] is None else orgue[
                        'temperament']
                    orgue['buffet'] = renseignement['buffet'] if orgue['buffet'] is None else orgue['buffet']
                    if len(orgue['images']) == 0 and renseignement['image'] is not None:
                        orgue['images'].append({
                            "credit": renseignement['credit'] if renseignement[
                                'credit'] else 'www.orguepaysdelaloire.fr',
                            "url": "http://orguepaysdelaloire.fr/inventory/upload/" + renseignement['image']
                        })
                    # Mécanique
                    orgue['transmission_notes'] = generate_transmission(context,
                                                                        export.mecaniques[id]['traction_notes']) if \
                    orgue['transmission_notes'] is None else orgue['transmission_notes']
                    orgue['transmission_commentaire'] = generate_transmission_commentaire(
                        export.mecaniques[id]['traction_notes']) if orgue['transmission_commentaire'] is None else \
                    orgue['transmission_commentaire']
                    orgue['tirage_jeux'] = generate_tirage(context, export.mecaniques[id]['traction_jeux']) if orgue[
                                                                                                                  'tirage_jeux'] is None else \
                    orgue['tirage_jeux']
                    orgue['tirage_commentaire'] = generate_tirage_commentaire(export.mecaniques[id]['traction_jeux']) if \
                    orgue['tirage_commentaire'] is None else orgue['tirage_commentaire']
                    orgue['console'] = export.mecaniques[id]['console'] if orgue['console'] is None else orgue[
                        'console']
                    orgue['sommiers'] = generate_sommiers(export.mecaniques[id]) if orgue['sommiers'] is None else orgue[
                        'sommiers']
                    orgue['soufflerie'] = generate_soufflerie(export.mecaniques[id]) if orgue['soufflerie'] is None else \
                    orgue['soufflerie']
                    # Administratif
                    orgue['proprietaire'] = generate_proprietaire(context, export.administratif[id]['proprietaire']) if \
                    orgue['proprietaire'] is None else orgue['proprietaire']
                    orgue['etat'] = generate_etat(context, export.administratif[id]['etat']) if orgue[
                                                                                                   'etat'] is None else \
                    orgue['etat']
                    if len(orgue['accessoires']) == 0:
                        orgue['accessoires'] = build_accessoires(context, export.combinaisons[id])
                    if len(orgue['claviers']) == 0:
                        for c in ['c1', 'c2', 'c3', 'c4', 'ped']:
                            clavier = build_clavier(context, c, export.claviers[c][id])
                            if clavier is not None:
                                orgue['claviers'].append(clavier)
                    # Evenments
                    facteurs = []
                    for i in range(1, 8):
                        if renseignement["facteur" + str(i)]:
                            facteurs.append(extract_facteur(renseignement["facteur" + str(i)]))
                    if has_not_evenements(orgue['evenements']):
                        orgue['evenements'].extend(build_evenements(context, export.historique[id], facteurs))
                        orgue['evenements'] = sorted(orgue['evenements'], key=lambda i: i['annee'])

                    result.append(orgue)
                except e:
                    context.log(e)

    with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'paysdelaloire.json'), 'w') as outfile:
        json.dump(result, outfile, indent=4, ensure_ascii=False)


if __name__ == '__main__':
    process()
