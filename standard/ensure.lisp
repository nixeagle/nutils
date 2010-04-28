(in-package :nutils)

(defun ensure-list (thing)
  "Make sure THING is a list."
  #.(declare-speedy)
  (if (listp thing)
      thing
      (list thing)))

(defun ensure-car (thing)
  "Get the car of THING or return THING if its not a list."
  #.(declare-speedy)
  (if (consp thing)
      (car thing)
      thing))

(defun ensure-cdr (thing)
  "Returns cdr of thing if its a list, otherwise nil."
  #.(declare-speedy)
  (when (consp thing)
    (cdr thing)))

(defun ensure-proper-cdr (thing)
  "Returns cdr of THING (always a list or nil) if its a list or nil.

This differs from `ensure-cdr' because here we make sure the return type
is a list, so doing things like (ensure-proper-cdr '(1 .1)) will signal a
`type-error'."
  #.(declare-speedy :safety 1)
  (the (values list &optional)
    (when (consp thing)
      (cdr thing))))
