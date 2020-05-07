(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
					(f x)
					(f (+ x dx)))
				 3)))

(define (n-fold-smooth f n)
  ((repeated smooth n)) f)

(define (repeated f power)
  (if (= power 1)
	  (lambda (x) (f x))
	  (compose f (repeated f (- power 1)))))

(define (compose f g)
  (lambda (x) (f (g x))))

