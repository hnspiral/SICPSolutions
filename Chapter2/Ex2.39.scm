;;; Define reverse interms of fold-right and fold-left
(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x)))
			  '()
			  sequence))
;test
(reverse (list 1 2 3 4))
(4 3 2 1)


(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x))
			 '()
			 sequence))
;test
(reverse (list 1 2 3 4))
(4 3 2 1)


;;; Carry-forward implementation:
 (define (fold-right op initial sequence)
   (accumulate op initial sequence))

 (define (fold-left op initial sequence)
   (define (iter result rest)
     (if (null? rest)
         result
         (iter (op result (car rest))
               (cdr rest))))
   (iter initial sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
