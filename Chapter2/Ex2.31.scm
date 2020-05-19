;;; Abstract square-tree to produce tree-map with the property that square-tree
;;; be defined as:
(define (square-tree tree) (tree-map square tree))

(define (tree-map proc tree)
  (map (lambda (sub-tree)
		 (if (pair? sub-tree)
		     (tree-map proc sub-tree)
			 (proc sub-tree)))
	   tree))

