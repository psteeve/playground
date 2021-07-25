(defpackage :web
  (:use
   :common-lisp))

(in-package :web)

(defclass enfant ()
  ((civilite :initarg :civilite
             :initform (error "Must provide value for \"civilite\"")
             :reader civilite)
   (nom :initarg :nom
        :initform (error "Must provide value for \"nom\"")
        :reader nom)
   (prenom :initarg :prenom
           :initform (error "Must provide value for \"prenom\"")
           :reader prenom)
   (date-naissance :initarg :date-naissance
                   :initform (error "Must provide value for \date-naissance\"")
                   :reader date-naissance)))

(defun make-enfant (civilite nom prenom date-naissance)
  (make-instance 'enfant
                 :civilite civilite
                 :nom nom
                 :prenom prenom
                 :date-naissance date-naissance))

(defmethod print-object ((enfant enfant) stream)
  (with-slots (
               nom prenom
               civilite date-naissance)
      enfant
    (format stream
            "#<nom: ~a prenom: ~a :civilite ~a date-naissance: ~a>" nom prenom civilite date-naissance)))


(defun parse-enfant (stream)
  (let ((sexp (st-utils:flatten
               (mapcar #'st-utils:normalize
                       (remove-if-not #'(lambda (string) (not (equal string "")))
                                      (parse-keyword-separator-stream stream))))))
    (make-instance 'enfant
                   :civilite (getf sexp :|civilite|)
                   :nom (getf sexp :|nom|)
                   :prenom (getf sexp :|prenom|)
                   :date-naissance (getf sexp :|naissance|))))

(defun parse-keyword-separator-stream (stream)
  "Example :key value :key1 value2 :key3 value3 => (\"key value\" \"key1 value1\" \"key2 value2\" \"key3 value3\")"
  (labels ((recur (result at-end-p)
             (if at-end-p
                 (reverse result)
                 (recur (push (string-trim " " (coerce
                                                (read-stream:up-to stream #\:) 'string))
                              result)
                        (read-stream:at-end-p stream)))))
    (recur '() (read-stream:at-end-p stream))))
