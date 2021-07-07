(defparameter *base-directory* (uiop:native-namestring "~/.france/entreprises/"))
(defparameter *entreprises-store* (uiop:native-namestring "~/.france/entreprises/entreprises-store/"))


(defclass unite-legale (bknr.datastore:store-object)
  ((siren :initarg siren :reader siren :initform nil)
   (statut-diffusion-unite-legale :initarg statut-diffusion-unite-legale :reader
                                  statut-diffusion-unite-legale :initform nil)
   (unite-purgee-unite-legale :initarg unite-purgee-unite-legale :reader
                              unite-purgee-unite-legale :initform nil)
   (date-creation-unite-legale :initarg date-creation-unite-legale :reader
                               date-creation-unite-legale :initform nil)
   (sigle-unite-legale :initarg sigle-unite-legale :reader sigle-unite-legale
                       :initform nil)
   (sexe-unite-legale :initarg sexe-unite-legale :reader sexe-unite-legale
                      :initform nil)
   (prenom1-unite-legale :initarg prenom1-unite-legale :reader
                         prenom1-unite-legale :initform nil)
   (prenom2-unite-legale :initarg prenom2-unite-legale :reader
                         prenom2-unite-legale :initform nil)
   (prenom3-unite-legale :initarg prenom3-unite-legale :reader
                         prenom3-unite-legale :initform nil)
   (prenom4-unite-legale :initarg prenom4-unite-legale :reader
                         prenom4-unite-legale :initform nil)
   (prenom-usuel-unite-legale :initarg prenom-usuel-unite-legale :reader
                              prenom-usuel-unite-legale :initform nil)
   (pseudonyme-unite-legale :initarg pseudonyme-unite-legale :reader
                            pseudonyme-unite-legale :initform nil)
   (identifiant-association-unite-legale :initarg
                                         identifiant-association-unite-legale :reader
                                         identifiant-association-unite-legale :initform nil)
   (tranche-effectifs-unite-legale :initarg tranche-effectifs-unite-legale
                                   :reader tranche-effectifs-unite-legale :initform nil)
   (annee-effectifs-unite-legale :initarg annee-effectifs-unite-legale :reader
                                 annee-effectifs-unite-legale :initform nil)
   (date-dernier-traitement-unite-legale :initarg
                                         date-dernier-traitement-unite-legale :reader
                                         date-dernier-traitement-unite-legale :initform nil)
   (nombre-periodes-unite-legale :initarg nombre-periodes-unite-legale :reader
                                 nombre-periodes-unite-legale :initform nil)
   (categorie-entreprise :initarg categorie-entreprise :reader
                         categorie-entreprise :initform nil)
   (annee-categorie-entreprise :initarg annee-categorie-entreprise :reader
                               annee-categorie-entreprise :initform nil)
   (date-debut :initarg date-debut :reader date-debut :initform nil)
   (etat-administratif-unite-legale :initarg etat-administratif-unite-legale
                                    :reader etat-administratif-unite-legale :initform nil)
   (nom-unite-legale :initarg nom-unite-legale :reader nom-unite-legale :initform
                     nil)
   (nom-usage-unite-legale :initarg nom-usage-unite-legale :reader
                           nom-usage-unite-legale :initform nil)
   (denomination-unite-legale :initarg denomination-unite-legale :reader
                              denomination-unite-legale :initform nil)
   (denomination-usuelle1-unite-legale :initarg
                                       denomination-usuelle1-unite-legale :reader
                                       denomination-usuelle1-unite-legale :initform nil)
   (denomination-usuelle2-unite-legale :initarg
                                       denomination-usuelle2-unite-legale :reader
                                       denomination-usuelle2-unite-legale :initform nil)
   (denomination-usuelle3-unite-legale :initarg
                                       denomination-usuelle3-unite-legale :reader
                                       denomination-usuelle3-unite-legale :initform nil)
   (categorie-juridique-unite-legale :initarg categorie-juridique-unite-legale
                                     :reader categorie-juridique-unite-legale :initform nil)
   (activite-principale-unite-legale :initarg activite-principale-unite-legale
                                     :reader activite-principale-unite-legale :initform nil)
   (nomenclature-activite-principale-unite-legale :initarg
                                                  nomenclature-activite-principale-unite-legale :reader
                                                  nomenclature-activite-principale-unite-legale :initform nil)
   (nic-siege-unite-legale :initarg nic-siege-unite-legale :reader
                           nic-siege-unite-legale :initform nil)
   (economie-sociale-solidaire-unite-legale :initarg
                                            economie-sociale-solidaire-unite-legale :reader
                                            economie-sociale-solidaire-unite-legale :initform nil)
   (caractere-employeur-unite-legale :initarg caractere-employeur-unite-legale
                                     :reader caractere-employeur-unite-legale :initform nil))
  (:metaclass bknr.datastore:persistent-class))


