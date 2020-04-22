;; sum of squares of the 2 larger numbers out of three
;; equals sum of squares of all 3 numbers
;; minus square of min number
(define (square x) (* x x))

(define (sum_squares_max_2_out_of_3 x1 x2 x3)
  (- (+ (square x1)
	    (square x2)
	 	(square x3))
	 (square (min x1 x2 x3))))

