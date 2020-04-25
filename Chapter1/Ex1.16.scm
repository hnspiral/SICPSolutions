;;; Iterative exponentiation by using successive squaring that uses
;;; logarithmic number of steps.
(define (fast-expt base expo)
  (define (fast-expt-iter base expo product)
	(cond ((= expo 1) (* base product))
		  ((= expo 0) 1)
	  	  ((is-even? expo)
		   (fast-expt-iter (square base)
						   (/ expo 2)
						   product))
	      (else
			(fast-expt-iter base
							(- expo 1)
							(* product base)))))
  (fast-expt-iter base expo 1))

(define (is-even? x) (= (remainder x 2) 0))

(define (square x) (* x x))

