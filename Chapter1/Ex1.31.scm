;;; a. Define product procedure analoguous to sum procedure, that returns the
;;; product of the values of a function at points over a given range
(define (product term a next b)
  (if (> a b)
	  1
	  (* (term a) (product term (next a) next b))))

;;; Define factorial in terms of product
(define (factorial n)
  (product identity 1 inc n))

(define (identity x) x)

(define (inc x) (+ x 1))

;;; Using product to calculate the approximation of pi
(define (estimate-pi n)
  (define (pi-term a)
	(* (/ (- a 1) a)
	   (/ (+ a 1) a)))
  (define (pi-next a)
	(+ a 2))
  (* 4.0 (product pi-term
		   		3.0
		   		pi-next
		   		(+ 3.0 (* n 2.0)))))
