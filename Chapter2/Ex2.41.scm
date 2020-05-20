;;; Write procedure to find all ordered triples of distinct positive integers
;;; i,j and k less than or euqal to a given integer n that sum to a given
;;; integer s
(define (unique-triplets n)
  (flatmap (lambda (pairij)
			 (map (lambda (k) (append pairij (list k)))
				  (enumerate-interval 1 (- (cadr pairij) 1))))
		   (listij n)))

;;; List all possible i j pairs. Noted that i has to be min 3 (since k<j<i)
;;; and j has to be min 2 (since 1<=k<j)
(define (listij n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 2 (- i 1))))
           (enumerate-interval 3 n)))

; test
(unique-triplets 6)

((3 2 1) (4 2 1) (4 3 1) (4 3 2) (5 2 1) (5 3 1) (5 3 2) (5 4 1) (5 4
 2) (5 4 3) (6 2 1) (6 3 1) (6 3 2) (6 4 1) (6 4 2) (6 4 3) (6 5 1) (6 5 2) (6 5
 3) (6 5 4))

