(defpackage #:nixeagle.nutils
  (:use :cl)
  (:nicknames :nutils)
  #.(let (list)
       (do-external-symbols (s :alexandria)
         (unless (member (alexandria:make-keyword (symbol-name s))
                         (list :ensure-car
                               :with-gensyms
                               :ensure-list
                               :lastcar))
           (push (alexandria:make-keyword (symbol-name s)) list)))
       `(:import-from :alexandria ,@list)
       )
  #.(let (list)
       (do-external-symbols (s :alexandria)
         (push  (alexandria:make-keyword (symbol-name s)) list))
       `(:export ,@list))
  (:export #:eval-always
           #:ensure-list
           #:ensure-car
           #:ensure-cdr
           #:ensure-proper-cdr
           #:ensure-class
           #:ensure-string
           #:lastcar
           #:string-designator
           #:package-designator
           #:char-code-designator
           #:function-designator
           #:with-gensyms
           #:octet
           #:make-octet-vector
           #:signed-octet
           #:octet-vector
           #:simple-octet-vector
           #:declare-speedy-unsafe
           #:declare-speedy
           #:stream-designator))


(defpackage #:nixeagle.nutils.packages
  (:use :cl :nutils)
  (:nicknames :nutils.packages)
  (:export #:make-empty-package))