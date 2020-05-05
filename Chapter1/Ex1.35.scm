;;; Golden ratio phi = (1+sqrt 5)/2
;;; to prove that phi is fixed point of function f: f(x) = 1 + 1/x
;;; we have f(phi) = 1 + 1/phi = 1 + 1/((1+sqrt 5)/2)
;;; = (1+ sqrt 5 + 2) / (1 + sqrt 5)
;;; = (3 + sqrt 5) (1 - sqrt 5) / (1 + sqrt 5) (1 - sqrt 5)
;;; = (3 - 3 sqrt 5 + sqrt 5 - 5) / (1 - 5)
;;; = (- 2 - 2 sqrt 5) / -4
;;; = (1 + sqrt 5) /2
;;; = phi
;;; Since f(phi) = phi, phi is fixed-point of function f
;;; To compute phi by fixed-point:

(fixed-point (lambda (x) (+ 1 (/ 1 x)))
			 1.0))

;;; Finding roots of equations by half-interval method
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
	(if (close-enough? neg-point pos-point)
	    midpoint
		(let ((test-value (f midpoint)))
		  (cond ((positive? test-value)
				 (search f neg-point midpoint))
				((negative? test-value)
				 (search f midpoint pos-point))
				(else midpoint))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
		(b-value (f b)))
	(cond ((and (negative? a-value) (positive? b-value))
		   (search f a b))
		  ((and (negative? b-value) (positive? a-value))
		   (search f b a))
		  (else
			((error "Values are not of opposite signs" a b))))))

;;; Finding fixed points of functions
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
  (define (try guess)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		  next
		  (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
			   1.0))



