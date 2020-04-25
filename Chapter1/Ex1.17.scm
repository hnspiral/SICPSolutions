;;; Define multiplcation procedure that uses logarithmic number of steps
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (is-even? x) (= (remainder x 2) 0))

(define (multi a b)
  (cond ((= b 0) 0)
		((is-even? b)
		 (double (multi a (halve b))))
		(else
		  (+ a (multi a (- b 1))))))
