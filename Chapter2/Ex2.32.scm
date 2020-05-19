;;; Definition og a procedure that generates the set of subsets of a set
(define (subsets s)
  (if (null? s)
	  (list '())
	  (let ((rest (subsets (cdr s))))
		(append rest (map (lambda (x) (cons (car s) x))
						  rest)))))


