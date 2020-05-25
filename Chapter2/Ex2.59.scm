;;; Implement the union-set operation for the unordered-list representation of sets
(define (union-set set1 set2)
  (cond ((null? set1) set2)
		((null? set2) set1)
		((not (element-of-set? (car set1) set2))
		 (cons (car set1)
			   (union-set (cdr set1) set2)))
		(else (union-set (cdr set1) set2))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (equal? a b)
  (cond ((and (pair? a) (pair? b))
           (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        ((and (null? a) (null? b)) #t)
        ((and (number? a) (number? b)) (= a b))
        ((and (symbol? a) (symbol? b)) (eq? a b))
        (else #f)))

