(define (compose f g)
  (lambda (x) (f (g x))))

;;;test:
((compose square inc) 6)
49
