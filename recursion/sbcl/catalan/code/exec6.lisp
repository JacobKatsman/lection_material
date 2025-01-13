#!/usr/bin/sbcl --script

;;;;
;;;; Compute Catalan Number with recursion (вычисление чисел Каталана рекурентным способом)
;;;; https://ru.wikipedia.org/wiki/Числа_Каталана
;;;; http://www.math.bas.bg/bantchev/misc/catalan.pdf
;;;; https://informatics.msk.ru/mod/book/view.php?id=266&chapterid=58
;;;; https://oeis.org/A000108
;;;; https://www.jdoodle.com/execute-clisp-online
;;;; https://www.tutorialspoint.com/lisp/lisp_constants.htm
;;;; 

;; C_{0}=1\quad
;; \quad C_{n}=\sum _{i=0}^{n-1}C_{i}C_{n-1-i}

(defun CatalansNumbers(i)
    (cond ((= i 0) 1)
          ((= i 1) 1)
          (t (* (/ (+ (* 4 (- i 1)) 2) ( + (- i 1) 2))  (CatalansNumbers  (- i 1))))
    )
)

(defun domain(n acc)
    (cond ((< n 0) acc)
          (t (domain (- n 1) (cons n acc))))
)

(defun  computeFromDomain(n)
    (mapcar (lambda (x) (CatalansNumbers x)) (domain n nil))
)

(defun cli/parameter()
    (let (
        (args sb-ext:*posix-argv*))
        (car (cdr args))))

;; main print
;; Введите количество вершин выпуклого многоугольника (n + 2 - угольника)
;; Еnter the number of vertices of a convex polygon ( n + 2 ver.)
;; input   ./exec6.lisp  <n = 6>
(defun main()
 (terpri)
 (format T "~a" (computeFromDomain (parse-integer (cli/parameter))))
)

(main)



