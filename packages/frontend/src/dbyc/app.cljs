(ns dbyc.app
  (:require
   ["react" :refer (createElement useState)]
   ["react-dom/client" :refer (createRoot)]
   ["@emotion/css" :refer (css)]
   [dbyc.util :refer (html)]))

(def style (css "
  color: #f00;
"))

(defn app []
  (let [[count update-count] (useState 0)]
    (html
     [:div
      {:class-name style :on-click #(update-count inc)}
      count])))

(defn mount []
  (let [root (-> (js/document.getElementById "root") createRoot)]
    (.render root (html [:> app]))))

(defonce init mount)

(defn ^:dev/before-load stop []
  (js/console.log "stop"))

(defn ^:dev/after-load start []
  (mount))
