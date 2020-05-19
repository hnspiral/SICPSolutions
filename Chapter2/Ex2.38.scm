;;; The accumulate procedure is also known as fold-right, because it combines
;;; the first element of the sequence with the result of combining all the elements
;;; to the right. These is also a fold-left which is similar to fold-right
;;; except that it combines elements working from the opposite direction:
(define (fold-right op initial sequence)
  (accumulate op initial sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
	(if (null? rest)
	    result
		(iter (op result (car rest))
			  (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
3/2
(fold-left / 1 (list 1 2 3))
1/6
(fold-right list '() (list 1 2 3))
(1 (2 (3 ())))
(fold-left list '() (list 1 2 3))
(((() 1) 2) 3)

;;; To guarantee that fold-right and fold-left to produce the same values
;;; for any sequences, op must be an operation that regarless of its order
;;; when applied to the sequence (whether left to right or right to left of
;;; the sequence), the accumulation returnt the same return. (for example
;;; the ops + or *, if we call + on the list (a b), regardless of the order
;;; of sequence (a b) are called with op +, aka (+ a b) or (+ b a) the result
;;; remains the same.
;;; Because the only difference between fold-left and fold-right is that
;;; fold-right apply the op on the last elements at the right and then slowly
;;; moving to the left; and fold left start clearing the operation on the
;;; left most element, and slowly moving to the right. Thus, any operation
;;; which does not matter the order of the sequence, would churn the same
;;; result if we call either fold-right or fold-left

;;; Carry-forward definition
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

 (define (accumulate-n op init seqs)
   (if (null? (car seqs))
       '()
       (cons (accumulate op init (map (lambda (x) (car x))
                                      seqs))
             (accumulate-n op init (map (lambda (x) (cdr x))
                                        seqs)))))
























































































































































































































































































































































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
