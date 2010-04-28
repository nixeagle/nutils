(in-package :nutils)

(defun ensure-list (thing)
  "Make sure THING is a list."
  #.(declare-speedy)
  (if (listp thing)
      thing
      (list thing)))

(defun ensure-car (thing)
  "Get the car of THING or return THING if its not a list."
  #. (declare-speedy)
  (if (consp thing)
      (car thing)
      thing))

