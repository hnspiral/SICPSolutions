;;; Define a generic equality predicate equ? that tests the equality of 2 numbers
;;; and install it in the generic arithmetic package. This operation should work for
;;; ordinary numbers, rational numbers, and complex numbers
(define (equ-number? a b) (= a b))
(define (equ-rational? r1 r2)
  (and (= (numer r1) (numer r2))
	   (= (denom r1) (denom r2))))
(define (equ-complex? z1 z2)
  (and (= (real-part z1) (real-part z2))
	   (= (imag-part z1) (imag-part z2))))
(put 'equ? '(scheme-number scheme-number)
	 (lambda (a b) (tag (equ-number? a b))))
(put 'equ? '(rational rational)
	 (lambda (r1 r2) (tag (equ-rational? r1 r2))))
(put 'equ? '(complex complex)
	 (lambda (z1 z2) (tag (equ-complex? z1 z2))))

