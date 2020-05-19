;;; Define accumulate-n similar to accumulate, except that it takes as its
;;; third arugement a sequence of sequences, which are all assumed to have
;;; the same number of elements.,It applies the designated accumulation
;;; procedure to combine all the first elements of the sequences, all the
;;; second elements of the sequences and so on, and return a sequence of results.

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
	  '()
	  (cons (accumulate op init (map (lambda (x) (car x))
									 seqs))
			(accumulate-n op init (map (lambda (x) (cdr x))
									   seqs)))))
;test:

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 s)
(22 26 30)




(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

