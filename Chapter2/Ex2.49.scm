;;; Use segments->painter to define the following primitive painters:
(define (segments->painter segment-list)
   (lambda (frame)
     (for-each
       (lambda (segment)
         (draw-line
           ((frame-coord-map frame) (start-segment segment))
           ((frame-coord-map frame) (end-segment segment))))
       segment-list)))

(define (build-segment-list vector-list)
  (define (build-iter current-vect remaining-vect segment-list)
	(if (null? remaining-vect)
	    segment-list
		(build-iter (car remaining-vect)
					(cdr remaining-vect)
					(cons (cons current-vect (car remaining-vect))
						  segment-list))))
  (build-iter (car vector-list) (cdr vector-list) '()))

;;; a. The painter that draws the outline of the designated frame
(define frame-outline
  (segments->painter (build-segment-list (make-vect 0.0 0.0)
										 (make-vect 0.0 1.0)
										 (make-vect 1.0 1.0)
										 (make-vect 1.0 0.0)
										 (make-vect 0.0 0.0))))

;;; b. The painter that draws an X by connecting opposite corners of the frame
(define draw-x
  (segments->painter (list (make-segment (make-vect 0.0 0.0)
										 (make-vect 1.0 1.0))
						   (make-segment (make-vect 0.0 1.0)
										 (make-vect 1.0 0.0)))))

;;; c. The painter that draw diamond shape by connecting midpoints of the sides
(define diamond
  (segments->painter (build-segment-list (make-vect 0.0 0.5)
										 (make-vect 0.5 1.0)
										 (make-vect 1.0 0.5)
										 (make-vect 0.5 0.0)
										 (make-vect 0.0 0.5))))

;;; d. The wave painter
(define wave
  (segments->painter (append (build-segment-list (make-vect 0.0 0.85)
												 (make-vect 0.15 0.6)
												 (make-vect 0.3 0.65)
												 (make-vect 0.4 0.65)
												 (make-vect 0.35 0.85)
												 (make-vect 0.4 1.0))
							 (build-segment-list (make-vect 0.6 1.0)
												 (make-vect 0.65 0.85)
												 (make-vect 0.6 0.65)
												 (make-vect 0.75 0.65)
												 (make-vect 1.0 0.35))
							 (build-segment-list (make-vect 1.0 0.15)
												 (make-vect 0.6 0.45)
												 (make-vect 0.75 0.0))
							 (build-segment-list (make-vect 0.6 0.0)
												 (make-vect 0.5 0.3)
												 (make-vect 0.4 0.0))
							 (build-segment-list (make-vect 0.25 0.0)
												 (make-vect 0.35 0.5)
												 (make-vect 0.3 0.6)
												 (make-vect 0.15 0.4)
												 (make-vect 0.0 0.65)))))

;;; Frame implementation
(define (make-frame origin edge1 edge2)
   (list origin edge1 edge2))

(define (origin frame)
   (car frame))

(define (edge1 frame)
   (cadr frame))

(define (edge2 frame)
   (caddr frame))

;;; Segment implementation
(define (make-segment start end)
   (cons start end))

(define (start-segment segment)
   (car segment))

(define (end-segment segment)
   (cdr segment))



