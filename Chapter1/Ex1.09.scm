;;; Part A
(define (+ a b)
  (if (= a 0)
	  b
	  (inc (+ (dec a) b))))
;The above in Part A is recursive process, whereby the interpreter need to
;keep track of operations to be performed later on. In this case everytime
;the procedure is carried on, it needs to keep track of end result to call
;"inc" later on as illustrated using substitution model below:
;(+ 4 5)
;(+ inc (+ (dec 4) 5))                ;since a=!0, predicate (= a 0) returns #f
;(+ inc (inc (+ (dec 3) 5)))		  ;since a=!0, predicate (= a 0) returns #f
;(+ inc (inc (inc (+ (dec 2) 5))))    ;since a=!0, predicate (= a 0) returns #f
;(+ inc (inc (inc (inc (+ (dec 1) 5)))))  ;since a=!0, predicate (= a 0) returns #f
;(+ inc (inc (inc (inc (+ 0 5)))))    ;since a=!0, predicate (= a 0) returns #f
;(+ inc (inc (inc (inc 5))))          ;since a = 0, predicate (= a 0) returns #t.
									  ;expressions returns b which is 5
;(+ inc (inc (inc 6)))
;(+ inc (inc 7))
;(+ inc 8)
;9

;;; Part B
(define (+ a b)
  (if (= a 0)
	  b
	  (+ (dec a) (inc b))))

;This is iteration process, each time the interpreter does not have to keep
;track of the operations to perform later on but rather in each stage it capture
;both of the state variables to execute the process, as illustrated below:
;(+ 4 5)
;(+ (dec 4) (inc 5))                  ;since a=!0, predicate (= a 0) returns #f
;(+ (dec 3) (inc 6))                  ;since a=!0, predicate (= a 0) returns #f
;(+ (dec 2) (inc 7))                  ;since a=!0, predicate (= a 0) returns #f
;(+ (dec 1) (inc 8))                  ;since a=!0, predicate (= a 0) returns #f
;(+ 0 9)                              ;since a=!0, predicate (= a 0) returns #f
;9								      ;since a = 0, predicate (= a 0) returns #t.
									  ;expressions returns b which is 9
