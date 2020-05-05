(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
	  null-value
	  (combiner
				(if (filter a)
					(term a)
					null-value)
	  			(filtered-accumulate combiner
						   			 null-value
						   			 term
						   			 (next a)
						   			 next
						   			 b
						   			 filter))))

;;; a. sum of the squares of the prime numbers in the interval a to b
(define (sum-square-prime a b)
	(filtered-accumulate + 0 square a inc b prime?))

(define (square x) (* x x))

(define (inc x) (+ x 1))

(define (prime? x)
  (= (smallest-divisor x) x))
(define (smallest-divisor x)
  (find-divisor x 2))
(define (find-divisor x test-divisor)
  (cond ((> (square test-divisor) x) x)
		((divides? test-divisor x) test-divisor)
		(else (find-divisor x (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

;;; b. product of all positive integers less than n that are relatively prime
;;; to n
(define (product-less-than-and-relatively-prime n)
  (define (relatively-prime-to-n? x)
	(define (relatively-prime a b)
	  (= (gcd a b) 1))
	(relatively-prime x n))
  (filtered-accumulate * 1 identity 1 inc n relatively-prime-to-n?))

(define (gcd a b)
  (cond ((> b a) (gcd b a))
		((= b 0) a)
		(else (gcd b (remainder a b)))))






