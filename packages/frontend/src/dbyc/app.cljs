(ns dbyc.app
  (:require ["react" :refer (createElement)])
  (:require ["react-dom/client" :refer (createRoot)]))

(defn init []
  (.render (createRoot (.getElementById js/document "root")) (create-app)))

(defn create-app []
  (createElement "div", nil "hello world"))
