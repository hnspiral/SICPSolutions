;;; Sum procedure that perform iteratively

(define (sum term a next b)
  (define (iter a result)
	(if (> a b)
	    result
		(iter (next a) (+ a result))))
  (iter a 0))

(define (identity x) x)

(define (inc x) (+ x 1))


