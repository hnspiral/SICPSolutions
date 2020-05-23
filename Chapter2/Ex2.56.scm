;;; Show how to extend the basic differrentiator to handle more kinds of expressions.
;;; For example, impletement the differntiation rule:
;;; d(u^n) / dx = nu^ (n-1) (du/dx)
;;; by adding new caluse to the deriv program and defining appropriate procedures
;;; exponentiation?, base, exponent, and make-exponentiation.
;;; Build in the rules that anything raised to the power of 0 is 1 and
;;; anything raised to the power of 1 is the thing itself
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

(define (make-exponentiation a b)
  (cond ((=number? b 0) 1)
		((=number? b 1) a)
		((and (number? a) (number? b))
		 (* a (make-exponentiation a (- b 1))))
		(else (list '** a b))))

(define (exponentiation? x)
  (eq? (car x) '**))
(define (base e)
  (cadr e))
(define (exponent e)
  (caddr e))

;;; test
(deriv '(** x 3) 'x)
(* 3 (** x 2))
