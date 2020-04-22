;;; The program entered into an indefinite loop.
;;; Because when 'if was defined as an ordinary procedure (instead of the special
;;; form 'if), Lisp interpreter which uses apllicative order would evaluate
;;; all the arguments independently first before applying.
;;; evaluating the 3rd argument 'sqrt-ter (improve guess x) x would call for
;;; an infinite loop, because this, without the predicate to determine the
;;; end point, is an endless process.
;;; in contrast, if the procedure was defined as if - which is a special form
;;; that follows its own rule, it would first evaluate the predicate
;;; '(good-enough? guess x), if true it return ;guess, if false it moves on
;;; calling itself on the "improved guess".
