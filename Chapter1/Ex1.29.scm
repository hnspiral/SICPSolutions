(define (simpson-integral f a b n)
  (let ((h (/ (- b a) n)))
  		(define (term-element k)
		    (* (cond ((= k 0) 1.0)
					 ((= k n) 1.0)
					 (else
					   (if (is-even? k)
						   2.0
						   4.0)))
			   (f (+ a (* k h)))))
  		(* (/ h 3.0)
	       (sum term-element 0 inc n))))

(define (sum term a next b)
  (if (> a b)
	  0
	  (+ (term a)
		 (sum term (next a) next b))))

(define (inc x) (+ x 1))
(define (is-even? x) (= (remainder x 2) 0))
(define (cube x) (* x x x))
