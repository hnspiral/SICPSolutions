;;; Louis's code has used explicit multiplication twice, meaning the procedure
;;; (expmod base (/ exp 2) m) would be called twice each time
;;; expmod is called that significantly
;;; slowed down the whole process (double the number steps).
;;; The original process was a O(log n) process has been transformed to
;;; (square (log 2 n)) into O(n).
