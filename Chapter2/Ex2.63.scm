;;; Each of the following procedures converts a binary tree to a list:
(define (tree->list-1 tree)
  (if (null? tree)
	'()
	(append (tree->list-1 (left-branch tree))
			(cons (entry tree)
				  (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
	(if (null? tree)
	  result-list
	  (copy-to-list (left-branch tree)
					(cons (entry tree)
						  (copy-to-list (right-branch tree)
										result-list)))))
  (copy-to-list tree '()))

;;; a. Do the 2 procedures produce the same result for every tree? If not how
;;; do the results differs? what lists do the two produce for the trees 2.16
;;; b. Do the 2 produres have the same order to growth in the number of steps
;;; required to convert a balanced tree with n element to a list? If not which
;;; one grows more slowly

(define tree2 (make-tree 5
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      '())
                           (make-tree 9
                                      (make-tree 7 '() '())
                                      (make-tree 11 '() '()))))
(tree->list-1 tree2)
'(1 3 5 7 9 11)
(tree->list-2 tree2)
'(1 3 5 7 9 11)

;;; The first procedure is recursive in nature. Append id called once at each
;;; n nodes in the tree, tree->list-1 is an n^2 order-of growth operation.
;;; The second procedure is iterative in nature . Tree->list-2 uses cons, on each
;;; current node to put into the result list, this is 1-order-of-growth operation
;;; and performed once each node, Thus, tree->list-2 is an n-order-of-growth
;;; operation




