;;; Define sqrt procedure that use different end test in good-enough? procedure
;;; a guess if good enough if change from one iteration to the next is a very small
;;; fraction of the guess

(define (sqrt x)
  (define (sqrt-iter guess x)
	(let ((next-guess (improve-guess guess x)))
		 (if (good-enough? guess next-guess)
	     	  guess
			 (sqrt-iter (improve-guess guess x) x))))
  (sqrt-iter 1.0 x))

(define (improve-guess guess x)
  (average guess (/ x guess)))

(define (average a b) (/ (+ a b) 2))

(define (good-enough? guess next-guess)
  (< (/ (abs (- next-guess guess)) guess)
	 tolerance))

(define tolerance 0.00000000000001)

(define (abs x)
  (if (< x 0)
	  (- x)
	  x))
