;;; Representing a rectangle in a plane
;;; A rectangle can be represented as a point origin and a diagonal vector
(define (make-rectangle origin vector)
  (cons origin vector))
(define (origin rectangle)
  (car rectangle))
(define (vector rectangle)
  (cdr rectangle))

;;; Compute perimeter of a given rectangle
(define (perimeter rectangle)
  (let ((side-x (x-vector (vector rectangle)))
		(side-y (y-vector (vector rectangle))))
  	   (* (+ side-x side-y)
	 	  2)))

(define (area rectangle)
  (let ((side-x (x-vector (vector rectangle)))
		(side-y (y-vector (vector rectangle))))
	   (* side-x side-y)))

;;; Representing a vector
(define (make-vector x y)
  (cons x y))
(define (x-vector vector)
  (car vector))
(define (y-vector vector)
  (cdr vector))

;;; Representin a segment in a plane, which is made of start point and end point
(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

;;; Representing a point: as pair of x coordinate and y coordinate
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))




