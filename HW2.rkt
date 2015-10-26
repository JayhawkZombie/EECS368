#lang racket
(require racket)
(define-namespace-anchor a)
(define env (namespace-anchor->namespace a))

;
(define (deriv f) 
  (λ(x) (/ (- (f(+ x dx)) (f x)) dx)))

;
(define dx 1/100)
(define y 43)

(define num         '(λ(x) 47))
(define numc        '(λ(x) 2+3i))
(define xbound      '(λ(x) x))
(define yfree       '(λ(x) y))
(define x+          '(λ(x) (+ x 3 x 5 x)))
(define x+nil       '(λ(x) (+)))
(define x-          '(λ(x) (- x 3 x 5 x)))
(define x1-         '(λ(x) (- x)))
(define x*          '(λ(x) (* x 3 x 5 x)))
(define x*nil       '(λ(x) (*)))
(define x/          '(λ(x) (/ x 3 x 5 x)))
(define x1/         '(λ(x) (/ x)))
(define xexp        '(λ(x) (exp x)))
(define xlog        '(λ(x) (log x)))
(define xexplog     '(λ(x) (exp (log x))))
(define xlogexp     '(λ(x) (log (exp x))))
(define xexpt       '(λ(x) (expt x 3)))
(define xexpt2      '(λ(x) (expt 2 x)))
(define xexpt3      '(λ(x) (expt x x)))
(define xexpi       '(λ(x) (exp(* +i x))))
(define xexpii      '(λ(x) (exp(*(expt -1 1/2)x))))
(define xcos        '(λ(x) (+(cos x) (*(expt -1 1/2) (sin x)))))
(define xsin        '(λ(x) (log(sin x))))
(define xtan        '(λ(x) (tan x)))
(define xasin       '(λ(x) (asin(- x 1/2))))
(define xacos       '(λ(x) (acos(- x 1/2))))
(define xatan       '(λ(x) (atan x)))
(define xabs        '(λ(x) (abs(- x 2))))
(define archimedes  '(λ(lat) (sin lat)))
(define mercator    '(λ(lat) (log(+(tan lat)(/(cos lat))))))

;
(define qfs 
  (list num numc xbound yfree x+ x+nil x- x1- x* x*nil x/ x1/ xexp xlog xexplog xlogexp xexpt xexpt2 xexpt3 xexpi xexpii xcos xsin xtan xasin xacos xatan xabs archimedes mercator))

;
(define (adder s x) 
  (if(null? (cdr x)) 
     '() 
     (cons 
      (symderivat s (cadr x)) 
      (adder s (append (remove (cadr x) x)))))) 

;
(define (symderiv x) 
  `(λ(,(caadr x)) ,(symderivat (caadr x) (caddr x))))

;
(define (symderivat s x)
  (cond ((number? x) 0)
        ((symbol? x) (if (eq? x s) 1 0))
        (else (case (car x)
                ((+) 
                 (remove* '(0) (cons '+ (adder s x))))
                ((*) 
                 (if (null? (cdr x))
                     0 
                     (cons '+ (map (λ(k) (remove* '(1) (cons '* (cons (symderivat s k) (remove k (cdr x)))))) (cdr x) ))))
                ((-) 
                 (remove* '(0) (cons '- (adder s x))))
                ((/) 
                 (if (eq? (length x) 2)
                        `(- (/ (* ,(cadr x) ,(cadr x)))) 
                        `(/ (- (* ,(symderivat s (cadr x)) ,(cons '* (cddr x)))(* ,(symderivat s (cons '* (cddr x))) ,(cadr x))) (* ,(cons '* (cddr x)) ,(cons '* (cddr x))))))
                ((exp)  
                 `(* (exp ,(cadr x)), (symderivat s (cadr x))))
                ((log)  
                 `(* (/ 1 ,(cadr x)), (symderivat s (cadr x))))
                ((expt)  
                 (if (eq? (cadr x) s ) 
                     (symderivat s `(exp (* ,(cadr x) (log ,(caddr x))))) 
                 (if (eq? (caddr x) 1/2)
                     `(sqrt ,(cadr x)) 
                     `(* ,(cadr x) (log, (cadr x)))))) 
                ((sin)  
                 `(* (cos,(cadr x)), (symderivat s (cadr x))))
                ((cos)  
                 `(* ,(symderivat s (cadr x)) (- (sin,(cadr x)))))
                ((tan)  
                 `(* (* (/ 1 (cos ,(cadr x))) (/ 1 (cos ,(cadr x)))), (symderivat s (cadr x))))
                ((asin) 
                 `(* (- ,(symderivat s (cadr x))) (/ (sqrt (- 1 (expt,(cadr x) 2))))))
                ((acos) 
                 `(* ,(symderivat s (cadr x)) (/ (sqrt (- 1 (expt,(cadr x) 2))))))
                ((atan) 
                 `(* ,(symderivat s (cadr x)) (/ (+ (expt,(cadr x) 2) 1))))
                ((abs)  
                 `(/ ,(cadr x) (sqrt(expt ,(cadr x) 2)))) 
                (else `(0))))))

;
(define (test x) 
  (map 
   (λ(qf) (cons (cons (list "Equation:"qf "Deriv:" ((deriv (eval qf env))1)) (list "EvalSymDeriv:" (if (eq? (symderiv qf) 0) '(0) ((eval (symderiv qf) env)1)))) (list "SymDeriv:" (symderiv qf))))
       x)) 

;
(test qfs) 

