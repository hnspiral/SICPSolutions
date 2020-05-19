;;; Define a procedure square-tree analogous to square-list
;;; Direct definition:
(define (square-tree tree)
  (cond ((null? tree) '())
		((not (pair? (car tree)))
		 (cons (square (car tree))
			   (square-tree (cdr tree))))
		(else
		  (cons (square-tree (car tree))
				(square-tree (cdr tree))))))

;;; Using map and recursion
(define (square-tree tree)
  (map (lambda (sub-tree)
		 (if (pair? sub-tree)
		     (square-tree sub-tree)
			 (square sub-tree)))
	   tree))

;;; test
(square-tree
  (list 1
		(list 2 (list 3 4) 5)
		(list 6 7)))
(1 (4 (9 16) 25) (36 49))

;;; Other notes:
;;; Mapping over trees
;;; Recursive plan for scale tree with a factor
(define (scale-tree tree factor)
  (cond ((null? tree) '())
		((not (pair? (car tree)))
		 (cons (* (car tree) factor)
			   (scale-tree (cdr tree) factor)))
		(else (cons (scale-tree (car tree) factor)
					(scale-tree (cdr tree) factor)))))

;;; Implemeting scale-tree is to regard the tree as sequence of subtrees
;;; and use map
(define (scale-tree tree factor)
  (map (lambda (sub-tree)
		 (if (pair? sub-tree)
		     (scale-tree sub-tree factor)
			 (* sub-tree factor)))
	   tree))

(define (map proc items)
  (if (null? items) '()
	  (cons (proc (car items))
			(map proc (cdr items)))))

