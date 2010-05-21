(in-package :nutils)

(deftype octet (&optional (size 1))
  "8 bits a byte."
  `(unsigned-byte ,(* 8 size)))

(deftype signed-octet (&optional (size 1))
  "8 bits, a byte with a sign bit."
  `(signed-byte ,(* 8 size)))

(deftype octet-vector (&optional (length '*))
  "Vector of octets."
  `(vector octet ,length))

(deftype simple-octet-vector (&optional (length '*))
  "Simple vector of octets."
  `(simple-array octet (,length)))