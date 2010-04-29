(in-package :nixeagle.nutils)

;;; The following from sbcl's deftypes-for-target.lisp
;;; These are derived from CMUCL, and now from SBCL
;;;
;;; These are not a direct copy, documentation and modifications for
;;; portability has been done by nixeagle.
(deftype string-designator ()
  "Valid arguments to `cl:string'."
  '(or symbol string character))

(deftype package-designator ()
  "Valid arguments to `cl:find-package'."
  '(or string-designator package))

(deftype char-code-designator ()
  "Valid numbers to `code-char'.

This is a range of numbers that have a corresponding character."
  `(integer 0 ,char-code-limit))

(deftype function-designator ()
  "Funcallable type. Works with `funcall'."
  '(or function symbol))