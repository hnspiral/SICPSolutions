;;; a. Procedure p applied 5 times when (sine 12.15) is avaluated. p has been
;;; stopped being called when (sine 0.05) is evalued as (abs 0.05) < 0.1
;;; (sine 0.05) returns 0.05
  (sine 12.15)
= (p (sine (/ 12.15 3))) ; (p (sine 4.05))
= (p (p (sine (/ 4.05 3)))) ; (p (p (sine 1.35)))
= (p (p (p (sine (/ 1.35 3))))) ; (p (p (p (sine 0.45))))
= (p (p (p (p (sine (/ 0.45 3)))))) ; (p (p (p (p (sine 0.15)))))
= (p (p (p (p (p (sine (/ 0.15 3))))))) ; (p (p (p (p (p (sine 0.05))))))

;;; b. if our terminating point is to bring a to 1 => log 3 a - log 3 1
;;; take it further to 0.1 as termination point => log 3 a - log 3 0.1
