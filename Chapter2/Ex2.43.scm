;;; In the original code, a set of safe (k-1) queens has been generate first
;;; before new-row is called (which enumerate all numbers from 1 to board size)
;;; that means, when (k-1) queens have been generated and are in safe positions
;;; to calculate the safe positions for (queens-col k) it make naord-size + 1
;;; calls to queen-cols (from queen-cols board-size down to queen-cols 0)

(flatmap
  (lambda (rest-of-queens)
	(map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
  (queen-cols board-size))

;;; On the other hand, Louise's code did it in a reverse order. New row is
;;; generated first by enumerating from 1 to board size, then for each posible
;;; new row, it tries to generate a safe set of (k-1) queens.
;;; To calculate the safe positions for queen-cols board size, the intepreter
;;; make 1 call to (queen-cols board size -1), each of these call would then
;;; in turn make 1 call to (queen-cols (board-zise -2)) and so on. This carries
;;; on to queen-cols 0, which renders board-zise ^ board -size calls
;;; to queen-cols.

(flatmap
  (lambda (new-row)
	(map (lambda (rest-of-queens)
		   (adjoin-position new-row k rest-of-queens))
		 (queen-cols (- k 1))))
  (enumerate-interval 1 board-size))

