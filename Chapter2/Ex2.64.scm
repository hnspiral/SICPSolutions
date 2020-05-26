;;; The following procedure list-tree converts an ordered list to a balanced
;;; binary tree. The helper procedure partial-tree takes as arguments an interger
;;; n and list of at least n elements and constructs a balanced tree containing
;;; the first n elements of the list. The result returned by partial-tree
;;; is pair (formed with cons) whose car is the constructed tree and whose cdr
;;; is the list of elements not included in the tree.

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
	(cons '() elts)
	(let ((left-size (quotient (- n 1) 2)))
	  (let ((left-result (partial-tree elts left-size)))
		(let ((left-tree (car left-result))
			  (non-left-elts (cdr left-result))
			  (right-size (- n (+ left-size 1))))
		  (let ((this-entry (car non-left-elts))
				(right-result (partial-tree (cdr non-left-elts)
											right-size)))
			(let ((right-tree (car right-result))
				  (remaining-elts (cdr right-result)))
			  (cons (make-tree this-entry left-tree right-tree)
					remaining-elts))))))))

;;; a. Write a short para explaining as clearly as you can how partial-tree works.
;;; Draw the tree produced by list->tree for the list (1 3 5 7 9 11).

> (list->tree (list 1 3 5 7 9 11))
'(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
> (list->tree '())
'()

;;; If we call partial-tree on an empty list, it would return an empty binary tree.
;;; If it is not called on an empty list, it would calculate the number of
;;; elements that goes to the left subtree. In the case above, (quotient
;;; (- n 1) 2) = (quotient (- 6 1) 2) = 2, giving the left sub tree 2 elements
;;; and right subtree (- n (+ left-size 1)) = (- 6 (+ 2 1)) = 3.
;;; It would use the first 2 elements for building the left subtree (recursively
;;; call partial tree on the original list and n = left size =2), the used elements
;;; (list 5 7 9 11) is assigned to non-left-list, its beginning (car) which is
;;; 5 is used as current node (entry point), and the rest are used in the recursive
;;; call on partial-tree (list 1 3 5 7 9 11), n = 3 to build the right subtree
;;; this continue until it reach to tips of the trees (the leaves - which are
;;; build as empty binary)

;;; b. What is the order of growth in the number of steps required by list->tree
;;; to convert a list of n elements
;;; On each node, and partial-tree is called, so the order of growth is (1)
;;; on each node.
;;; List-tree make one call on partial-tree using the length n.
;;; which means list->tree is an n order-of-growth operation






















