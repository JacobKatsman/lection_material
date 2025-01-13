#!/usr/bin/sbcl --script

;;;; Item may Replicated (repeated/mult) user defined value in the list
;;;; https://www.jdoodle.com/execute-clisp-online
;;;; https://highlight.hohli.com/?language=lisp&theme=googlecode
;;;; https://gist.github.com/tompurl/5174818
;;;;
;;;; email: call89269081096@gmail.com


; This is Approaching recursive logic clause: 
; (format T "~a" (cons "HO" (cons "HO" (cons "HO" nil))))

(defconstant s 7 "How much we want has repeated our_wow?")
(defvar our_wow "HO")

;;; This function recursively build list with repeated values
(defun replicateItem (n) (
;;Count 'cond'-ition statement"                 
    cond ((<= n 0 ) nil)
         (t (cons our_wow (replicateItem (- n 1)))) 
    )
)

(defun numlistToString (lst)
  (when lst
    (concatenate 'string 
                 (write-to-string(car lst)) "-" (numlistToString (cdr lst)))))

;; main print
(format T " Happy new Year 2025! ~a say Santa-Clause now!" (numlistToString(replicateItem s)))
