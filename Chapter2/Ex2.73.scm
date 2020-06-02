;;; Section 2.3.2 described a program that performs symbolic defferentiation:
(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp)
		 (if (same-variable exp var) 1 0))
		((sum? exp)
		 (make-sum (deriv (addend exp) var)
				   (deriv (augend exp) var)))
		((product? exp)
		 (make-sum
		   (make-product (multiplicand exp)
						 (deriv (multiplier exp) var))
		   (make-product (multiplier exp)
						 (deriv (multiplicand exp) var))))
		<more rules can be added here>
		(else (error "unknown expression type -- DERIV" exp))))

;;; we can regard this program as performing a dispatch on the type of expression
;;; to be diffentiated. In this situation the type tag of the datum is the
;;; algebraic operator symbol (such as +) and the operation being performed
;;; is deriv. We can transform this program into data-directed style by rewriting
;;; the basic derivative procedure as:
(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp) (if (same-variable? exp var) 1 0))
		(else ((get 'deriv (operator exp)) (operands exp)
										   var))))
(define (operator exp) (car exp))
(define (operand exp) (cdr exp))

;;; a. Explain what was done above. Why cant we assimilate the predicates number?
;;; and same-variable? into the data-directed dispatch
;;; The above program dispatch the calculation of derivative based on type of
;;; expression. Types are classified according to the operator of the operations.
;;; However, we cannot assimilate number? and same-variable? into the same
;;; dispatch approach because these 2 specific types can not be dictated by
;;; looking at the operator (number? and variable? have no operator)

;;; b. Write the procedures for the derivatives of sums and products and
;;; the auxiliary code required to install them in the table used by the
;;; program above
(define (deriv-install)
(define (deriv-sum exp var)
  (make-sum (deriv (addend exp) var)
	 	    (deriv (augend exp) var)))
(put 'deriv '+ deriv-sum)

(define (deriv-product exp var)
  (make-sum (make-product (multiplier exp)
						  (deriv (multiplicand exp) var))
			(make-product (multiplicand exp)
						  (deriv (multiplier exp) var))))
(put 'deriv '* deriv-product)
'done)

;;; c. Choose an additional differentiation rule that you like, such as the one
;;; for exponents and install it in this data-directed system
(define (deriv-expo exp var)
  (make-product (expo exp)
				(make-exponentiation base
									 (make-sum (expo exp) -1))))
(put 'deriv '** deriv-expo)

;;; d. In this simple algebraic manipulator the type of an expression is the
;;; algebraic operator that binds it together. Suppose, however, we indexed
;;; the procedures in the opposite way, so that the dispatch line in deriv
;;; looked like
((get (operator exp) 'deriv) (operands exp) var)
;;; What corresponding changes to the derivatives system are required?

;;; We need to change the order of 'put function in the install package
(put '+ 'deriv deriv-sum)
(put '* 'deriv deriv-product)
(put '** 'deriv deriv-expo)










































