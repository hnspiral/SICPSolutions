(define (tan-cf x k)
  (cont-frac fn fd x k))

(define (fd i)
  (if (= i 1)
	   1
	   (+ (fd (- i 1)) 2)))


(define (fn x i)
  (cond ((= i 1) x)
		(else (square x))))

(define (square x) (* x x))


 (define (cont-frac n d x k)
   (define (iter i result)
     (if (= i 0)
         result
         (iter (- i 1) (/ (n i x) (- (d i) result)))))
   (iter k 0))

(tan 1)

;Value: 1.5574077246549023

(tan-cf 1.0 2)

;Value: 1.4999999999999998

(tan-cf 1.0 3)

;Value: 1.5555555555555558

(tan-cf 1.0 1000)

;Value: 1.557407724654902

;;; Otherwise, the procedure could be written using lambda (i) without
;;; having to separately define fd and fn, and cont-frac does not have to
;;; be redefined to require x as argument

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
						     x
							 (- (square x))))
			 (lambda (i)  (- (* 2 i) 1))
			 k))

(define (cont-frac n d k)
  (define (iter i result)
	(if (= i 0)
	    result
		(iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))


