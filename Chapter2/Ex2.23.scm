;;; Implement for each procedure that applies the procedure to each of the
;;; elements in return. from left to right.

(define (for-each procedure element-list)
  (cond ((null? element-list) #t)
	    (else (procedure (car element-list))
	  		  (for-each procedure (cdr element-list)))))

;;; test
(for-each (lambda (x) (newline) (display x))
		  (list 57 321 88))


