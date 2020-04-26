;;; If we apply transformation Tpq twice:
;;; 1st round:
;;; a <- bq + aq +ap
;;; b <- bp + aq
;;; 2nd round:
;;; a <- bq +aq + ap
;;;   <- q (bp + aq) + q (bq + aq +ap) + p (bp + aq + ap)
;;;   = bpq + aq^2 + bq^2 + ap^2 + apq + bpq + apq +ap^2
;;;   = b (2pq + q^2) + a (2pq + q^2) + a (p^2 + q^2)

;;; b <- bp + aq
;;;   <- (bp + aq)p + (bq + aq +ap)q
;;;   <- bp^2 + apq + bq^2 + aq^2 + apq
;;;   <- b (p^2 + q^2) + a (2pq + q^2)

;;; Thus we can compute p' and q' in terms of p and q:
;;; p' = p^2 + q^2
;;; q' = 2pq + q^2

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
		((is-even? count)
		 (fib-iter a
				   b
				   (+ (square p) (square q))
				   (+ (* 2 p q) (square q))
				   (/ count 2)))
		(else (fib-iter (+ (* b q) (* a q) (* a p))
						(+ (* b p) (* a q))
						p
						q
						(- count 1)))))
