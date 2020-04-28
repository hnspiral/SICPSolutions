;;; Basically, Alyssa's code is similarly functional to achieve the goal of
;;; testing for primality. However it takes much longer time to perform than
;;; original expmod code, if n is a large number, due to the calculation of
;;; remainder x m would take much longer if x is much greater than m.
;;; In original code, (remainder (square (expmod base (/ exp 2) m)) m)
;;; could be achieved by taking (remainder (expmod base (/exp 2) m) m) then
;;; square the result. thus, reducing the chance that interpreter having to
;;; deal with remainder x m when x is much greater than m (since x got reduced
;;; everytime). Thus the original code performs better. Although Alyssa's code
;;; could also achieve the same functionality but much less efficient.

;;; Alyssa's code for expmod:
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
		((is-even? n)
		 (square (fast-expt b (/ n 2))))
		(else
		  (* b (fast-expt b (- n 1))))))

(define (is-even? x)
  (= (remainder x 2) 0))

;;; prime test:
(define (fast-prime? n times)
  (cond ((= times 0) true)
		((fermat-test n)
		 (fast-prime? n (- times 1)))
		(else false)))

(define (fermat-test n)
  (define (try-it a)
	(= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;;; original expmod code:
(define (expmod base exp m)
  (cond ((= exp 0) 1)
		((even? exp)
		 (remainder (square (expmod base (/ exp 2) m))
					m))
		(else
		  (remainder (* base (expmod base (- exp 1) m))
					 m))))


