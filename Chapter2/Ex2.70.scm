;;; Use the generate-huffman-tree to generate a corresponding Huffman tree,
(generate-huffman-tree
  '((a 2)
	(boom 1)
	(get 2)
	(job 2)
	(na 16)
	(sha 3)
	(yip 9)
	(wah 1)))

(((leaf na 16)
  ((leaf yip 9)
   (((leaf a 2) ((leaf wah 1) (leaf boom 1) (wah boom) 2) (a wah boom) 4)
	((leaf sha 3) ((leaf job 2) (leaf get 2) (job get) 4) (sha job get) 7)
	(a wah boom sha job get) 11)
   (yip a wah boom sha job get) 20)
  (na yip a wah boom sha job get) 36))

;;; use encode to encode the following messages:
Get a job

Sha na na na na na na na na

Get a job

Sha na na na na na na na na

Wah yip yip yip yip yip yip yip yip yip

Sha boom

(encode
  '( Get a job

 Sha na na na na na na na na

 Get a job

 Sha na na na na na na na na

 Wah yip yip yip yip yip yip yip yip yip

 Sha boom)

  (generate-huffman-tree
  '((a 2)
    (boom 1)
    (get 2)
    (job 2)
    (na 16)
    (sha 3)
    (yip 9)
    (wah 1))))

(1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0
0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
0 1 1 1 0 1 1 0 1 1)

;;; How many bits are required for the encoding? what is the smallest number
;;; of bits that would be needed to encpde this song is we use a fixed-length
;;; code for the eight-symbol alphabet
;;; 84 bits was required to encode the above message.
;;; If we use fixed-length code for 8 symbol alphabet, we would need log2 8 = 3
;;; bits for each symbol, thus for the aboe message of 36 symbols would require
;;; 3 * 36 = 108 bits

;;; Carried forward code:
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (if (= (length leaves) 1)
      (car leaves)
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

 (define (element-of-set? x set)
   (cond ((null? set)
          #f)
         ((eq? (car set) x)
          #t)
         (else (element-of-set? x (cdr set)))))