(defclass enterprise (bknr.datastore:store-object)
  ((siren :initarg :siren
          :reader siren
          :initform nil)
   (nic :initarg :nic
        :reader nic
        :initform nil)
   (siret :initarg :siret
          :reader siret
          :initform nil)
   (statut-diffusion-etablissement
    :initarg :statut-diffusion-etablissement
    :reader statut-diffusion-etablissement
    :initform nil)
   (date-creation-etablissement
    :initarg :date-creation-etablissement
    :reader date-creation-etablissement
    :initform nil)
   (tranche-effectifs-etablissement
    :initarg :tranche-effectifs-etablissement
    :reader tranche-effectifs-etablissement
    :initform nil)
   (annee-effectifs-etablissement
    :initarg :annee-effectifs-etablissement
    :reader annee-effectifs-etablissement
    :initform nil)
   (activite-principale-registre-metiers-etablissement
    :initarg :activite-principale-registre-metiers-etablissement
    :reader
    activite-principale-registre-metiers-etablissement
    :initform nil)
   (date-dernier-traitement-etablissement
    :initarg :date-dernier-traitement-etablissement
    :reader date-dernier-traitement-etablissement
    :initform nil)
   (etablissement-siege
    :initarg :etablissement-siege
    :reader etablissement-siege
    :initform nil)
   (nombre-periodes-etablissement
    :initarg :nombre-periodes-etablissement
    :reader nombre-periodes-etablissement
    :initform nil)
   (complement-adresse-etablissement
    :initarg :complement-adresse-etablissement
    :reader complement-adresse-etablissement
    :initform nil)
   (numero-voie-etablissement
    :initarg :numero-voie-etablissement
    :reader numero-voie-etablissement
    :initform nil)
   (indice-repetition-etablissement
    :initarg :indice-repetition-etablissement
    :reader indice-repetition-etablissement
    :initform nil)
   (type-voie-etablissement
    :initarg :type-voie-etablissement
    :reader type-voie-etablissement
    :initform nil)
   (libelle-voie-etablissement
    :initarg :libelle-voie-etablissement
    :reader libelle-voie-etablissement
    :initform nil)
   (code-postal-etablissement
    :initarg :code-postal-etablissement
    :reader code-postal-etablissement
    :initform nil)
   (libelle-commune-etablissement
    :initarg :libelle-commune-etablissement
    :reader libelle-commune-etablissement
    :initform nil)
   (libelle-commune-etranger-etablissement
    :initarg :libelle-commune-etranger-etablissement
    :reader libelle-commune-etranger-etablissement
    :initform nil)
   (distribution-speciale-etablissement
    :initarg :distribution-speciale-etablissement
    :reader distribution-speciale-etablissement
    :initform nil)
   (code-commune-etablissement
    :initarg :code-commune-etablissement
    :reader code-commune-etablissement
    :initform nil)
   (code-cedex-etablissement
    :initarg :code-cedex-etablissement
    :reader code-cedex-etablissement
    :initform nil)
   (libelle-cedex-etablissement
    :initarg :libelle-cedex-etablissement
    :reader libelle-cedex-etablissement :initform nil)

   (code-pays-etranger-etablissement
    :initarg :code-pays-etranger-etablissement
    :reader code-pays-etranger-etablissement :initform nil)    
   (libelle-pays-etranger-etablissement
    :initarg :libelle-pays-etranger-etablissement
    :reader libelle-pays-etranger-etablissement :initform nil)

   
   (complement-adresse2-etablissement :initarg :complement-adresse2-etablissement
                                      :reader complement-adresse2-etablissement :initform nil)
   (numero-voie2-etablissement :initarg :numero-voie2-etablissement :reader
                               numero-voie2-etablissement :initform nil)
   (indice-repetition2-etablissement :initarg :indice-repetition2-etablissement
                                     :reader indice-repetition2-etablissement :initform nil)
   (type-voie2-etablissement :initarg :type-voie2-etablissement :reader
                             type-voie2-etablissement :initform nil)
   (libelle-voie2-etablissement :initarg :libelle-voie2-etablissement :reader
                                libelle-voie2-etablissement :initform nil)
   (code-postal2-etablissement :initarg :code-postal2-etablissement :reader
                               code-postal2-etablissement :initform nil)
   (libelle-commune2-etablissement :initarg :libelle-commune2-etablissement
                                   :reader libelle-commune2-etablissement :initform nil)
   (libelle-commune-etranger2-etablissement :initarg
                                            :libelle-commune-etranger2-etablissement :reader
                                            libelle-commune-etranger2-etablissement :initform nil)
   (distribution-speciale2-etablissement :initarg
                                         :distribution-speciale2-etablissement :reader
                                         distribution-speciale2-etablissement :initform nil)
   (code-commune2-etablissement :initarg :code-commune2-etablissement :reader
                                code-commune2-etablissement :initform nil)
   (code-cedex2-etablissement :initarg :code-cedex2-etablissement :reader
                              code-cedex2-etablissement :initform nil)
   (libelle-cedex2-etablissement :initarg :libelle-cedex2-etablissement :reader
                                 libelle-cedex2-etablissement :initform nil)
   (code-pays-etranger2-etablissement :initarg :code-pays-etranger2-etablissement
                                      :reader code-pays-etranger2-etablissement :initform nil)
   (libelle-pays-etranger2-etablissement :initarg
                                         :libelle-pays-etranger2-etablissement :reader
                                         libelle-pays-etranger2-etablissement :initform nil)
   (date-debut :initarg :date-debut :reader date-debut :initform nil)
   (etat-administratif-etablissement :initarg :etat-administratif-etablissement
                                     :reader etat-administratif-etablissement :initform nil)
   (enseigne1-etablissement :initarg :enseigne1-etablissement :reader
                            enseigne1-etablissement :initform nil)
   (enseigne2-etablissement :initarg :enseigne2-etablissement :reader
                            enseigne2-etablissement :initform nil)
   (enseigne3-etablissement :initarg :enseigne3-etablissement :reader
                            enseigne3-etablissement :initform nil)
   (denomination-usuelle-etablissement :initarg
                                       :denomination-usuelle-etablissement :reader
                                       denomination-usuelle-etablissement :initform nil)
   (activite-principale-etablissement :initarg :activite-principale-etablissement
                                      :reader activite-principale-etablissement :initform nil)
   (nomenclature-activite-principale-etablissement :initarg
                                                   :nomenclature-activite-principale-etablissement :reader
                                                   nomenclature-activite-principale-etablissement :initform nil)
   (caractere-employeur-etablissement :initarg :caractere-employeur-etablissement
                                      :reader caractere-employeur-etablissement
                                      :initform nil))
  (:metaclass bknr.datastore:persistent-class))

