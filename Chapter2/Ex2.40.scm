;;; Define procedure unique-pairs that. given an integer n, generates the sequence of pairs
;;; (i,j) with 1<=j<i<=n. Use unique-pairs to simplify the definition of prime-sum-pairs
(define (unique-pairs n)
  (flatmap (lambda (i)
			 (map (lambda (j) (list i j))
				  (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n)))


(define (prime-sum-pairs n)
  (map make-pair-sum
	   (filter prime-sum?
			   (unique-pairs n))))
