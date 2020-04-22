;;; Implementing Newton method fot cube roots:

(define (cube-root x)
  (define (cube-root-iter guess x)
	(let ((next-guess (improve-guess guess x)))
	     (if (good-enough? guess next-guess)
		     guess
			 (cube-root-iter (improve-guess guess x) x))))
  (cube-root-iter 1.0 x))

(define (improve-guess guess x)
  (/ (+ (/ x (square guess))
		(* 2 guess))
	 3))

(define (square x) (* x x))

(define (good-enough? guess next-guess)
  (< (/ (abs (- next-guess guess)) guess)
	 tolerance))

(define tolerance 0.0000001)

