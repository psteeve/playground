(defclass directive ()
  ((selector
    :initarg :selector
    :initform ""
    :reader selector)
   (inputs
    :initarg :inputs
    :reader inputs)
   (outputs
    :initarg :outputs
    :reader outputs)
   (providers
    :initarg :providers
    :reader providers)
   (export-as
    :initarg :export-as
    :reader export-as)
   (queries
    :initarg :queries
    :reader queries)
   (host
    :initarg :host
    :reader host)
   (jit
    :initarg :jit
    :reader jit)))


(defclass component (directive)
  ((change-detection
    :initarg :change-detection
    :initform :default
    :reader change-detection)
   (view-providers
    :initarg :view-providers
    :initform '()
    :reader view-providers)
   (module-id
    :initarg :module-id
    :reader module-id)
   (template-url
    :initarg :template-url
    :reader template-url)
   (template
    :initarg :template
    :reader template)
   (style-urls
    :initarg :style-urls
    :initform '()
    :reader style-urls)
   (styles
    :initarg :styles
    :initform '()
    :reader styles)
   (animations
    :initarg :animations
    :initform '()
    :reader animations)
   (encapsulation
    :initarg :encapsulation
    :reader encapsulation)
   (interpolation
    :initarg :interpolation
    :reader interpolation)
   (entry-components
    :initarg :entry-components
    :initform '()
    :reader entry-components)
   (preserve-white-spaces
    :initarg :preserve-white-spaces
    :initform nil
    :reader preserve-white-spaces)))
