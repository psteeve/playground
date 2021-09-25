(ns hello_cljs.core)

(def ctx (-> js/document
             (.getElementById "canvas")
             (.getContext "2d")))

(defn draw-shape [x y radius color]
  (set! (.-fillStyle ctx) color)
  (.beginPath ctx)
  (.arc ctx x y radius 0 (* 2 Math/PI))
  (.fill ctx))

(def point {:x 150, :y 150, :radius 100, :color "blue"})

(draw-shape 150 150 100 "blue")