(defun make-unite-legale (list)
  (let ((object (make-instance 'unite-legale)))
    (with-slots (siren
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
                 caractere-employeur-unite-legale)
        object
      (bknr.datastore:with-transaction ()
        (setf siren (nth 0 list)) (setf statut-diffusion-unite-legale (nth 1 list))
        (setf unite-purgee-unite-legale (nth 2 list))
        (setf date-creation-unite-legale (nth 3 list))
        (setf sigle-unite-legale (nth 4 list)) (setf sexe-unite-legale (nth 5 list))
        (setf prenom1-unite-legale (nth 6 list))
        (setf prenom2-unite-legale (nth 7 list))
        (setf prenom3-unite-legale (nth 8 list))
        (setf prenom4-unite-legale (nth 9 list))
        (setf prenom-usuel-unite-legale (nth 10 list))
        (setf pseudonyme-unite-legale (nth 11 list))
        (setf identifiant-association-unite-legale (nth 12 list))
        (setf tranche-effectifs-unite-legale (nth 13 list))
        (setf annee-effectifs-unite-legale (nth 14 list))
        (setf date-dernier-traitement-unite-legale (nth 15 list))
        (setf nombre-periodes-unite-legale (nth 16 list))
        (setf categorie-entreprise (nth 17 list))
        (setf annee-categorie-entreprise (nth 18 list))
        (setf date-debut (nth 19 list))
        (setf etat-administratif-unite-legale (nth 20 list))
        (setf nom-unite-legale (nth 21 list))
        (setf nom-usage-unite-legale (nth 22 list))
        (setf denomination-unite-legale (nth 23 list))
        (setf denomination-usuelle1-unite-legale (nth 24 list))
        (setf denomination-usuelle2-unite-legale (nth 25 list))
        (setf denomination-usuelle3-unite-legale (nth 26 list))
        (setf categorie-juridique-unite-legale (nth 27 list))
        (setf activite-principale-unite-legale (nth 28 list))
        (setf nomenclature-activite-principale-unite-legale (nth 29 list))
        (setf nic-siege-unite-legale (nth 30 list))
        (setf economie-sociale-solidaire-unite-legale (nth 31 list))
        (setf caractere-employeur-unite-legale (nth 32 list))))))


(defun make-enterprise (list)
  (let ((object (make-instance 'enterprise)))
    (with-slots (siren 
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
                 )
        object
      (bknr.datastore:with-transaction ()      
        (setf siren (nth 0 list))
        (setf nic (nth 1 list))
        (setf siret (nth 2 list))
        (setf statut-diffusion-etablissement (nth 3 list))
        (setf date-creation-etablissement (nth 4 list))
        (setf tranche-effectifs-etablissement (nth 5 list))
        (setf annee-effectifs-etablissement (nth 6 list))
        (setf activite-principale-registre-metiers-etablissement (nth 7 list))
        (setf date-dernier-traitement-etablissement (nth 8 list))
        (setf etablissement-siege (nth 9 list))
        (setf nombre-periodes-etablissement (nth 10 list))
        (setf complement-adresse-etablissement (nth 11 list))
        (setf numero-voie-etablissement (nth 12 list))
        (setf indice-repetition-etablissement (nth 13 list))
        (setf type-voie-etablissement (nth 14 list))
        (setf libelle-voie-etablissement (nth 15 list))
        (setf code-postal-etablissement (nth 16 list))
        (setf libelle-commune-etablissement (nth 17 list))
        (setf libelle-commune-etranger-etablissement (nth 18 list))
        (setf distribution-speciale-etablissement (nth 19 list))
        (setf code-commune-etablissement (nth 20 list))
        (setf code-cedex-etablissement (nth 21 list))
        (setf libelle-cedex-etablissement (nth 22 list))
        (setf code-pays-etranger-etablissement (nth 23 list))
        (setf libelle-pays-etranger-etablissement (nth 24 list))
        (setf complement-adresse2-etablissement (nth 25 list))
        (setf numero-voie2-etablissement (nth 26 list))
        (setf indice-repetition2-etablissement (nth 27 list))
        (setf type-voie2-etablissement (nth 28 list))
        (setf libelle-voie2-etablissement (nth 29 list))
        (setf code-postal2-etablissement (nth 30 list))
        (setf libelle-commune2-etablissement (nth 31 list))
        (setf libelle-commune-etranger2-etablissement (nth 32 list))
        (setf distribution-speciale2-etablissement (nth 33 list))
        (setf code-commune2-etablissement (nth 34 list))
        (setf code-cedex2-etablissement (nth 35 list))
        (setf libelle-cedex2-etablissement (nth 36 list))
        (setf code-pays-etranger2-etablissement (nth 37 list))
        (setf libelle-pays-etranger2-etablissement (nth 38 list))
        (setf date-debut (nth 39 list))
        (setf etat-administratif-etablissement (nth 40 list))
        (setf enseigne1-etablissement (nth 41 list))
        (setf enseigne2-etablissement (nth 42 list))
        (setf enseigne3-etablissement (nth 43 list))
        (setf denomination-usuelle-etablissement (nth 44 list))
        (setf activite-principale-etablissement (nth 45 list))
        (setf nomenclature-activite-principale-etablissement (nth 46 list))
        (setf caractere-employeur-etablissement (nth 47 list))))))

(setf lparallel:*kernel* (lparallel:make-kernel 4))


(defun init-data-store ()
  (when (or (not (boundp 'bknr.datastore:*store*)) (null bknr.datastore:*store*))
    (let ((object-subsystem (make-instance 'bknr.datastore:store-object-subsystem)))
      (make-instance 'bknr.datastore:mp-store
                     :directory *entreprises-store*
                     :subsystems (list object-subsystem)))))

(defun init ()
  (ensure-directories-exist *base-directory*)
  (init-data-store))


(defun processes-lines ()
  (with-open-file (stream "stocketablissement_utf8.csv")
    (labels ((recur ()
               (let ((data (read-x-lines stream 100000)))
                 (if (car data)
                     (progn
                       (dolist (value data)
                         (make-enterprise (uiop:split-string value :separator '(#\,))))
                       (sleep 0.001) ;;; to be replace by a lparallel api
                       (recur))))))
      (recur))))

(defun processes-lines-unites-legales ()
  (with-open-file (stream "StockUniteLegale_utf8.csv")
    (labels ((recur ()
               (let ((data (read-x-lines stream 100000)))
                 (if (car data)
                     (progn
                       (dolist (value data)
                         (make-unite-legale (uiop:split-string value :separator '(#\,))))
                       (sleep 0.001) ;;; to be replace by a lparallel api
                       (recur))))))
      (recur))))

(defun read-x-lines (stream num-of-lines)
  (let ((result '())
        (i 0))
    (labels ((recur ()
               (let ((line (read-line stream nil nil)))
                 (if (and line (< i num-of-lines))
                     (progn
                       (push line result)
                       (incf i)
                       (recur)) ;;; add nil to result if end of file
                     (if (not line) (push nil result))))))
      (recur))
    result))
