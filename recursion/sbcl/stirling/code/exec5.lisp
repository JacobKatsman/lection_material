#!/usr/bin/sbcl --script

;;;;
;;;;  Striling number compute sequnce (вычисление чисел Cтирлинга)
;;;;
;;;;  https://www.cyberforum.ru/pascalabc-net/thread2171410.html
;;;;  https://www.jdoodle.com/execute-clisp-online

(defun stirling(n k)
 (cond ((and (= n 0)  (= k 0)) 1)
       ((or (and (> n 0) (eq k 0)) (and (eq n 0) (> k 0))) 0)
       (t (+ (stirling (- n 1) (- k 1)) ( * (- n 1) (stirling (- n 1) k))))
 )
)

(defun domain(num acc)
    (cond ((< num 0) acc)
         (t (domain (- num 1) (cons num acc))))
    )

(defun  makeDomain(n)
    (mapcar (lambda (k) (stirling n k)) (domain n nil))
)

(defun cli/parameter()
;; Get command line argument" 
    (let (
        (args sb-ext:*posix-argv*))
        (car (cdr args)))
)


;; main print
;; input   ./exec5.lisp  <n = 6>

(defun main()
(terpri)
(time (format T "~a" (reverse(makeDomain (parse-integer (cli/parameter))))))
)

(main)





