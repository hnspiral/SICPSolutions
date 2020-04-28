;;; procedure to test for Carmichael number: returns true if meeting
;;; both criteria: failed prime? test and passed fast-prime? test
(define (charmichael? n)
  (and (not (prime? n))
	   (fast-prime? n 10)))

;;; primality test using Brute force (try all divisor if n is the smallest
;;; divisor => n is prime number):
(define (prime? n)
  (= (smallest-divisor n) n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
		 n)
		((divides? test-divisor n)
		 test-divisor)
		(else
		  (find-divisor n (+ test-divisor 1)))))

(define (divides? test-divisor n)
 (= (remainder n test-divisor) 0))


;;; primality test using Fermat method
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (square x) (* x x))
