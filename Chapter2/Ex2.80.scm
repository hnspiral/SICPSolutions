;;; Define a generic equality predicate =zero? that tests if the argument is zero
;;; and install it in the generic arithmetic package. This operation should work for
;;; ordinary numbers, rational numbers, and complex numbers
(define (=zero-number? a) (= a 0))
(define (=zero-rational? r)
  (= (numer r) 0))
(define (=zero-complex? z)
  (and (= (real-part z) 0)
	   (= (imag-part z) 0)))
(put '=zero? 'scheme-number
	 (lambda (a) (tag (=zero-number? a))))
(put '=zero? 'rational
	 (lambda (r) (tag (=zero-rational? r))))
(put '=zero? 'complex
	 (lambda (z) (tag (=zero-complex? z))))

