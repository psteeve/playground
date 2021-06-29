;; Simple utility for notes

(defun make-note (stream)
  (labels ((recur (result)
             (if (read-stream:at-end-p stream)
                 (reverse result)
                 (recur (push (string-trim " " (coerce
                                                (read-stream:up-to stream #\:) 'string))
                              result)))))
    (recur '())))

(defun normalize (text)
  (let ((s (uiop:split-string text)))
    (list (st-utils:as-keyword (car s))
          (str:join " " (rest s)))))

(defun list-of-values ()
  (mapcar #'(lambda (value)
              (flatten (mapcar #'normalize value)))
          (mapcar #'(lambda (value)
                      (remove-if #'(lambda (s) (equal s "")) value))  
                  (remove-if #'(lambda (value)
                                 (equal nil value))
                             (mapcar #'make-note
                                     (mapcar #'read-stream:read-stream-on
                                             (filelib:file/lines "../notes")))))))


(defun flatten (list)
  (labels ((rec (list acc)
             (cond ((null list) acc)
                   ((atom list) (cons list acc))
                   (t (rec (car list) (rec (cdr list) acc))))))
    (rec list nil)))
