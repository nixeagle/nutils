(in-package :nutils)

(declaim (inline make-octet-vector))
(defun make-octet-vector (length)
  "Create a vector of octets. No element may be larger then 255."
  (declare ((integer 0 #.(- most-positive-fixnum 7)) length)
           (optimize (speed 3) (safety 1) (debug 1)))
  (the simple-octet-vector (make-array length :element-type 'octet)))