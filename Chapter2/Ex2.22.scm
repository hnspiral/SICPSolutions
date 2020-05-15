;;; Louise Reasoner's code for square-list procedure:
(define (square-list items)
  (define (iter things answer)
	(if (null? things)
	  answer
	  (iter (cdr things)
			(cons (square (car things))
				  answer))))
  (iter items '()))

(square-list (list 1 2 3 4))

;Value 19: (16 9 4 1)

;;; This produces a result in reverse order. Reason being square of (car items)
;;; -  the first item being produced first, inserted into the answer list.
;;; the second item is then being processed and put on the left of 1st item.
;;; (based on cons structure). In order to fix this, Louise needs to call
;;; reverse on the resultbeing returning it.

;;; Louise then tried to fix his bug by interchanging the aurguments to cons:
(define (square-list items)
  (define (iter things answer)
	(if (null? things)
	    answer
		(iter (cdr things)
			  (cons answer
					(square (car things))))))
  (iter items '()))

(square-list (list 1 2 3 4))

;Value 20: ((((() . 1) . 4) . 9) . 16)

;;; This fix also doesnt work because it did not produce a flat result list
;;; but instead a multi-level lists of result. Reason being each time
;;; (square (car things)) is called on an item it was produced on its own level
;;; (cons answer
;;;       square (car things)))
;;; square is on its own level, the rest of the answer is on the next level


































































































































































































































































































































































































































































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
