;;; Modified mul-interval using Ben' suggestion, which break multiplication
;;; into 9 cases by checking the signs of endpoints of intervals, there is
;;; only one case that requires more than 2 multiplications
;;; Let l1: lower bound of interval 1; u1: upper bound of interval 1
;;;     l2: lower bound of interval 2; u2: upper bound of interval 2

(define (mul-interval i1 i2)
  (let ((l1 (lower-bound i1))
		(u1 (upper-bound i1))
		(l2 (lower-bound i2))
		(u2 (upper-bound i2)))
	  (let ((p1 (* l1 l2))
			(p2 (* l1 u2))
			(p3 (* l2 u1))
			(p4 (* u1 u2)))
		(cond ((and (negative? l1)
					(negative? u1)
					(negative? l2)
					(negative? u2))
			   (make-interval p4 p1))
			  ((and (negative? l1)
					(negative? u1)
					(non-negative? l2)
					(non-negative? u2))
			   (make-interval p2 p3))
			  ((and (negative? l1)
					(negative? u1)
					(negative? l2)
					(non-negative? u2))
			   (make-interval p2 p1))
			  ((and (non-negative? l1)
					(non-negative? u1)
					(negative? l2)
					(negative? u2))
			   (make-interval p3 p2))
			  ((and (non-negative? l1)
					(non-negative? u1)
					(non-negative? l2)
					(non-negative? u2))
			   (make-interval p1 p4))
			  ((and (non-negative? l1)
					(non-negative? u1)
					(negative? l2)
					(non-negative? u2))
			   (make-interval p3 p4))
			  ((and (negative? l1)
					(non-negative? u1)
					(negative? l2)
					(negative? u2))
			   (make-interval p3 p1))
			  ((and (negative? l1)
					(non-negative? u1)
					(non-negative? l2)
					(non-negative? u2))
			   (make-interval p2 p4))
			  ((and (negative? l1)
					(non-negative? u1)
					(negative? l2)
					(non-negative? u2))
			   (make-interval (min p1 p2 p3 p4)
							  (max p1 p2 p3 p4)))))))

(define (negative? x) (< x 0))
(define (non-negative? x) (not (< x 0)))

;;; Define interval programs that deals with numbers represented as a center
;;; value and an additive tolerance
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

;Substraction
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
				 (- (upper-bound x) (lower-bound y))))

 ;;; Width of intervals
 (define (width interval)
   (/ (- (upper-bound interval)
         (lower-bound interval))
	  2.0))

