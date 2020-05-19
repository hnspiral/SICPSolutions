;;; Result printed by the interpreter to evaluate the expression:
(list 1 (list 2 (list 3 4)))
;Value 14: (1 (2 (3 4)))

;;; Corresponding Box and pointer structure of such expression:
;;; [*] [*]-> [*] [/]
;;;  |         |
;;;  V         V
;;; [1]       [*] [*] -> [*] [/]
;;;            |          |
;;;            V          V
;;;           [2]        [*] [*] -> [*] [/]
;;;                       |          |
;;;                       V          V
;;;                      [3]        [4]


