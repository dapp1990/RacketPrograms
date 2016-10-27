#lang eopl
(provide (all-defined-out))

;; Syntax
(define-datatype program program?
  (a-program (exp1 expression?)))

(define (program->string pgm)
     (cases program pgm
      (a-program (exp1)
                 (exp->string exp1 ))))

;;; Original code
#;(define-datatype expression expression?
  (const-exp (num number?))
  (diff-exp (exp1 expression?) (exp2 expression?))
  (zero?-exp (exp1 expression?))
  (if-exp
   (exp1 expression?)
   (exp2 expression?)
   (exp3 expression?))
  (var-exp (var symbol?))
  (let-exp
   (var symbol?)
   (exp1 expression?)
   (body expression?)))

#;(define-datatype expression expression?
  (const-exp (num number?))
  (diff-exp (exp1 expression?) (exp2 expression?))
  (zero?-exp (exp1 expression?))
  (if-exp
   (exp1 expression?)
   (exp2 expression?)
   (exp3 expression?))
  (var-exp (var symbol?))
  (let-exp
   (var symbol?)
   (exp1 expression?)
   (body expression?)))

#;(define (exp->string exp)
    (cases expression exp
      (const-exp (num) (number->string num))
      (var-exp (var) (symbol->string var))
      (diff-exp (exp1 exp2)
                (let ((val1 (exp->string exp1))
                      (val2 (exp->string exp2)))
                  (string-append "(" val1 " - " val2 ")")))
      (zero?-exp (exp1)
                 (let ((val1 (exp->string exp1 )))
                   (string-append "zero? " val1)))
      (if-exp (exp1 exp2 exp3)
              (let ((val1 (exp->string exp1 ))
                    (val2 (exp->string exp2 ))
                    (val3 (exp->string exp3 )))
                (string-append "if " val1 " then " val2 " else " val3 )))
              
      (let-exp (var exp1 body)       
               (let ((val1 (exp->string exp1))
                     (val2 (exp->string body)))
                 (string-append "let " (symbol->string var) " = " val1 " in " val2) ))
      
      ))

;;; Execerise 3.6
;;; Execerise 3.7
;;; Execerise 3.8

(define-datatype expression expression?
  (const-exp (num number?))
  (diff-exp (exp1 expression?) (exp2 expression?))
  (min-exp (exp1 expression?))
  (add-exp (exp1 expression?) (exp2 expression?))
  (mul-exp (exp1 expression?) (exp2 expression?))
  (quo-exp (exp1 expression?) (exp2 expression?))
  (zero?-exp (exp1 expression?))
  (equal?-exp (exp1 expression?) (exp2 expression?))
  (greater?-exp (exp1 expression?) (exp2 expression?))
  (less?-exp (exp1 expression?) (exp2 expression?))
  (if-exp
   (exp1 expression?)
   (exp2 expression?)
   (exp3 expression?))
  (var-exp (var symbol?))
  (let-exp
   (var symbol?)
   (exp1 expression?)
   (body expression?)))

(define (exp->string exp)
    (cases expression exp
      (const-exp (num) (number->string num))
      (var-exp (var) (symbol->string var))
      (diff-exp (exp1 exp2)
                (let ((val1 (exp->string exp1))
                      (val2 (exp->string exp2)))
                  (string-append "(" val1 " - " val2 ")")))
      (min-exp (exp1) (string-append "-" (exp->string exp1)))
      (add-exp (exp1 exp2) (string-append (exp->string exp1) "+" (exp->string exp1)))
      (mul-exp (exp1 exp2) (string-append (exp->string exp1) "*" (exp->string exp1)))
      (quo-exp (exp1 exp2) (string-append (exp->string exp1) "/" (exp->string exp1)))
      (equal?-exp (exp1 exp2) (string-append (exp->string exp1) "=" (exp->string exp1)))
      (greater?-exp (exp1 exp2) (string-append (exp->string exp1) ">" (exp->string exp1)))
      (less?-exp (exp1 exp2) (string-append (exp->string exp1) "<" (exp->string exp1)))
      (zero?-exp (exp1)
                 (let ((val1 (exp->string exp1 )))
                   (string-append "zero? " val1)))
      (if-exp (exp1 exp2 exp3)
              (let ((val1 (exp->string exp1 ))
                    (val2 (exp->string exp2 ))
                    (val3 (exp->string exp3 )))
                (string-append "if " val1 " then " val2 " else " val3 )))
              
      (let-exp (var exp1 body)       
               (let ((val1 (exp->string exp1))
                     (val2 (exp->string body)))
                 (string-append "let " (symbol->string var) " = " val1 " in " val2) ))
      
      ))


