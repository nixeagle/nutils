(in-package :nutils)

(defun ensure-list (thing)
  "Make sure THING is a list."
  #.(declare-speedy)
  (if (listp thing)
      thing
      (list thing)))