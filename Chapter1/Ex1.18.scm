;;; Define iterative process for multiplcation procedure in terms of adding,
;;; doubling and halving that uses logarithmic number of steps

(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (is-even? x) (= (remainder x 2) 0))

(define (multi a b)
  (define (multi-iter a b product)
	(cond ((= b 0) product)
		  ((is-even? b)
		   (multi-iter (double a)
					   (halve b)
					   product))
		  (else (multi-iter a
							(- b 1)
							(+ a product)))))
  (multi-iter a b 0))
