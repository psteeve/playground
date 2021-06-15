(defun parse-mairie (stream)
  (let ((city (read-stream:up-to stream #\())
        (code-postal (read-stream:up-to stream #\)))
        maire)
    (read-stream:up-to stream #\-)
    (setf maire (read-stream:up-to stream #\NewLine))
    (list :city (string-downcase (string-trim " " (coerce city 'string)))
          :maire (string-trim " " (coerce maire 'string))
          :code-postal (coerce code-postal 'string))))

(defun process-mairie ()
  (with-open-file (in "mairie.data")
    (loop for line = (read-line in nil nil)
          while line
          collect (parse-mairie (read-stream:read-stream-on line)))))

(defun process-at-once (stream)
  (labels ((at-once (result)
             (if (read-stream:at-end-p stream)
                 result
                 (progn
                   (push (parse-mairie stream) result)
                   (at-once result)))))
    (at-once '())))
