;;; Width of intervals
(define (width interval)
  (average (lower-bound interval)
		   (upper-bound interval)))

(define (average a b) (/ (+ a b) 2))

;;; Examples to show that width of sum (or difference) of two intervals is a
;;; function of only the widths of the intervals being added (or substracted)
;;; As below, sum of width x1 and width x2 equals to width of interval sum x1 x2
(define sum-x1-x2 (add-interval x1 x2)
  (make-interval (+ (lower-bound x1) (lower-bound x2))
  				 (+ (upper-bound x1) (upper-bound x2))))

  (width sum-x1-x2)
= (average (lower-bound sum-x1-x2)
		   (upper-bound sum-x1-x2))
= (average (+ (lower-bound x1) (lower-bound x2))
		   (+ (upper-bound x1) (upper-bound x2)))
= (/ (+ (lower-bound x1)
		(lower-bound x2)
		(upper-bound x1)
		(upper-bound x2))
	 2)

  (+ (width x1) (width x2))
= (+ (average (lower-bound x1) (upper-bound x1))
	 (average (lower-bound x2) (upper-bound x2)))
= (+ (/ (+ (lower-bound x1) (upper-bound x1)) 2)
	 (/ (+ (lower-bound x2) (upper-bound x2)) 2))
= (/ (+ (lower-bound x1)
		(upper-bound x1)
		(lower-bound x2)
		(upper-bound x2))
	 2)
= (width sum-x1-x2)

;;; Similarly, difference between width x1 and width x2 equals to width of the
;;; intervals x1 and x2 being substracted

(define sub-x1-x2 (sub-interval x1 x2)
  (make-interval (- (lower-bound x1) (upper-bound x2))
  				 (- (upper-bound x1) (lower-bound x2))))

  (width sub-x1-x2)
= (average (lower-bound sub-x1-x2)
		   (upper-bound sub-x1-x2))
= (average (- (lower-bound x1) (upper-bound x2))
		   (- (upper-bound x1) (lower-bound x2)))
= (/ (+ (lower-bound x1)
		(upper-bound x1)
		(- (upper-bound x2))
		(- (lower-bound x2)))
	 2)

  (- (width x1) (width x2))
= (- (average (lower-bound x1) (upper-bound x1))
	 (average (lower-bound x2) (upper-bound x2)))
= (- (/ (+ (lower-bound x1) (upper-bound x1)) 2)
	 (/ (+ (lower-bound x2) (upper-bound x2)) 2))
= (/ (+ (lower-bound x1)
		(upper-bound x1)
		(- (lower-bound x2))
		(- (upper-bound x2)))
	 2)
= (width sub-x1-x2)

;;; However, this is not the case for multiplication and divisions:

(define mul-x1-x2 (mul-interval x1 x2)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	   (make-interval (min p1 p2 p3 p4)
					  (max p1 p2 p3 p4))))

  (width mul-x1-x2)
= (average (lower-bound mul-x1-x2)
		   (upper-bound mul-x1-x2))
= (average (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))
= (/ (+ (min p1 p2 p3 p4)
		(max p1 p2 p3 p4))
	 2)

  (* (width x1) (width x2))
= (* (average (lower-bound x1) (upper-bound x1))
	 (average (lower-bound x2) (upper-bound x2)))
= (* (/ (+ (lower-bound x1) (upper-bound x1)) 2)
	 (/ (+ (lower-bound x2) (upper-bound x2)) 2))
= (/ (+ ((lower-bound x1) (lower-bound x2))
		((lower-bound x1) (upper-bound x2))
		((upper-bound x1) (lower-bound x2))
		((upper-bound x1) (upper-bound x2)))
	 4)
= (/ (+ p1 p2 p3 p4)
	 4)
which is not width mul-x1-x2


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

;Division
(define (div-interval x y)
  (mul-interval x
				(make-interval (/ 1.0 (upper-bound y))
							   (/ 1.0 (lower-bound y)))))

;Substraction
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
				 (- (upper-bound x) (lower-bound y))))










































































































































































































































































































































































































































































































































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
