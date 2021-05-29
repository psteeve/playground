(defclass bag ()
  ((value-store :initarg :value-store
                :reader value-store
                :initform (make-hash-table))
   (size :reader size
         :initform 0)))

(defparameter *value-store* (make-hash-table))

(defun make-bag (&optional (test #'eql))
  (make-instance 'bag :value-store (make-hash-table :test test)))

(defgeneric add-with-occurrences (bag key occurrences)
  (:documentation
   "Include the argument, key, as an element of the Bag
    an occurrence number of times. Answer the argument, key."))

(defmethod add-with-occurrences ((b bag) key occurrences)
  (with-slots (value-store size) b
    (multiple-value-bind (old-occurrences key-exists-p) (gethash key value-store)
      (if key-exists-p
          (progn 
            (setf (gethash key value-store) (+ occurrences old-occurrences))
            (setf size (+ size occurrences)))
          (progn 
            (setf (gethash key value-store) occurrences)
            (setf size occurrences)))))
  key)

(defgeneric add (bag value))

(defmethod add ((b bag) value)
  (add-with-occurrences b value 1))

(defmethod occurrences-of ((b bag) key)
  (with-slots (value-store) b
    (gethash key value-store)))

(defmethod includes? ((b bag) key)
  (with-slots (value-store) b
    (multiple-value-bind (occurrences key-exists-p) (gethash key value-store)
      (and occurrences key-exists-p))))

(defmethod remove-all ((b bag))
  (with-slots (value-store size) b
    (clrhash value-store)
    (setf size 0)
    b))

(defgeneric remove-from (bag key &optional if-absent-callback)
  (:documentation
   "Remove the key in the Bag if occurences is 1 otherwise decrement occurences.
    Or call if-absent-callback function if the key is absent.
    The default key is identity function for if-absent-callback."))

(defmethod remove-from ((b bag) key
                        &optional (if-absent-callback #'(lambda (x) x)))
  (with-slots (value-store size) b
    (multiple-value-bind (old-occurrences key-exists-p) (gethash key value-store)
      (if key-exists-p
          (progn
            (if (equal old-occurrences 1)
                (progn
                  (remhash key value-store)
                  (setf size 0)
                  key)
                (progn
                  (setf (gethash key value-store) (decf old-occurrences))
                  (decf size))))
          (funcall if-absent-callback key)))))

(defmethod for-each ((b bag) callback)
  (with-slots (value-store) b
    (maphash #'(lambda (key occurrences)
                 (dotimes (i occurrences)
                   (funcall callback key)))
             value-store)))

