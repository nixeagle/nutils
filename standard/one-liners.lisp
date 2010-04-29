(in-package :nutils)

(declaim (inline lastcar))
(defun lastcar (list)
  (declare (list list)
           (inline car))
  #.(declare-speedy :safety 1)
  (car (last list)))

