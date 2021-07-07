(mapcar #'(lambda (value)
            `(,value :initarg ',value
                     :reader ,value
                     :iniform nil))
        '(siren 
   nic 
   siret 
   statut-diffusion-etablissement 
   date-creation-etablissement 
   tranche-effectifs-etablissement 
   annee-effectifs-etablissement 
   activite-principale-registre-metiers-etablissement 
   date-dernier-traitement-etablissement 
   etablissement-siege 
   nombre-periodes-etablissement 
   complement-adresse-etablissement 
   numero-voie-etablissement 
   indice-repetition-etablissement 
   type-voie-etablissement 
   libelle-voie-etablissement 
   code-postal-etablissement 
   libelle-commune-etablissement 
   libelle-commune-etranger-etablissement 
   distribution-speciale-etablissement 
   code-commune-etablissement 
   code-cedex-etablissement 
   libelle-cedex-etablissement 
   code-pays-etranger-etablissement 
   libelle-pays-etranger-etablissement 
   complement-adresse2-etablissement 
   numero-voie2-etablissement 
   indice-repetition2-etablissement 
   type-voie2-etablissement 
   libelle-voie2-etablissement 
   code-postal2-etablissement 
   libelle-commune2-etablissement 
   libelle-commune-etranger2-etablissement 
   distribution-speciale2-etablissement 
   code-commune2-etablissement 
   code-cedex2-etablissement 
   libelle-cedex2-etablissement 
   code-pays-etranger2-etablissement 
   libelle-pays-etranger2-etablissement 
   date-debut 
   etat-administratif-etablissement 
   enseigne1-etablissement 
   enseigne2-etablissement 
   enseigne3-etablissement 
   denomination-usuelle-etablissement 
   activite-principale-etablissement 
   nomenclature-activite-principale-etablissement 
   caractere-employeur-etablissement  
          ))


(mapcar #'(lambda (value)
            `(,value :initarg ',value
                     :reader ,value
                     :iniform nil))
        '(siren
  statut-diffusion-unite-legale
  unite-purgee-unite-legale
  date-creation-unite-legale
  sigle-unite-legale
  sexe-unite-legale
  prenom1-unite-legale
  prenom2-unite-legale
  prenom3-unite-legale
  prenom4-unite-legale
  prenom-usuel-unite-legale
  pseudonyme-unite-legale
  identifiant-association-unite-legale
  tranche-effectifs-unite-legale
  annee-effectifs-unite-legale
  date-dernier-traitement-unite-legale
  nombre-periodes-unite-legale
  categorie-entreprise
  annee-categorie-entreprise
  date-debut
  etat-administratif-unite-legale
  nom-unite-legale
  nom-usage-unite-legale
  denomination-unite-legale
  denomination-usuelle1-unite-legale
  denomination-usuelle2-unite-legale
  denomination-usuelle3-unite-legale
  categorie-juridique-unite-legale
  activite-principale-unite-legale
  nomenclature-activite-principale-unite-legale
  nic-siege-unite-legale
  economie-sociale-solidaire-unite-legale
          caractere-employeur-unite-legale))


(loop for i from 0 to (length )
                     `(setf ',value (nth )))


(defclass file-reader-stream (flot.stream:flot) ())

(defmethod next ((stream file-reader-stream))
  (read-line (flot.stream:contents stream) nil nil))

(defun read-stream-file-on (filename)
  (make-instance 'file-reader-stream :on (open filename)))
                 
(defvar *s* (read-strem-file-on "StockUniteLegale_utf8.csv"))

(dotimes (i 100000)
           (format t "~a~%" (next *s*)))
