;;; A direct line segment in the plane can be represented as a pair of
;;; vectors - the vector running from the origin to the start of the segment,
;;; and the vector running from the origin to the end-point of the segment.
(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))




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


