(defclass identifier ()
  ((kind :initarg :kind :initform :identifier)
   (escaped-text :initarg :escaped-text
                 :reader :escaped-text)))



