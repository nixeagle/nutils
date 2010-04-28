(in-package :nutils)


(defmacro eval-always (&body body)
  "Evaluate BODY in all 3 evaluation contexts."
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     ,@body))


(eval-always
  (defun declare-speedy (&key (safety 0) (debug 0) (space 0) (speed 3))
    "Call with readtime eval to tell compiler to go fast and unsafe."
    `(declare (optimize (speed ,speed) (space ,space) (compilation-speed 0)
               (safety ,safety) (debug ,debug)))))