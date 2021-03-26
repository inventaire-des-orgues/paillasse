import os
import logging
import json
import pprint
import re
import unidecode
import csv

logger = logging.getLogger('paysdelaloire')
logger.setLevel(logging.DEBUG)

def loadFile(file):
    with open('export/'+file) as fichier:
        return json.load(fichier)[2]['data']

def loadImport(departement):
    with open('currentinventaire/'+departement+'.json') as renseignements:
        return json.load(renseignements)['results']

def toDict(data):
    return {item['id']:item for item in data}

def loadImports():
    return {
        '44': loadImport('44'),
        '49': loadImport('49'),
        '53': loadImport('53'),
        '72': loadImport('72'),
        '85': loadImport('85'),
    }

def extractNumeroDepartement(departement):
    return re.search('\\(([0-9]+)\\)', departement, re.IGNORECASE).group(1)

def findCurrentOrgan(current, departement, id):
    link = "http://orguepaysdelaloire.fr/inventory/admin_orgue.php?id=" + id
    for item in current[departement]:
        for source in item['sources']:
            if source['lien'] == link:
                return item
    return {}

def generateSoufflerie(mecanique):
    result = mecanique['soufflerie_type']
    if mecanique['soufflerie_spec']:
        result += ", " + mecanique['soufflerie_spec']
    return result

def generateSommiers(mecanique):
    result = mecanique['sommiers_type']
    if mecanique['sommiers_spec']:
        result += ", " + mecanique['sommiers_spec']
    return result

def generateProprietaire(etat):
    if etat is None:
        return ''
    elif 'ville' in etat.lower():
        return "commune"
    elif etat == 'État' or etat == 'Etat':
        return "etat"
    elif etat == 'AOCN':
        return "association_culturelle"
    elif etat == 'Diocèse':
        return "diocese"
    elif etat == 'Paroisse':
        return "paroisse"
    elif (st in etat for st in ['Communauté', 'Congrégation', 'Prieuré']):
        return "congregation"
    elif etat == 'Collège':
        return "etablissement_scolaire"
    elif etat == 'Institut':
        return "conservatoire"
    elif etat == 'Hopital':
        return "hopital"
    else:
        return None

def generateEtat(etat):
    if etat == 'Excellent':
        return "tres_bon"
    elif etat == 'Bon':
        return "bon"
    elif etat == 'Moyen':
        return "altere"
    elif etat == 'Mauvais':
        return "altere"
    elif etat == 'Injouable':
        return "degrade"
    else:
        return None

def generateTransmission(transmission):
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
        return "electrique"
    else:
        return None

def generateTirage(transmission):
    if transmission == 'Mécanique':
        return "mecanique"
    elif transmission == 'Électrique':
        return "electrique"
    elif transmission == 'Électropneumatique':
        return "electro_pneumatique"
    elif transmission == 'Tubulaire':
        return "pneumatique_basse_pression"
    elif transmission == 'Informatique':
        return "electrique"
    else:
        return None

def generateTransmissionCommentaire(transmission):
    if transmission == 'Informatique':
        return transmission
    else:
        return None

def generateTirageCommentaire(transmission):
    if transmission == 'Pneumatique Barker' or transmission == 'Tubulaire' or transmission == 'Informatique':
        return transmission
    else:
        return None

def buildAccessoires(combinaisons):
    accessoires = []
    for i in range(1, 41):
        nom = combinaisons["comb_"+str(i)+"_nom"]
        if nom:
            accessoires.append(nom)
    return accessoires

def cleanHauteur(hauteur):
    if not hauteur:
        return None
    s = re.search('([-0-9IV]+)', hauteur, re.IGNORECASE)
    return s.group(1) if s is not None else None

def cleanJeuNom(nom):
    if not nom:
        return ""
    return unidecode.unidecode(nom.strip().lower().replace("\\\'", "\'"))

def cleanAccessoire(accessoire):
    if not accessoire:
        return ""
    return unidecode.unidecode(accessoire.replace("\\\'", "").replace("\'", "").replace("  ", " ").strip().lower())

def extractFacteur(facteur):
    match = re.search(r"^([^(]*)(\((.*)\))?$", facteur)
    return (cleanFacteurName(match.group(1)), match.group(3)) if match else (None, None)

def cleanFacteurName(nom):
    if not nom:
        return ""
    return re.sub(r"[^a-z]+", " ", unidecode.unidecode(nom).lower().replace("\\\'", "\'")).strip()

def buildJeu(nom, hauteur, description):
    return {
        "type": {
            "nom": cleanJeuNom(nom),
            "hauteur": cleanHauteur(hauteur),
        },
        "commentaire": description,
    }

def buildJeux(type, definition):
    jeux = []
    for i in range(1, 25 if type != 'ped' else 20):
        if definition[type+"_"+str(i)+"_nom"]:
            jeux.append(buildJeu(definition[type+"_"+str(i)+"_nom"], definition[type+"_"+str(i)+"_hauteur"], definition[type+"_"+str(i)+"_spec"]))
    return jeux

def buildClavier(type, definition):
    if definition[type + "_notes"]:
        return {
            "type": definition[type] if type != 'ped' else 'Pédalier',
            "etendue": definition[type + "_notes"],
            "jeux": buildJeux(type, definition)
        }
    else:
        return None
    
