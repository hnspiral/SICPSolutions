(define (cons a b)
  (* (exp 2 a)
	 (exp 3 b)))

(define (car x)
  (if (not (= (remainder x 2) 0))
	  0
	  (+ 1 (car (/ x 2)))))

(define (cdr x)
  (if (not (= (remainder x 3) 0))
	  0
	  (+ 1 (cdr (/ x 3)))))

(define (exp base expo)
  (if (= expo 0)
	  1
	  (* base (exp base (- expo 1)))))

test:

1 ]=> (cons 4 5)

;Value: 3888

1 ]=> (car 3888)

;Value: 4

1 ]=> (cdr 3888)

;Value: 5

1 ]=> (car (cons 4 5))

;Value: 4

1 ]=> (cdr (cons 4 5))

;Value: 5

