;;; In normal-evaluation of (gcd 206 40), remainder of a and b
;;; will not be evaluated until it is required. Thus it would first, evaluate
;;; remainder call for 'if evaluation; fully expand then reduce
;;; In applicative order, 'remainder calls are evaluated each time it is called
;;; and returns a specific value to it.

