;;; Complete the definitions of some basic list manipulation operations
;;; as accumulations
;;; Map
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
			  '()
			  sequence))
;test
(map square (list 1 2 3 4))
(1 4 9 16)

;;; Append
(define (append seq1 seq2)
  (accumulate cons
			  seq2
			  seq1))
;test
(append (list 1 2 3 4) (list 5 6 7 8))
(1 2 3 4 5 6 7 8)

;;; Length
(define (length sequence)
  (accumulate (lambda (x y) (+ y 1))
			  0
			  sequence))
;test
(length (list 1 2 3 4 5 6 7))
7


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

