(ns testing-clj.core
  (:require react-dom))

(.render js/ReactDOM
         (.createElement js/React "h2" nil "hello, React!")
         (.getElementById js/document "app"))

