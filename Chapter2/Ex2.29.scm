;;; Binary mobile constructed from 2 branches
(define (make-mobile left right)
  (list left right))

;;; A branch is constructed from a length (which must be a number) together
;;; with a structure, which may be either a nu,ber (representing a simple weight)
;;; or another mobile
(define (make-branch length structure)
  (list length structure))

;;; a. Corresponding selectors left-branch and right-branch, which return the
;;; branches of a mobile, and branch-length and branch structure, which returns
;;; the components of a branch
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

;;; b. Define procedure total-weight that returns the total weight of a mobile
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
	 (branch-weight (right-branch mobile))))


(define (branch-weight branch)
  (if (not (pair? (branch-structure branch)))
	  (branch-structure branch)
	  (+ (branch-weight (left-branch (branch-structure branch)))
		 (branch-weight (right-branch (branch-structure branch))))))

;;; test
(define y (make-branch 8 5))
(branch-weight y)
5

(define z (make-branch 8 (make-mobile (make-branch 7 5) (make-branch 6 9))))
(branch-weight z)
14

(define x
  (make-mobile (make-branch 8 3)
			   (make-branch 9 (make-mobile (make-branch 7 5)
										   (make-branch 6 9)))))
(total-weight x)
17

;;; c. Design predicate test whether a binary mobile is balanced
;;; (if the torque applied by its top-left branch is equal to that applied by
;;; its top-right branch (if the length of the left rod multiplied by the weight
;;; hangling from that rod is equal to the corresponding product for the right
;;; side) and if each of the submobiles hanging off its branches is balanced
(define (balanced? mobile)
  (and (sub-balanced? mobile)
	   (cond ((pair? (branch-structure (left-branch mobile)))
			  (balanced? (branch-structure (left-branch mobile))))
			 ((pair? (branch-structure (right-branch mobile)))
			  (balanced? (branch-structure (right-branch mobile))))
			 (else #t))))

(define (sub-balanced? submobile)
  (= (torque (left-branch submobile))
	 (torque (right-branch submobile))))

(define (torque branch)
  (* (branch-length branch)
	 (branch-weight branch)))

;;; test
(define m1 (make-mobile (make-branch 3 8)
						(make-branch 6 4)))
(balanced? m1)
#t

(define m2 (make-mobile (make-branch 5 6)
						(make-branch 3 (make-mobile (make-branch 1 2)
													(make-branch 3 5)))))
(balanced? m2)
#f

(define m3 (make-mobile (make-branch 5 6)
						(make-branch 3 (make-mobile (make-branch 10 2)
													(make-branch 2.5 8)))))
(balanced? m3)
#t

;;; d. Using pair instead of list, Suppose we change the representationof
;;; mobiles so that the constructors are:
(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

;;; we will just need to change the selectors to convert to the new
;;; representation. Other components of our previous program remains the same
;;; brcause other parts of our program only interact with the constructor
;;; indirectly via the selectors:

(define (right-branch mobile)
  (cdr mobile))
(define (branch-structure branch)
  (cdr branch))