class Export:
    '''
        Classes contenant les exports de l'inventaire des paysdelaloire
    '''
    def __init__(self):
        self.renseignements = loadFile('inventaire_renseignements.json')
        self.mecaniques = toDict(loadFile('inventaire_mecanique.json'))
        self.administratif = toDict(loadFile('inventaire_administratif.json'))
        self.historique = toDict(loadFile('inventaire_historique.json'))
        self.sources = toDict(loadFile('inventaire_sources.json'))
        self.combinaisons = toDict(loadFile('inventaire_combinaisons.json'))
        self.claviers = {
            'c1': toDict(loadFile('inventaire_clavier1.json')),
            'c2': toDict(loadFile('inventaire_clavier2.json')),
            'c3': toDict(loadFile('inventaire_clavier3.json')),
            'c4': toDict(loadFile('inventaire_clavier4.json')),
            'ped': toDict(loadFile('inventaire_pedalier.json'))
        }
    
    def exportCSV(self):
        '''
            Export la liste de facteurs, des jeux et des accessoires
            pour construire ensuite une liste avec la valeur contenu sur l'inventaire
        '''
        with open('csv/jeux.csv', mode='wt') as file_jeux, open('csv/accessoires.csv', mode='wt') as file_accessoires, open('csv/facteurs.csv', mode='wt') as file_facteurs:
            csv_jeux = csv.writer(file_jeux, dialect='excel')
            jeux = set()
            for type in self.claviers.keys():
                for definition in self.claviers[type].values():
                    for i in range(1, 25 if type != 'ped' else 20):
                        if definition[type+"_"+str(i)+"_nom"]:
                            jeux.add((cleanJeuNom(definition[type+"_"+str(i)+"_nom"]), cleanHauteur(definition[type+"_"+str(i)+"_hauteur"])))
            csv_jeux.writerows([[j[0], j[1], ''] for j in sorted(jeux, key=lambda tup: tup[0])])

            facteurs = set()
            for orgue in self.renseignements:
                for i in range(1, 8):
                    if orgue["facteur"+str(i)]:
                        facteurs.add(extractFacteur(orgue["facteur"+str(i)])[0])
            csv_facteurs = csv.writer(file_facteurs, dialect='excel')
            [csv_facteurs.writerow([f, '']) for f in sorted(facteurs)]           

            csv_accessoires = csv.writer(file_accessoires, dialect='excel')
            accessoires = set()
            for combinaison in self.combinaisons.values():
                for i in range(1, 41):
                    nom = combinaison["comb_"+str(i)+"_nom"]
                    if nom:
                        accessoires.add(cleanAccessoire(nom))
            csv_accessoires.writerows([[a, ''] for a in sorted(accessoires)])


def process():
    '''
    Process l'inventaire des pays de la loire
    '''
    current = loadImports()
    export = Export()
    export.exportCSV()
    
    result = []

    for renseignement in export.renseignements:
        if (renseignement['statut'] == "3"):
            id = renseignement['id']
            departement = extractNumeroDepartement(renseignement['departement'])
            orgue = findCurrentOrgan(current, departement, id)
            if orgue:
                print(id, orgue['codification'], renseignement['edifice'], renseignement['ville'])
                # Renseignements
                orgue['emplacement'] = renseignement['emplacement'] if orgue['emplacement'] is None else orgue['emplacement']
                orgue['designation'] = renseignement['instrument'] if orgue['designation'] is None else orgue['designation']
                orgue['buffet'] = renseignement['buffet'] if orgue['buffet'] is None else orgue['buffet']
                orgue['diapason'] = renseignement['diapason'] if orgue['diapason'] is None else orgue['diapason']
                orgue['temperament'] = renseignement['temperament'] if orgue['temperament'] is None else orgue['temperament']
                orgue['buffet'] = renseignement['buffet'] if orgue['buffet'] is None else orgue['buffet']
                if len(orgue['images']) == 0:
                    orgue['images'].append({
                        "credit": renseignement['credit'] if renseignement['credit'] else 'www.orguepaysdelaloire.fr',
                        "is_principale": True,
                        "image": "http://orguepaysdelaloire.fr/inventory/upload/"+renseignement['image']
                    })
                # Mécanique
                orgue['transmission_notes'] = generateTransmission(export.mecaniques[id]['traction_notes']) if orgue['transmission_notes'] is None else orgue['transmission_notes']
                orgue['transmission_commentaire'] = generateTransmissionCommentaire(export.mecaniques[id]['traction_notes']) if orgue['transmission_commentaire'] is None else orgue['transmission_commentaire']
                orgue['tirage_jeux'] = generateTirage(export.mecaniques[id]['traction_jeux']) if orgue['tirage_jeux'] is None else orgue['tirage_jeux']
                orgue['tirage_commentaire'] = generateTirageCommentaire(export.mecaniques[id]['traction_jeux']) if orgue['tirage_commentaire'] is None else orgue['tirage_commentaire']
                orgue['console'] = export.mecaniques[id]['console'] if orgue['console'] is None else orgue['console']
                orgue['sommiers'] = generateSommiers(export.mecaniques[id]) if orgue['sommiers'] is None else orgue['sommiers']
                orgue['soufflerie'] = generateSoufflerie(export.mecaniques[id]) if orgue['soufflerie'] is None else orgue['soufflerie']
                # Administratif
                orgue['proprietaire'] = generateProprietaire(export.administratif[id]['proprietaire']) if orgue['proprietaire'] is None else orgue['proprietaire']
                orgue['etat'] = generateEtat(export.administratif[id]['etat']) if orgue['etat'] is None else orgue['etat']
                if len(orgue['accessoires']) == 0:
                    orgue['accessoires'] = buildAccessoires(export.combinaisons[id])                    
                if len(orgue['claviers']) == 0:
                    for c in ['c1', 'c2', 'c3', 'c4', 'ped']:
                        clavier = buildClavier(c, export.claviers[c][id])
                        if clavier is not None:
                            orgue['claviers'].append(clavier)
                
                result.append(orgue)
    
    with open('paysdelaloire.json', 'w') as outfile:
        json.dump(result, outfile, indent = 4, ensure_ascii=False)
    


if __name__ == '__main__':
    process()
