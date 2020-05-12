;;; Modified  div-interval to signal error if dividing by an interval that
;;; spans zero
(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
		   (>= (upper-bound y) 0))
	  (error "Divisor interval spans zero")
  	  (mul-interval x
					(make-interval (/ 1.0 (upper-bound y))
							  	   (/ 1.0 (lower-bound y))))))

;;; Implementation of interval abstraction
(define (make-interval lower upper)
  (cons lower upper))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

;;; Implement various operations on intervals
;Addition
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
				 (+ (upper-bound x) (upper-bound y))))

;Multiplication
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	   (make-interval (min p1 p2 p3 p4)
					  (max p1 p2 p3 p4))))

;Substraction
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
				 (- (upper-bound x) (lower-bound y))))

 ;;; Width of intervals
 (define (width interval)
   (average (lower-bound interval)
            (upper-bound interval)))

 (define (average a b) (/ (+ a b) 2))









































































































































































































































































































































































































































































































































(require racket/trace)
; ;;; Use substitution to evaluate (add-1 zero)
(define zero
  (lambda (f)
	(lambda (x) x)))

(define test
  (lambda (x) x))
(display (test 10)) (display "\n")
(define test2
  (lambda (f) (test 20)))
(display (test2 30)) (display "\n")
(display ((zero 40) 50)) (display "\n")

(define (add-1 n)
  (lambda (f)
	(lambda (x)
	  (f ((n f) x)))))

; (lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x)) f) x)))

;
;(define zero
;	(lambda (f) (
;		lambda (x) x
;	))
;)
;
;(define (add-1 n)
;	(lambda (f) (
;		lambda (x) (
;			f ((n f) x)
;		)
;	))
;)

(display "\n")
