#!/usr/bin/sbcl --script

;;;; Geometric Progression

(defconstant s 7 "cooef")

;; https://allcalc.ru/node/1001
;; https://en.wikipedia.org/wiki/Geometric_progression


;;; This function recursively build pregression
(defun geometricProgression (summ n)
(
;;Count 'cond'-ition statement"                 
    cond ((<= n 0 ) nil)
         (t (cons ( * summ  s)  (geometricProgression   ( * summ  s ) (- n 1)))) 
    )
)

(defun cli/parameter()
;; Get command line argument" 
    (let (
        (args sb-ext:*posix-argv*))
        (car (cdr args)))
)

;; main print
;; input   ./geometricProgression.lisp  <n = 7>
(defun main()
(terpri)
(time (
       format T "~a  SUMM = ~d"   (geometricProgression 1 (- ( parse-integer (cli/parameter)) 1))
                                  (apply '+ (geometricProgression 1 (- ( parse-integer (cli/parameter)) 1) ))
                                  ))
)

(main)
