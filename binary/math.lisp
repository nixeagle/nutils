;;; Binary related mathematics.

(in-package :nutils)

(defun twos-complement (number bits)
  "Convert NUMBER to the twos complement form.

BITS is how large of a number to be returned as a result.

Valid inputs for NUMBER are:
  2^(1 - BITS) < NUMBER < (1 - 2^(1 - BITS))

Background: Converts numbers back and forth without using a
bitfield. Using this is the same as (bit-xor ...) and adding
one. Conversion is done by treating the signed integers as a ring."
  (declare (integer number)
           (positive-fixnum bits))
  (let ((machine-size (expt 2 bits))
        (max-number-size (expt 2 (- bits 1))))
    (assert (< (- max-number-size) number (1- max-number-size)))
    ;; Using floor instead of mod due to silly sbcl code deletion warning.
    ;; SBCL really ought not be warning on (mod number bits) but it does.
    (nth-value 1
               (if (< number 0)
                   (floor number machine-size)
                   (floor number (- machine-size))))))
