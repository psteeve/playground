(require '[cljs.build.api :as b])
(require '[cljs.repl.nashorn :as nashorn])
(require '[cljs.repl :as repl])

(defmulti task first)

(defmethod task :default 
  [args]
  (let [all-tasks (-> task methods (dissoc :default) keys sort)
        interposed (->> all-tasks (interpose ", ") (apply str))]
    (println "Unknown or missing task. Choose one of:" interposed)
    (System/exit 1)))

(def build-opts 
  {:output-to "main.js"
   :source-map true
   :output-dir "out/"
   :main 'mywebapp.core
   :verbose true
   :optimizations :none})

(defmethod task "build"
  [args]
  (b/build "src" build-opts))

(defmethod task "watch"
  [args]
  (b/watch "src" build-opts))

(defmethod task "repl:nashorn"
  [args]
  (repl/repl (nashorn/repl-env)
             :output-dir "out/nashorn"
             :cache-analysis true))

(task *command-line-args*)