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

