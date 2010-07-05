(in-package :nixeagle.nutils)

;;; The following from sbcl's deftypes-for-target.lisp
;;; These are derived from CMUCL, and now from SBCL
;;;
;;; These are not a direct copy, documentation and modifications for
;;; portability has been done by nixeagle.
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

;;; NOT from alexandria, found I needed this for npdf and seems to be a
;;; reasonable general purpose type to have defined for anything dealing
;;; with the lisp pretty printer. [2010-05-24 Mon 11:33]
(deftype stream-designator ()
  "Stream type, valid with `write' and friends."
  '(or stream boolean))

(deftype pathname-designator ()
  "Pathnames are strings or special pathname type."
  '(or string pathname))

;;; END
