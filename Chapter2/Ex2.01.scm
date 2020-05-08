;;; Define better version of make-rat that handles both positive and negative
;;; arguments

(define (make-rat n d)
  (let ((g (gcd n d)))
	   (if (< d 0)
		   (cons (/ (- n) g) (/ (- d) g))
		   (cons (/ n g) (/ d g)))))

;;; Note: Although we might think there are as many cases to be considered:
;;; (n and d both positive)
;;; (n and d noth negative)
;;; (n is positive and d is negative)
;;; (n is negative and d is positive)
;;; but actually only the positive of d that matters:
;;; if d is positive, we would keep the signs of n and d regardless
;;; if d is negative, we would use the opposite of signs of n and d regardless

