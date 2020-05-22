;;; Make chages to square limit of wave, by working at each of the levels:
;;; the lowest level to change the detailed apperance of the wave element
;;; the middle level to change the way corner-split replicates wave
;;; the highest level to change how square-limit arranges the four copies of the corner
;;; a.  Add some segments to the primitive wave painter
;;;  ( Added a smile)
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
                                                 (make-vect 0.0 0.65))
							 (build-segment-list (make-vect 0.45 0.75)
												 (make-vect 0.5 0.7)
												 (make-vect 0.55 0.75)))))

;;; b. Change the pattern constructed by corner-split
;;; By using only one copy of the up-split and right-split images instead of two
(define (corner-split painter n)
  (if (= n 0)
	painter
	(let ((up (up-split painter (- n 1)))
		  (right (right-split painter (- n 1)))
		  (corner (corner-split painter (- n 1))))
	  (beside (below painter up)
			  (below right corner)))))

;;; c. Modify the version of square-limit that uses square-of-four so as to
;;; assemble the corners in a different pattern
;;; (make Mr Rogers look outward from each corner of the square)
(define (square-limit painter n)
(let ((combine4 (square-of-four identity
								flip-horiz
								identity
								flip-horiz)))
  (combine4 (corner-split painter n))))


