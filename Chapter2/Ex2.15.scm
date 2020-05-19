;;; Using substitution to investigate the different results given by par1
;;; and par2 (assuming all numbers are non negative)
  (par1 r1 r2)
= (div-interval (mul-interval r1 r2)
			    (add-interval r1 r2))
= (div-interval (make-interval (* (lower-bound r1) (lower-bound r2))
							   (* (upper-bound r1) (upper-bound r2)))
				(make-interval (+ (lower-bound r1) (lower-bound r2))
							   (+ (upper-bound r1) (upper-bound r2))))
= (div-interval (make-interval (* l1 l2) (* u1 u2))
				(make-interval (+ l1 l2) (+ u1 u2)))
= (div-interval ((cons l1*l2 u1*u2) (cons l1+l2 u1+u2))
= (mul-interval (l1*l2 u1*u2)
				(make-interval (/ 1.0 (u1+u2))
							   (/ 1.0 (l1+l2))))
= (cons (/ (l1*l2) (u1+u2))
		(/ (u1*u2) (l1+l2)))

  (par2 r1 r2)
= (div-interval one
				(add-interval (div-interval one r1)
							  (div-interval one r2)))
= (div-interval one
				(add-interval (div-interval (make-interval 1 1) r1)
							  (div-interval (make-interval 1 1) r2)))
= (div-interval one
				(add-interval (mul-interval (cons 1 1) ((/ 1.0 u1) (/ 1.0 l1)))
							  (mul-interval (cons 1 1) ((/ 1.0 u2) (/ 1.0 l2)))))
= (div-interval one
				(add-interval (cons (/ 1.0 u1) (/ 1.0 l1))
							  (cons (/ 1.0 u2) (/ 1.0 l2))))
= (div-interval one
				(make-interval (+ (/ 1.0 u1) (/ 1.0 u2))
							   (+ (/ 1.0 l1) (/ 1.0 l2))))
= (div-interval one
				(cons (+ (/ 1.0 u1) (/ 1.0 u2))
					  (+ (/ 1.0 l1) (/ 1.0 l2))))
= (div-interval (cons 1 1)
				(cons (+ (/ 1.0 u1) (/ 1.0 u2))
					  (+ (/ 1.0 l1) (/ 1.0 l2))))
= (mul-interval (cons 1 1)
				(cons (/ 1 (+ (/ 1.0 l1) (/ 1.0 l2)))
					  (/ 1 (+ (/ 1.0 u1) (/ 1.0 u2)))))
= (make-interval (/ 1 (+ (/ 1.0 l1) (/ 1.0 l2)))
				 (/ 1 (+ (/ 1.0 u1) (/ 1.0 u2))))
= (cons (/ (l1*l2) (l1+l2))
		(/ (u1*u2) (u1+u2)))

;;; par1 and par2 are different in the denominators of the bound. par1 will
;;; produce a smaller lower bound and larger upper bound than par2.
;;; Thus par1 produce a wider range interal than par2, which means it is less
;;; accurate in producing calculation of parallel resistance.


;;; TESTING:
(define a (make-center-percent 100 1))
;Value 13: (99. . 101.)

(define b (make-center-percent 150 2))
;Value 14: (147. . 153.)

(par1 a b)
;Value 16: (57.29527559055118 . 62.81707317073172)

(par2 a b)
;Value 17: (59.15853658536585 . 60.838582677165356)

(par1 a a)

;Value 18: (48.51980198019802 . 51.52020202020203)

(par2 a a)

;Value 19: (49.49999999999999 . 50.5)

;;; Lem was right, par1 and par2 did give different answers for the two ways of
;;; computing

;;; LEM'S CODE FOR PARALLEL RESISTORS:
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
				(add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
	(div-interval one
				  (add-interval (div-interval one r1)
								(div-interval one r2)))))

;;; ALYSSA'S SYSTEM:
;;; Systems that accommodate representation of intervals as center and
;;; tolerance
(define (make-center-percent center percent)
  (make-interval (- center (* center (/ percent 100.0)))
                 (+ center (* center (/ percent 100.0)))))

(define (center interval)
  (average (lower-bound interval)
           (upper-bound interval)))
(define (average a b) (/ (+ a b) 2.0))

(define (percent interval)
  (* (- (/ (upper-bound interval) (center interval))
        1.0)
     100.0))

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
;;;Addition
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

;;;;Substraction
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

 ;;; Width of intervals
 (define (width interval)
   (/ (- (upper-bound interval)
         (lower-bound interval))
      2.0))
