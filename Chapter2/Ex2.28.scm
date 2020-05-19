;;; Wirte procedure fringe that takes as argument a tree (represented as a list)
;;; and return a list whose elements are all the leaves of the tree arranged in
;;; left-to-right order

(define (fringe anylist)
  (cond ((not (pair? anylist)) anylist)
	    ((not (pair? (car anylist)))
		  (cons (car anylist)
				(fringe (cdr anylist))))
		(else (append (fringe (car anylist))
					  (fringe (cdr anylist))))))

;;; test
(define x (list (list 1 2) (list 3 4)))

(fringe x)
(1 2 3 4)

(fringe (list x x))
(1 2 3 4 1 2 3 4)

