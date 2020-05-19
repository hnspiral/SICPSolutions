;;; Define a procedure that take a list and return a list of same elements
;;; in reverse order
;;; Iterative process
(define (reverse anylist)
  (define (iter newlist anylist)
	(if (null? anylist)
	    newlist
		(iter (cons (car anylist) newlist)
			  (cdr anylist))))
  (iter '() anylist))

