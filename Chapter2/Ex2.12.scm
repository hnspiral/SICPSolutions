(define (make-center-percent center percent)
  (make-interval (- center (* center (/ percent 100.0)))
				 (+ center (* center (/ percent 100.0)))))

(define (center interval)
  (average (lower-bound interval)
		   (upper-bound interval)))
(define (average a b) (/ (+ a b) 2.0))

(define (percent interval)
  (* (- (/ (upper-bound interval) (center interval))
		1.0)
	 100.0))

 ;;; Implementation of interval abstraction
 (define (make-interval lower upper)
   (cons lower upper))

 (define (lower-bound interval)
   (car interval))

 (define (upper-bound interval)
   (cdr interval))

