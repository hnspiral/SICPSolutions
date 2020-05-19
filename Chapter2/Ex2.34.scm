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



























































































































































































































































































































































(require racket/trace)
; ;;; Use substitution to evaluate (add-1 zero)
(define zero
  (lambda (f)
	(lambda (x) x)))

(define test
  (lambda (x) x))
(display (test 10)) (display "\n")
(define test2
  (lambda (f) (test 20)))
(display (test2 30)) (display "\n")
(display ((zero 40) 50)) (display "\n")

(define (add-1 n)
  (lambda (f)
	(lambda (x)
	  (f ((n f) x)))))

; (lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x)) f) x)))

;
;(define zero
;	(lambda (f) (
;		lambda (x) x
;	))
;)
;
;(define (add-1 n)
;	(lambda (f) (
;		lambda (x) (
;			f ((n f) x)
;		)
;	))
;)

(display "\n")
