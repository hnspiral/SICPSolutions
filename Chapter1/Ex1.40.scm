
(define (cubic a b c)
  (lambda (x) (+ (cube x)
				 (* a (square x))
				 (* b x)
				 c)))

(define (cube x) (* x x x))

;;; test:
(newston-method (cubic -3 3 -1) 1.0)
;Value: 1.


;;;1.3.4 procedures as Returned Values
(define (average-damp f)
  (lambda (x) (average x (f x))))

;;; Using average damp to define square root
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))))
  1.0)

;;; Using average damp to define cube root
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
			   1.0))

(define (square x) (* x x))

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

;;; Newton's method
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x))
				 dx)))

(define dx 0.00001)

(define (cube x) (* x x x))
((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
	(- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
				  1.0))

;;; Abstraction and first class procedures
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
							newton-transform
							1.0))
































