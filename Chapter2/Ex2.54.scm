;;; Two lists are said to be equal? if they contain equal elements arranges
;;; in the same order.
;;; (equal? '(this is a list) '(this is a list)) is #t
;;; but (equal? '(this is a list) '(this (is a) list)) is #f
;;; To be more precise, we can define equals? recursively in terms of the basic eq?
;;; equality of symbols by saying that a and b are equal? if they both are symbols
;;; and the symbols are eq?, or if they are both lists such that (car a) is equals?
;;; to (car b) and (cdr a) is equal? to (cdr b).
;;; Using this idea implement equal? as a procedure
(define (equal? a b)
  (or (and (and (symbol? a) (symbol? b))
		   (eq? a b))
	  (and (and (pair? a) (pair? b))
		   (equal? (car a) (car b))
		   (equal? (cdr a) (cdr b)))
	  (and (null? a) (null? b))
	  (and (and (number? a) (number? b))
		   (= a b))))


