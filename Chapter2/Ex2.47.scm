;;; For each constructor supply the appropriate selectors to produce
;;; an implementation for frames
;;; Frames defined as list of origin, edge1 and edge2
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin frame)
  (car frame))

(define (edge1 frame)
  (cadr frame))

(define (edge2 frame)
  (caddr frame))

;;; Frame defined as pair of origin and the pair edge1 edge2
(define (make-frame origin edge1 edge2)
  (cons origin
		(cons edge1 edge2)))

(define (origin frame)
  (car frame))

(define (edge1 frame)
  (cadr frame))

(define (edge2 frame)
  (cddr frame))
