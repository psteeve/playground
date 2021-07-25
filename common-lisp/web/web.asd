(asdf:defsystem :web
  :serial t
  :components ((:file "src/web")
               (:file "src/config")
               (:file "src/server"))
  :depends-on (:st-utils
               :flot
               :filelib
               :hunchentoot))
