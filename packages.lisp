(defpackage #:nixeagle.nutils
  (:use :cl)
  (:nicknames :nutils)
  (:export #:eval-always
           #:ensure-list
           #:ensure-car
           #:ensure-cdr
           #:ensure-proper-cdr
           #:ensure-class
           #:ensure-string
           #:lastcar))