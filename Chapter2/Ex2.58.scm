;;; Suppose we want to modify the differentiation program so that it works with
;;; ordinary mathematical notation, in which + and * are in infix rather than
;;; prefix operators. Since differentiation program is defined in terms of
;;; abstract data, we can modify it to work with different representations of expressions
;;; solely by changing the predicates. selectors, constructors that define the
;;; representation of the algebraic expressions on which the differentiator
;;; is to operate
;;; a. Show how to do this in order to differentiate algebraic expressions
;;; represented in infix form, such as (x + (3 * (x + (y + 2)))). To simplify
;;; the task, assume that + and * always take two arguments and that expressions
;;; are fully parenthesized
 (define (sum? x)
    (cond ((and (pair? x) (eq? (car x) '+))
		   #t)
		  ((and (pair? x) (eq? (cadr x) '+))
		   (sum? (list '+ (car x) (caddr x))))
		  (else #f)))

  (define (addend s)
    (if (eq? (car s) '+)
	    (cadr s)
		(car s)))
  (define (augend s)
	(if (eq? (car s) '+)
		(if (> (length (cddr s)) 1)
			(cons '+ (cddr s))
			(caddr s))
		(caddr s)))

 (define (product? x)
   (cond ((and (pair? x) (eq? (car x) '*))
		  #t)
		 ((and (pair? x) (eq? (cadr x) '*))
		  (product? (list '* (car x) (caddr x))))
		 (else #f)))
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

