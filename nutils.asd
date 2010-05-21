(asdf:defsystem :nutils
  :depends-on (:alexandria)
  :serial t
  :components
  ((:file "packages")
   (:module #:standard
            :components
            ((:file "declarations")
             (:file "types")
             (:file "macros")
             (:file "ensure" :depends-on ("declarations"))))
   (:module #:binary
            :components
            ((:file "types")))
   (:module #:package
            :components
            ((:file "basic")))))

;;; END