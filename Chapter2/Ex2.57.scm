;;; Extend the deriv program to handdle sums and products of arbitrary numbers
;;; of (two or more) terms. Then the last example above could be expressed as:
(deriv '(* x y (+ x 3)) 'x)
;;; try to do this by changing only the representation of sums and products,
;;; without changing deriv procedure at all.

;;; Changes made to representation of sums and products:
(define (sum? x)
   (and (pair? x)
        (eq? (car x) '+)))
 (define (addend s)
   (cadr s))
 (define (augend s)
   (if (> (length (cddr s)) 1)
	   (cons '+ (cddr s))
	   (caddr s)))


 (define (product? x)
   (and (pair? x)
        (eq? (car x) '*)))
 (define (multiplier p)
   (cadr p))
 (define (multiplicand p)
   (if (> (length (cddr p)) 1)
	   (cons '* (cddr p))
   	   (caddr p)))

;;; Procedure deriv stays the same
 (define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp)
          (if (same-variable? exp var)
              1
              0))
         ((sum? exp)
          (make-sum (deriv (addend exp) var)
                    (deriv (augend exp) var)))
         ((product? exp)
          (make-sum (make-product (multiplier exp)
                                  (deriv (multiplicand exp) var))
                    (make-product (multiplicand exp)
                                  (deriv (multiplier exp) var))))
         ((exponentiation? exp)
          (make-product (exponent exp)
                        (make-exponentiation (base exp)
                                             (make-sum (exponent exp) -1))))
         (else
           (error "unkown expression type -- DERIV" exp))))

