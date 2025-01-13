#!/usr/bin/sbcl --script

;;;; Programm for calculation Fibnacci sequences
;;;; https://www.jdoodle.com/execute-clisp-online

;;; FIB computes the the Fibonacci function in the traditional
;;; recursive way.


;; Fibonacci  calc function. 
(defun fib(n)
    (check-type n integer)
    ;; At this point we're sure we have an integer argument.
    ;; Now we can get down to some serious computation.
    (cond  ((= n 0) 0)
           ((= n 1) 1)
           (t ( +  (fib (- n 2))       ; The traditional formula
                   (fib (- n 1)) )))   ; is fib[n-1]+fib[n-2].
)

(defun cli/parameter()
;;Get command line argument" 
    (let (
        (args sb-ext:*posix-argv*))
        (car (cdr args)))
)

(defun makeDomain(num acc)
;;Make domain's interval from 0 to num " 
    (cond ((eq num 0) acc)
          (t (makeDomain (- num 1) (cons num acc))))
)

;; call fib  function for  interval
;; input   ./exec4.lisp  <n = 25>
;; main print
(defun main()
    (terpri)
    (format T "~a" (mapcar 'fib (makeDomain (parse-integer (cli/parameter)) nil)))
)

(main)
