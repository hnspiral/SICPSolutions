;;; List a:
(define a (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr a)))))
7

;;; List b:
(define b (list (list 7)))
(car (car b))
7

;;; List c:
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c))))))))))))
7

