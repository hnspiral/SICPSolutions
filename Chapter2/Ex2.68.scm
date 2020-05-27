;;; The encode procedure takes an arguments as a message and a tree
;;; and produce the list of bits that gives the encoded message
(define (encode message tree)
  (if (null? message)
	  '()
	  (append (encode-symbol (car message) tree)
			  (encode (cdr message) tree))))

;;; encode-symbol is a procedure that returns the list of bits that encodes
;;; a given symbol according to a given tree
(define (encode-symbol symbol tree)
  (if (leaf? tree)
	  '()
	  (cond ((element-of-set? symbol (symbols (left-branch tree)))
			 (cons 0 (encode-symbol symbol (left-branch tree))))
			((element-of-set? symbol (symbols (right-branch tree)))
			 (cons 1 (encode-symbol symbol (right-branch tree))))
			(else (error "Symbol not part of encoding tree")))))

(define (element-of-set? x set)
  (cond ((null? set)
		 #f)
		((eq? (car set) x)
		 #t)
		(else (element-of-set? x (cdr set)))))

;;; test
(encode-symbol 'a sample-tree)
(0)
(encode-symbol 'b sample-tree)
(1 0)
(encode-symbol 'c sample-tree)
(1 1 1)
(encode-symbol 'd sample-tree)
(1 1 0)

(encode '(a d a b b c a) sample-tree)
(0 1 1 0 0 1 0 1 0 1 1 1 0)

