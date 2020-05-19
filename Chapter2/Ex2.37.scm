;;; Define basic matrix and vector operations:
;;; (dot-product v w) returns the sum of all viwi
(define (dot-product v w)
  (accumulate +
			  0
			  (map * v w)))
; test
(define v1 (list 1 2 3))
(define v2 (list 4 5 6))
(dot-product v1 v2)
32

;;; matrix-*-vector m v returns vector t, where ti = sum of all mij*vj
(define (matrix-*-vector m v)
  (map (lambda (mv) (dot-product mv v))
	   m))
; test
(define m (list (list 1 2 3) (list 4 5 6)))
(define v1 (list 1 2 3))
(matrix-*-vector m v1)
(14 32)

;;; transpose m returns the matrix n, where nij = mji
(define (transpose mat)
  (accumulate-n cons
				'()
				mat))
;test
(transpose m)
((1 4) (2 5) (3 6))

;;; matrix-*-matrix m n returns the matrix p, where pij = sum of all mik*nkj
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
	(map (lambda (mv) (matrix-*-vector cols mv))
		 m)))

(define m (list (list 1 2 3) (list 4 5 6)))
(define n (list (list 1 2) (list 3 4) (list 5 6)))
(matrix-*-matrix m n)
((22 28) (49 64))


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
