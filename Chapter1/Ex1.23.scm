;;; Define procedure for primality test

(define (prime? n)
  (= (smallest-divisor n) n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else
		  (find-divisor n (next test-divisor)))))

(define (next x)
  (if (= x 2)
	  3
      (+ x 2)))

(define (divides? n test-divisor)
  (= (remainder n test-divisor) 0))

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





