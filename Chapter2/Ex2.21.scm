;;; Two definitions of square-list.
;;; 1. The explicit way
(define (square-list items)
  (if (null? items)
	'()
	(cons (square (car items))
		  (square-list (cdr items)))))
(define (square x) (* x x))

;;; 2. By mapping procedure square throughout the original list
(define (square-list items)
  (map square items))


;;; Mapping over lists
(define (scale-list items factor)
  (if (null? items)
	'()
	(cons (* (car items) factor)
		  (scale-list (cdr items) factor))))

(scale-list (list 1 2 3 4 5) 10)
;Value 14: (10 20 30 40 50)

(define (map proc items)
  (if (null? items)
	'()
	(cons (proc (car items))
		  (map proc (cdr items)))))

(map abs (list -10 2.5 -11.6 17))
;Value 15: (10 2.5 11.6 17)

(map (lambda (x) (* x x))
	 (list 1 2 3 4))
;Value 16: (1 4 9 16)

(define (abs x)
  (if (< x 0) (- x)
	  x))

