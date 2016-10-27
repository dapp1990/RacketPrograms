#lang eopl
(require "syntax.rkt")
(require "LET.rkt")

;;; Example programs
;;; Initial bindings: i=1, v=5, x=10

; 2
(define p1 (a-program (const-exp 2)))

; 2 - 4
(define p2 (a-program (diff-exp (const-exp 2) (const-exp 4))))

; 10 - (2 - 4)
(define p3 
  (a-program (diff-exp (const-exp 10) 
                       (diff-exp (const-exp 2) (const-exp 4)))))

; x
(define p4
  (a-program (var-exp 'x)))

; x - 4
(define p5
  (a-program (diff-exp (var-exp 'x) (const-exp 4))))

; let x = 0 in x - 4
(define p6
  (a-program (let-exp 'x 
                      (const-exp 0) 
                      (diff-exp (var-exp 'x) (const-exp 4)))))
; let x = 0 in let x = 2 in x
(define p7
  (a-program (let-exp 'x (const-exp 0)
                      (let-exp 'x (const-exp 2)
                               (var-exp 'x)))))

; xx
; Interpreter will give an error!
(define p8
  (a-program (var-exp 'xx)))

; let y = 0 in let y = y - 1 in y
(define p9
  (a-program (let-exp 'y (const-exp 0)
                      (let-exp 'y (diff-exp (var-exp 'y) (const-exp 1))
                               (var-exp 'y)))))

; zero? 10
(define p10
  (a-program (zero?-exp (const-exp 10))))

(define (test p)
  (begin
    (display (program->string p))
    (display "\n")
    (display (expval->string (value-of-program p)))
    (display "\n----------------\n")))

(define examples (list p1 p2 p3 p4 p5 p6 p7 p9 p10)) ; not p8 because it fails

;;; -((-5) - 9)) <=> 14
(define minus
  (a-program (min-exp (diff-exp (min-exp (const-exp 5)) (const-exp 9)))))

;;; -((-5) + 9)) <=> -4
(define addition
  (a-program (min-exp (add-exp (min-exp (const-exp 5)) (const-exp 9)))))

;;; -((-5) * 9)) <=> 45
(define multiplication
  (a-program (min-exp (mul-exp (min-exp (const-exp 5)) (const-exp 9)))))

;;; -((-10) / 9)) <=> 1
(define quotient
  (a-program (min-exp (quo-exp (min-exp (const-exp 10)) (const-exp 9)))))

;;; 5 / 3 <=> 1
(define t1
  (a-program (quo-exp (const-exp 5) (const-exp 3))))

;;; equal? 5 == 10
(define equal-exp
  (a-program (equal?-exp (const-exp 5) (const-exp 10))))

;;; greater? 5 > 10
(define greater-exp
  (a-program (greater?-exp (const-exp 5) (const-exp 10))))

;;; less? 5 < 10
(define less-exp
  (a-program (less?-exp (const-exp 5) (const-exp 10))))