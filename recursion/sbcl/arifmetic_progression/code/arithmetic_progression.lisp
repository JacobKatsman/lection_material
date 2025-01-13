#!/usr/bin/sbcl --script

;;;; Arithmetic Progression

(defconstant s 7 "cooef")

;; https://ru.onlinemschool.com/math/assistance/progression/arithmetic_progression_summ/
;; https://ru.wikipedia.org/wiki/Арифметическая_прогрессия

;;; This function recursively build pregression
(defun arithmeticProgression (summ n)
(
;;Count 'cond'-ition statement"                 
    cond ((<= n 0 ) nil)
         (t (cons ( + summ  s)  (arithmeticProgression (  + summ  s ) (- n 1)))) 
    )
)

(defun cli/parameter()
;; Get command line argument" 
    (let (
        (args sb-ext:*posix-argv*))
        (car (cdr args)))
)

;; main print
;; input   ./arithmetic_progression.lisp  <n = 7>
(defun main()
(terpri)
(time (
       format T "~a  SUMM = ~d"
              (arithmeticProgression 0 (- ( parse-integer (cli/parameter)) 1))
              (apply '+ (arithmeticProgression 0 (- ( parse-integer (cli/parameter)) 1) ))
              )))

(main)
