;;; a. If we call apply generic for an operation that is not found in the table
;;; for those types, it will run into an indefinite loop of keeps trying to
;;; coerce to itself.

;;; b. No amendments to be made about coersion of same types arguments, so that
;;; if no operation found in the table, apply-generic will returns an error as
;;; we expected.

;;; c. Modify apply-generic so that it does not try coersion on same type arguments
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
				(if (eq? type1 type2)
				    (apply-generic op a1 a2)
					(let ((t1->t2 (get-coercion type1 type2))
						  (t2->t1 (get-coercion type2 type1)))
					  (cond (t1->t2
							 (apply-generic op (t1->t2 a1) a2))
							(t2->t1
							 (apply-generic op a1 (t2->t1 a2)))
							(else
							 (error "No method for these types"
									(list op type-tags)))))))
              (error "No method for these types"
                     (list op type-tags)))))))

