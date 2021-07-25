(in-package :web)

(defvar *acceptor* (make-instance 'hunchentoot:easy-acceptor :port 4242))

(setf (hunchentoot:accpetor-document-root *acceptor* (truename #P"../www")))

(defun start-server ()
  (hunchentoot:start *acceptor*))

(defun stop-server ()
  (hunchentoot:stop *acceptor*))

(defparameter *enfants* nil)

(hunchentoot:define-easy-handler (enfants :uri "/enfants" :default-request-type :post)
    ()
  (setf (hunchentoot:content-type*) "text/plain")
  (let ((data (hunchentoot:raw-post-data :force-text 't)))
    (push (parse-enfant (read-stream:read-stream-on data)) *enfants*)
    (format nil "~@[ ~A~]" data)))
