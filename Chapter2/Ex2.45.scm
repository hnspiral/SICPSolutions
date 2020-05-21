;;; Right-split and up-split can be expressed as instances of a general splitting operation.
;;; Define procedure split with the property that evaluating:
(define (split s-and-p s-and-s)
  (lambda (painter n)
	(if (= n 0)
	    painter
		(let ((smaller ((split s-and-p s-and-s) painter (- n 1))))
		  (s-and-p painter (s-and-s smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))
