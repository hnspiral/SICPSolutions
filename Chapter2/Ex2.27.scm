;;; Modify reverse procedure to produce a deep reverse procedure that
;;; takes a list as argument and returnds as its value the list with its elements
;;; reversed with all sublists deep reversed as well

(define (deep-reverse anylist)
  (if (null? anylist)
	  '()
	   (if (pair? (car anylist))
		   (reverse (cons (reverse (car anylist))
				          (deep-reverse (cdr anylist))))
		   (reverse (cons (car anylist)
				          (deep-reverse (cdr anylist)))))))

(define (reverse anylist)
  (define (reverse-iter anylist newlist)
	(if (null? anylist)
	    newlist
		(reverse-iter (cdr anylist) (cons (car anylist) newlist))))
  (reverse-iter anylist '()))

;;; test
(define x (list (list 1 2) (list 3 4)))

x
((1 2) (3 4))

(reverse x)
((3 4) (1 2))

(deep-reverse x)
((4 3) (2 1))

