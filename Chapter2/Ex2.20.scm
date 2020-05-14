;;; Define sampe-parity procedure that takes one or more integers and returns
;;; a list of all the arguments that have the same even-odd parity as the
;;; first argument.

(define (same-parity i . l)
	(define (iter newlist llist)
	  (if (null? llist)
		  (reverse newlist)
		  (if (= (is-even (car llist))
				 (is-even i))
			  (iter (cons (car llist) newlist) (cdr llist))
			  (iter newlist (cdr llist)))))
	(iter (list i) l))

(define (is-even x)
  (if (= (remainder x 2) 0)
	  1
	  0))

(define (reverse anylist)
  (define (iter newlist anylist)
    (if (null? anylist)
        newlist
        (iter (cons (car anylist) newlist)
              (cdr anylist))))
  (iter '() anylist))














































































































































































































































































































































































































































































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
