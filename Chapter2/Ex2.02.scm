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

;;; Define procedure midpoint segment that takes a line segment as argument
;;; and returns its midpoint
(define (midpoint segment)
  (let ((x-midpoint (average (x-point (start-segment segment))
							 (x-point (end-segment segment))))
		(y-midpoint (average (y-point (start-segment segment))
							 (y-point (end-segment segment)))))
  	   (cons x-midpoint y-midpoint)))
(define (average a b) (/ (+ a b) 2))

(define (print-point point)
  (newline)
  (display "(")
  (display (x-point point))
  (display ",")
  (display (y-point point))
  (display ")"))

;;; test
(define midpointc (midpoint segmentab))
(define segmentab (make-segment pointa pointb))
(define pointa (make-point 2.0 3.0))
(define pointb (make-point 5.0 6.0))
(print-point midpointc)
;Value (3.5,4.5)



