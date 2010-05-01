(in-package :nixeagle.nutils)

;;; simple with-gensyms, don't need or want all of what alexandria does
;;; here.

(defmacro with-gensyms (symbols &body body)
  "Bind SYMBOLS to temporary symbols prefixed with symbol names."
  `(let ,(mapcar (lambda (symbol)
                   `(,symbol (gensym ,(symbol-name symbol))))
                 symbols)
     ,@body))