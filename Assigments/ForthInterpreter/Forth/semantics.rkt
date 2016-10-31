#lang racket
(require rackunit)
(require rackunit/gui)
(require rackunit/text-ui)

(provide (all-defined-out)) ; export all defined functions
 
(define-struct state (stack words) #:mutable) ; look up `define-struct`
 
(define (new-state)
  (make-state '() (make-hash))) ; make-state is automagically defined because of `define-struct`

; your implemenation of the semantics

; implement (push-stack val a-state), (pop-stack a-state) and (dump-stack a-state)
; implement (get-word name a-state) and (set-word name body a-state)

; push-stack: Scheme X State -> Undefine
; usage: push-stack(val a-state) = the same a-state but with the new val at the top of the stack
(define push-stack
  (lambda (value a-state)
      (set-state-stack! a-state (cons value (state-stack a-state)))))

; pop-stack: Scheme X State -> Scheme
; usage: pop-stack(a-state) = the same a-state but without the top val of the stack
(define pop-stack
  (lambda (a-state)
    (let ((s (state-stack a-state)))
       (set-state-stack! a-state (cdr s))
       (car s))))



; dum-stack: State -> String
; usage: dum-stack(a-state) = prints the values of the stack
(define dum-stack
    (lambda (a-state)
      (let ((s (state-stack a-state))) (helper s))))

(define helper
  (lambda (list)
    (cond
       ((null? list) "")
       (else (string-append (number->string (car list)) " "  (helper (cdr list)))))))

; get-word: Scheme X State -> Undefine
; usage: get-word(name a-state) = searches in the words hash table.

(define get-word
  (lambda(name a-state)
    (hash-ref (state-words a-state) name)))

; set-word: Scheme X Scheme X State -> Undefine
; usage: set-word(name body a-state) = command (over)writes an entry.

(define set-word
  (lambda(name body a-state)
    (hash-set! (state-words a-state) name body)))