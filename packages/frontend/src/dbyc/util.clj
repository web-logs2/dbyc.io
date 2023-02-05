(ns dbyc.util
  (:require hicada.compiler))

(defmacro html
  [body]
  (hicada.compiler/compile body {:create-element 'createElement
                                 :transform-fn (comp)
                                 :array-children? false}
                           {} &env))
