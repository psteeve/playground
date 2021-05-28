(defparameter *h* (make-hash-table))

(gethash 'batman *h*)

(setf (gethash 'batman *h*) 'gotham-city)


(defclass person ()
  ((first-name
    :initarg :first-name
    :reader first-name)
   (last-name
    :initarg :last-name
    :reader last-name)))


;;; person => age



