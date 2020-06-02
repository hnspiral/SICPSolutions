;;; Consider the encoding procedure that you designed in Ex2.68. What is the
;;; order of growth in the number of steps needed to encode a symbol? be sure
;;; to include the number of steps needed to search the symbol list at each
;;; node encountered. To answer this question in general is difficult. Consider
;;; the special case where the relative frequencies of the n symbols are
;;; are as described in Ex2.71 and give the order of growth (as a function
;;; of n) of the number of steps needed to encode the most frequent and least
;;; frequent symbols in the alphabet.


 (define (encode message tree)
   (if (null? message)
       '()
       (append (encode-symbol (car message) tree)
               (encode (cdr message) tree))))

 (define (encode-symbol symbol tree)
   (if (leaf? tree)
       '()
       (cond ((element-of-set? symbol (symbols (left-branch tree)))
              (cons 0 (encode-symbol symbol (left-branch tree))))
             ((element-of-set? symbol (symbols (right-branch tree)))
              (cons 1 (encode-symbol symbol (right-branch tree))))
             (else (error "Symbol not part of encoding tree")))))

;;; Starting off, looking up at either left of right branch for the symbol
;;; has order of growth n
;;; At each node encountered, the search in symbol list has the order of growth
;;; n.
 (define (element-of-set? x set)
   (cond ((null? set)
          #f)
         ((eq? (car set) x)
          #t)
         (else (element-of-set? x (cdr set)))))

;;; Checking if a node is leaf, is an operation with order of growth 1
;;; Cons either 1 or 0 to the resulting list has order of growth n



