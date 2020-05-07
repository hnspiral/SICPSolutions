(define (repeated f power)
  (if (= power 1)
	  (lambda (x) (f x))
	  (compose f (repeated f (- power 1)))))

;;; test
((repeated square 2) 5)

(define (compose f g)
  (lambda (x) (f (g x))))

