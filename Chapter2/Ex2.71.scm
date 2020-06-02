;;; Suppose we have a Huffman tree for an alphabet of n symbols, and that relative
;;; frequencies of the symbols 1,2,4,...,2^n-1. Sketch the tree for n=5, for n=10
;;; In such a tree (for general n) how many bits are required to encode the most
;;; frequent symbol? the least frequent symbol?

;;; For n = 5: it required 4 bits to encode the least frequent symbol, 1 bit
;;; to encode the most frequent symbol

;;; For n = 10: it required 9 bits to encode the least frequent symbol, 1 bit
;;; to encode the most frequent symbol

;;; In general, it required n-1 bits to encode the least frequent symbol,
;;; 1 bit to encode the most frequent symbol;
