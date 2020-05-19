;;; Redefine count-leaves as an accumulation
(define (count-leaves t)
  (accumulate +
			  0
			  (map (lambda (x) (if (pair? x)
								   (count-leaves x)
								   1))
				   t)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


