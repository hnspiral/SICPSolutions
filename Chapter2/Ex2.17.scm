(define (length anylist)
  (if (null? anylist)
	  0
	  (+ 1 (length (cdr anylist)))))

(define (last-pair anylist)
  (cond ((null? anylist)
		 (error "List is null"))
		((= (length anylist) 1)
		 anylist)
		(else (last-pair (cdr anylist)))))

(last-pair (list 23 72 149 34))
(34)
