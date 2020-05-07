(define (n-root n x)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (exp y (- n 1)))))
						 (time-repeat n))
			   1.0))
(define (time-repeat n)
  (/ (log n) (log 2)))

;;; Define repeat procedure
(define (repeated f power)
  (if (= power 1)
      (lambda (x) (f x))
      (compose f (repeated f (- power 1)))))

(define (compose f g)
  (lambda (x) (f (g x))))

;;; Define exponential procedure:
(define (exp base expo)
  (if (= expo 0)
	  1
	  (* base (exp base (- expo 1)))))

;;; Define procedure to find fixed-point
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

;;; Define average-damp
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b)
  (/ (+ a b) 2))

;;; Test:
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
			   1.0))
; sufficient average-damp: 1

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
			   1.0))
(define (square x) (* x x))
; sufficient average-damp: 1

(define (quad-root x)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (cube y))))
						 2)
			   			 1.0))
(define (cube x) (* x x x))
; sufficient average-damp: 2

(define (fifth-root x)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (exp y 4))))
                         2)
                         1.0))
; sufficient average-damp: 2

;;; => sufficient average-damp required for n-root: log 2 n




















