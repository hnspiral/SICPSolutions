;;; Design procedures element-of-set? adjoin-set, union-set and intersection-set
;;; the operate on sets that allow duplicates.
;;; Element-of-set? still use the same approach (reiterate through the list
;;; and return true if it hits a match. But the process might be slower as
;;; allowing duplicates means the list got longer

(define (element-of-set? x set)
  (cond ((null? set) false)
	    ((equal? (car set) x)
		 true)
		(else
		  (element-of-set? x (cdr set)))))

(define (equal? a b)
  (cond ((and (pair? a) (pair? b))
           (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        ((and (null? a) (null? b)) #t)
        ((and (number? a) (number? b)) (= a b))
        ((and (symbol? a) (symbol? b)) (eq? a b))
        (else #f)))

;;; adjoin-set no longer has to perform the duplicate checks once called:
(define (adjoin-set x set)
	  (cons x set))

;;; intersection-set still use the same approach (checking for matches
;;; between two sets).
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
         '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;;; union-set also no longer has to perform the duplicate checks once called:
(define (union-set set1 set2)
  (append set1 set2))



