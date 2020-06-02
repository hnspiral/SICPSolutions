;;; As a large system with generic operations evolves, new types of data objects
;;; or new operations may be needed. For each of the three strategies -- generic
;;; operations with explicit dispatch, data-directed style, and message-passing
;;; style describe the changes that must be made to a system in order to
;;; add new types or new operations. Which organization would be most appropriate
;;; for a new system in which new types most often be added? Which would be most
;;; appropriate for a system in which new operations most often be added?

;;; Generic operations with explicit dispatch
;;; Adding new type: to update each existing operations with the specific operation
;;; for the new type - No modularization
;;; Adding new operation: to update the new operation into each type. - No modularization

;;; Datadirected style
;;; Adding new type: develop the installation package including all the operations
;;; that the new type have, and 'put in in the table with appropriate tag - Modularized
;;; Adding new operation: new operation need to be added into each of the existing
;;; type installation pack - No modularization

;;; Message-Passing style
;;; Adding new type: implement the new dispatch pack for the new types with
;;; all of its operations - Modularized
;;; Adding new operation: each dispatching procedure need to be updated
;;; with the new operation, and then each type's new operation need to be
;;; updated separately


;;; Message-passing style is most appropriate for new system which new types
;;; are most often added
;;; Data-directed style is most appropriate for new systems which new
;;; operations are most oftern added
