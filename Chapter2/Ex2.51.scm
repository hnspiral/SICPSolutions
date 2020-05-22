;;; Define below operation for painters, takes 2 arguments. The resulting painter
;;; given a frame, draws with the first painter in the bottom of the frame and
;;; with the second painter in the top.

;;; Below operation defined directly (by a procedure analogous to the beside
;;; procedure):
(define (below painter1 painter2)
	(let ((split-point (make-vect 0.0 0.5)))
	  (let ((paint-down (transform-painter painter1
										   (make-vect 0.0 0.0)
										   (make-vect 1.0 0.0)
										   split-point))
			(paint-up (transform-painter painter2
										 split-point
										 (make-vect 1.0 0.5)
										 (make-vect 0.0 1.0))))
		(lambda (frame)
		  (paint-down frame)
		  (paint-up frame)))))

;;; Below  defined in terms of beside and suitable rotation operation
(define (below painter1 painter2)
  (rotate90 (beside (rotate90-counter painter2)
		            (rotate90-counter painter1))))

(define (rotate90-counter painter)
  (transform-painter painter
					 (make-vect 1.0 0.0)
					 (make-vect 1.0 1.0)
					 (make-vect 0.0 0.0)))

(define (rotate90 painter)
  (transform-painter painter
					 (make-vect 0.0 1.0)
					 (make-vect 0.0 0.0)
					 (make-vect 1.0 1.0)))



