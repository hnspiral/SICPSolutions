;;; Define iterative-improve takes 2 arguments: procedure to test if a guess
;;; is good enough, and a procedure to improve guess
(define (iterative-improve good-enough? improve)
  (define (iter guess)
  	(if (good-enough? guess)
		guess
		(iter (improve guess))))
  (iter 1.0))

;;; Define sqrt procedure in terms of iterative-improve
(define (sqrt x)
  (define (good-enough-sqrt? guess)
	(< (abs (- (square guess) x))
		tolerance))
  (define tolerance 0.0001)
  (define (square x) (* x x))
  (define (improve-sqrt guess)
	  (average guess (/ x guess)))
  (define (average a b) (/ (+ a b) 2))

  (iterative-improve good-enough-sqrt?
					 improve-sqrt))

;;; Define fixed-point procedure in terms of iterative-improve
(define (fixed-point f)
  (define (good-enough-fixed-point? guess)
	(< (abs (- guess (f guess)))
	   tolerance))
  (define tolerance 0.00001)
  (define (improve-fixed-point guess)
	(f guess))
  (iterative-improve good-enough-fixed-point?
					 improve-fixed-point))
