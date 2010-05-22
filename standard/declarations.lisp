(in-package :nutils)


(defmacro eval-always (&body body)
  "Evaluate BODY in all 3 evaluation contexts."
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     ,@body))


(eval-always
  (defun declare-speedy (&key (safety 1) (debug 1) (space 0) (speed 3))
    "Call with readtime eval to tell compiler to choose speed over safety.

  * SPEED is set to 3, the max allowable.
  * SAFETY is set to 1, so any types declared are trusted as is,
    basic argument checking is done.
  * DEBUG is set at 1, enough to give argument information for compiletime
    purposes (at least on sbcl).
  * SPACE is set to 0 to encourage inline expansion."
    `(declare (optimize (speed ,speed) (space ,space) (compilation-speed 0)
               (safety ,safety) (debug ,debug))))
  (defun declare-speedy-unsafe (&key (safety 0) (debug 1) (space 0) (speed 3))
    "Call with readtime eval to tell compiler to go fast and unsafe.

  * SPEED is set to 3, the max allowable.
  * SAFETY is set to 1, so any types declared are trusted as is,
    no checking is done at all!
  * DEBUG is set at 1, enough to give argument information for compiletime
    purposes (at least on sbcl).
  * SPACE is set to 0 to encourage inline expansion."
    (declare-speedy :safety safety :debug debug :space space :speed speed)))