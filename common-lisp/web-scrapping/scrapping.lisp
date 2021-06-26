(defun make-deps (stream)
  (labels ((recur (deps)
             (if (read-stream:at-end-p stream)
                 deps
                 (progn
                   (push (list :code (string-trim  " " (coerce (read-stream:up-to stream #\Tab) 'string))
                               :name (string-trim  " " (coerce (read-stream:up-to stream #\NewLine) 'string)))
                         deps)
                   (recur deps)))))
    (recur '())))

(setf lparallel:*kernel* (lparallel:make-kernel 4))

(defun test ()
  (lparallel:pmap 'vector
                  #'(lambda (it)
                      (let ((status (nth-value 1 (dex:get it)))) status))
                  (list-maires)))


(defparameter *stream* (read-stream:read-stream-on (filelib:file-at-once "deps.data")))

(defun save-maires ()
  (read-stream:reset *stream*)
  (st-utils:save-data (mapcar #'(lambda (value)
                                  (format nil "https://www.mon-maire.fr/maires-~a-~a"
                                          (getf value :name) (getf value :code)))
                              (make-deps *stream*))
                      "list-maires.data"))

(defun list-maires ()
  (st-utils:load-data "list-maires.data"))

(defun handler-sites ()
  (mapcar #'(lambda (url)
              (lambda ()
                (let* ((request (dex:get url))
                       (parsed-content (lquery:$ (initialize request)))
                       (data (lquery:$ parsed-content ".list-group .list-group-item" (text))))
                  data)))
          (list-maires))))

(defun process-list-maires (list-closure)
  (lparallel:pmap 'vector
                  #'(lambda (it)
                      (funcall  it))
                  list-closure))
