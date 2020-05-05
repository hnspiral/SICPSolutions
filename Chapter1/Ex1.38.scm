(define estimate-e
  (+ 2 (cont-frac (lambda (i) 1.0)
			f
			1000)))
;Value: 2.7182818284590455


(define (f i)
  (cond ((= i 2) 2)
		((= (remainder i 3) 2)
		 (+ (f (- i 1)) (f (- i 2)) (f (- i 3))))
		(else 1)))

;;; Define cont-frac as iterative process
(define (cont-frac n d k)
  (define (iter i result)
	(if (= i 0)
	    result
		(iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))
