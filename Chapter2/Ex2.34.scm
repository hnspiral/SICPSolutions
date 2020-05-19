;;; Evaluating polynomial using Horner's rule

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
				(+ this-coeff
				   (horner-eval x
				   				(map (lambda (y) (* y x))
									 (cdr coefficient-sequence)))))
			  0
			  coefficient-sequence))

;test
(horner-eval 2 (list 1 3 0 5 0 1))
79



(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

