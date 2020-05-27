;;; The follwing procedure takes as its argument a list of symbol-frequency pairs
;;; where no symbol appears in more than one pair) and generates a Huffman
;;; encoding tree according to the HUffman algorithm
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;;; make-leaf-set is the procedure given above that transforms the list of pairs
;;; into an ordered set of leaves. successive-merge is the procedure using
;;; make-code-tree to successively merge the smallest-weight elements of
;;; the set until there is only one element left, which is the desired Huffman tree.
;;; This procedure is slightly tricky, but not really complicated. If you can find
;;; yourself designing a complex procedure, then you are almost certainly
;;; doing something wrong. You can take significant advantage of the fact that
;;; we are using an ordered set representation

(define (successive-merge leaves)
  (if (= (length leaves) 1)
	  leaves
  	  (let ((leaf1 (car leaves))
		    (leaf2 (cadr leaves)))
		(successive-merge
		  (adjoin-set (make-code-tree leaf1 leaf2)
					  (cddr leaves))))))


(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

;;; test

(generate-huffman-tree '((a 4) (b 2) (c 1) (d 1)))
(((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8))

(generate-huffman-tree '((a 8) (b 3) (c 1) (d 1) (e 1) (f 1) (g 1) (h 1)))

(((leaf a 8) ((((leaf h 1) (leaf g 1) (h g) 2) ((leaf f 1) (leaf e 1)
 (f e) 2) (h g f e) 4) (((leaf d 1) (leaf c 1) (d c) 2) (leaf b 3) (d c b) 5) (h
 g f e d c b) 9) (a h g f e d c b) 17))

