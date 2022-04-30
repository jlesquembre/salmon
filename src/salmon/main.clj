(ns salmon.main
  (:gen-class)
  (:require [clojure.main :as main]
            [salmon.cloudformation.interface :as cfn]
            [salmon.signal.interface :as sig]))

(defn -main []
  (main/repl))
