(ns myapp.core
  (:require [cljs.nodejs :as nodejs]))

(nodejs/enable-util-print!)


(defun -main
  [& args]
  (println "Hello world!"))

(set! *main-cli-fn* -main)