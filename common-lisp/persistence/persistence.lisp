(defclass final (bknr.datastore:store-object)
  ((city :accessor city
         :initarg :city)
   (year :accessor year
         :index-type bknr.indices:unique-index
         :index-reader final-by-year
         :index-values all-finals
         :initarg :year)
   (winner :accessor winner
           :initarg :winner))
  (:metaclass bknr.datastore:persistent-class))


(defun init (filename)
  (let ((object-subsystem
          (make-instance 'bknr.datastore:store-object-subsystem)))
    (make-instance 'bknr.datastore:mp-store
                   :directory filename
                   :subsystems (list object-subsystem))))


(defun add-data ()
  (loop for (city year winner) in '(("Rome" 1934 :ita)
                                    ("Paris" 1938 :ita)
                                    ("Bern" 1954 :deu)
                                    ("Stockholm" 1958 :bra))
        for final = (make-instance 'final :city city
                                          :year year
                                          :winner winner)
        finally (return final)))

