;;; a. Define accummulate procedure that is the general notion of
;;; sum and product
(define (accumulate combiner null-value term a next b)
  (if (> a b)
	  null-value
	  (combiner (term a)
				(accumulate combiner
							null-value
							term
							(next a)
							next
							b))))

;;; Define sum and product in terms of accumulate
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

;;; b. Define accummulate that generate iterative process:
(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter a result)
	(if (> a b)
	    result
		(accumulate-iter (next a) (combiner result (term a)))))
  (accumulate-iter a null-value))
