;;;a. Define cont-frac procedure
(define (cont-frac n d k)
  (define (recur i)
  (if (> i k)
	  0
	  (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1.0))

;;; Test cont-frac with n = 1 and d = 1
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1000)
Value: .6180339887498948

;;;b. Define cont-frac as iterative process
(define (cont-frac n d k)
  (define (iter i result)
	(if (= i 0)
	    result
		(iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))
