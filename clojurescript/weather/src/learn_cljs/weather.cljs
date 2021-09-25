(ns ^:figwheel-hooks learn-cljs.weather
  (:require
   [goog.dom :as gdom]
   [reagent.core :as reagent :refer [atom]]
   [reagent.dom :as rdom]))

(defonce app-state (atom {:postal-code ""}))

(defn hello-world []
  [:div
   [:h1 {:class "app-title"} "Hello, World"]])

(rdom/render (fn [] [:p [:input
                         {:type "text"
                          :placeholder "Postal Code"
                          :value (:postal-code @app-state)
                          :on-change (js/console.log "toto")}]]) (gdom/getElement "app"))

;; (defn mount-app-element []
;;   (rdom/render [hello-world] (gdom/getElement "app")))

;; (mount-app-element)


;; (defn ^:after-load on-reload []
;;   (mount-app-element))

