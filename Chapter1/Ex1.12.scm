;;; Procedure pascal take 2 arguments: row-index and column-index of the element
;;; computes and returns value of that element
;;; Element in column 1 of every row has value 1
;;; Element in the last column (column index = row index) of every row has value 1
;;; Otherwise, value of element in row r column c should be computed recursively using
;;; the rule: (pascal r c) = (pascal (r-1) (c-1)) + (pascal (r-1) c)
(define (pascal r c)
  (cond ((= c 1) 1)
		((= r c) 1)
		(else (+ (pascal (- r 1) (- c 1))
		   		 (pascal (- r 1) c)))))

