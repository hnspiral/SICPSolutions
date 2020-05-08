(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;;; Using substitution model:
;;; car z
(car (cons x y))
((cons x y) (lambda (p q) p))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
x

;;; cdr z
(cdr (cons x y))
((cons x y) (lambda (p q) q))
((lambda (m) (m x y)) (lambda (p q) q))
((lambda (p q) q) x y)
y
