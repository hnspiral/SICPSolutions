;;; Insatiable Enterprises Inc is a highly decentralised conglomerate company
;;; consisting of a large number of independent divisions located all over the
;;; world. The company's computer facilities have just been interconnected by
;;; means of a clever network-interfacing scheme that makes the entire network
;;; appear to any user to be a single computer. Insatiable's president, in her
;;; first attempt to exploit the ability of the network to extract administrative
;;; information from division files, is dismayed to discovered that, although all
;;; the division files have been implemented as data structure in Scheme, the
;;; particular data structure used varies from division to division. A meeting
;;; of division managers is hastily called to search for a strategy to integrate
;;; the files that will satisfy headquarters' need while preserving the existing
;;; autonomy of the divisions.
;;; Show how such a strategy can be implemented with data-directed programming.
;;; As an example, suppose that each division's personnel records consist of a
;;; single file, which contains a set of records keyed on employees' names.
;;; The structure of the set varies from division to division. Futhermore,
;;; each employee's record is itself a set (structured differently from
;;; division to division) that contains information keyed under identifiers
;;; such as address and salary. In particular:

;;; a. Implement for headquarters a get-record procedure that retrieves a specified
;;; employee's record from specified personnel file. The procedure should be
;;; applicable to any division's file. Explain how the individual division's
;;; files should be structured. In particular, what type information must be supplied

;;; Assuming that we are trying to extract employee record searched by
;;; employee name, from a personnel file combined all divisions' files.
;;; Each record need to have a type tag (determined by which division that
;;; record belongs to)
(define (get-record employee-name personnel-file)
  (let ((record ((get 'get-record (type-tag personnel-file))
				 employee-name
				 (contents personnel-file))))
	(if record
	    (attach-tag (type-tag personnel-file) record)
		#f)))

;;; b. Implement for head-quarters a get-salary procedure that returns the salary
;;; information from a given employee's record from any division's personnel file.
;;; How should the record be structured in order to make this operation work?
(define (get-salary record)
  ((get 'get-salary (type-tag record))
   (contents record)))
;;; In order for this to work, record need to keep its tag indicating which
;;; division the record belongs to (since each division has its own style
;;; of structuring employee data) that the program can dispatch the
;;; corresponding get-salary accordingly

;;; c. Implement for headquarters a find-employee-record procedure. This could
;;; search all the divisions' files for the record of a given employee and
;;; return the record. Assume that this procedure takes as arguments an
;;; employee's name and a list of all divisions' files
(define (find-employee-record employee-name personnel-files)
  (if (null? personnel-files)
	  #f
	  (let ((get-record employee-name (car personnel-file)))
		(if record
		    record
			(find-employee-record employee-name
								  (cdr personnel-files))))))

;;; d. When Insatiable takes over a new company, what changes must be made in order
;;; to incorporate the new personnel information into the central system

;;; Ensure the new division has no duplicated ID from the existing one
;;; write the internal procedures (get-salary etc) that is applicable
;;; to that particular new division
;;; interface it with the system (put the operation under the corresponding
;;; tag) and install the operation
;;; update personnel-files with the personnel file belongs to the new acquired
;;; division;s personnel-file



















