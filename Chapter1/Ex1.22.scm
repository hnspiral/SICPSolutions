(define (search-for-primes low high)
  (define (search-iter n)
	(timed-prime-test n)
	(if (> (+ n 2) high)
	    (display "")
		(search-iter (+ n 2))))
  (search-iter low))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
	  (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;;; Define procedure for primality test
(define (prime? n)
  (= (smallest-divisor n) n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else
		  (find-divisor n (+ test-divisor 1)))))

(define (divides? n test-divisor)
  (= (remainder n test-divisor) 0))




