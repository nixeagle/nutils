(in-package :nixeagle.nutils.packages)

(deftype package-operation-option ()
  "Valid options for handling existing packages."
  '(member nil :error :supersede))

(defun make-empty-package (package &optional if-exists)
  "Make sure PACKAGE is empty.

IF-EXISTS can be one of three values:
   - :ERROR :: will signal an error if the package already exists.
   - :SUPERSEDE :: will delete any existing package and replace it with a
     new empty package
   - NIL :: will only make a new package if one does not already exist. If
     one does, then that package is returned."
  (declare (package-designator package)
           (package-operation-option if-exists))
  (flet ((make-it () (make-package package :use '())))
    (ecase if-exists
      (:error (make-it))
      ((nil) (or (find-package package) (make-it)))
      (:supersede (and (find-package package) (delete-package package))
                  (make-it)))))

(defun shadowing-import-from-all-external-symbols-form (package)
  "Shadowing-import-from PACKAGE designed to be used with read-eval.

  Call this with #.(shadowing-import-from-all-external-symbols-form ..)"
  (declare (nutils:package-designator package))
  (let (list)
    (do-external-symbols (s package)
      (push s list))
    `(:shadowing-import-from package ,@list)))

;;; END
