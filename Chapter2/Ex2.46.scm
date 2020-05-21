;;; A two-dimentional vector v running from the origin to a point can be
;;; represented as a pair consisting of an x-coordinate and a y-coordinate.
;;; Implement a data abstraction for vectors by giving a constructor
;;; make-vect and corresponding selectors xcor-vect and ycor-vect.
;;; In terms of your selectors and constructor, implement procedures add-vect, sub-vect
;;; scale-vect that perform the operations vector addition, vector substraction
;;; and multiplying a vector by a scalar
(define (make-vect xcor-vect ycor-vect)
  (cons xcor-vect ycor-vect))

(define (xcor-vect vector) (car vector))
(define (ycor-vect vector) (cdr vector))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
			 (+ (ycor-vect v1) (ycor-vect v2))))


(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
			 (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v s)
  (make-vect (* (xcor-vect v) s)
			 (* (ycor-vect v) s)))

