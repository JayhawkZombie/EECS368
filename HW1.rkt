#lang racket

;;Homework 1
;;Kurt Slagle
;;Queens problem (modified from the Rooks problem solved in class)
;;The implementation is different than that described in class
;;the permutations are represented as [col(n) col(n-1) ... col(1)], and the number in the spots is the row #
;;i.e. [3 1 2] means a queen is in col 3 row 3, col 2 row 1, and col 1 row 2.

;;step 1 - enumerate-interval
(define (enumerate-interval l h)
  (if (> l h)
      '()
      (cons l (enumerate-interval (+ l 1) h))))

;;step 2 - iperm
(define (iperm l a)
  (cond ((null? l) '( () ))
        
        (else
         (append-map (lambda(x)
                       (map (lambda(p) (cons x p))
                            (iperm (remove x l) a)))
                     (append l a)))))

;;step 3 - diag?
(define (diag? col a)
  (define (left col a)
    (cond ((null? a) #f)
          ((= col (car a)) #t)
          (else (left(- col 1)(cdr a)))
          ))
  (define(right col a)
    (cond ((null? a) #f)
          ((= col (car a)) #t)
          (else (right(+ col 1)(cdr a)))))
  (cond ((null? a) #f)
        ;((null? (cdr a)) #f)
        (else (or (left (- col 1) a) (right (+ col 1) a)))
        )
  )                    

;4 - iqueens
(define (iqueens l a)
  (cond ((null? l) '( () ))
        (else
         (append-map (lambda(x)
                       (map(lambda(p) (if(not(diag? x p)) (cons x p ) '( ) ))
                           (iperm (remove x l) a)))
                     (append l a))))) 

;5 - q
(define (q n)
  (remove* '( () ) (iqueens(enumerate-interval 1 n) '() )))

;6 - test

;;I was unable to complete the implementation
#|
(define (test n)
  (cond((= n 0) '())
       (else (append |#
