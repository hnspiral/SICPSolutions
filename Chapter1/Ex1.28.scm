;;; Miller-Rabin test, a number n is prime if there exists a positive interger
;;; a less than n. If raise n to (n-1) power is congruent to 1 modulo n.
;;; For all a < n, test one by one by applying expmod (to raise to a power (n-1)
;;; modulo n check if it is congruent to 1 modulo n)
(define (miller-rabin-prime-test-all-a n)
  (define (try-it a)
	(cond ((= a n) true)
		  ((= (expmod a (- n 1) n) 1)
		   (try-it (+ a 1)))
		  (else false)))
  (try-it 1))

;;; Expmod modified to check for existence of non-trivial-sqrt
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
		 (remainder (square (if (non-trivial-sqrt
						   			(expmod base (/ exp 2) m)
						   			m)
							    0
					      		(expmod base (/ exp 2) m)))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

;;; Procedure to check if x exists, where x is non-trivial sqrt of n
(define (non-trivial-sqrt x n)
  (and (not (= x 1))
	   (not (= x (- n 1)))
	   (= (remainder (square x) n) 1)))

(define (square x) (* x x))
