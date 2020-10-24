#lang racket
(define (countOne L)
  (if (null? L) 0 (+ (first L)(countOne (rest L)))))
(define (countOneA L)
  (if (null? L) 0 (if (equal? (first L) 1) (+ 1 (countOneA (rest L))) (countOneA (rest L)))))

(define (change L)
  (if (null? L) '()
      (if (= (first L) 1) (cons 0 (change (rest L)))
          (cons 1 (change (rest L))))))

;(map (lambda (x) (+ x 1)) '(1 3 5 7))

(define (prod x y)
  (if (or (= y 0) (= x 0)) 0
      (if (and (< y 0) (< x 0)) (prod (abs y) (abs x))
          (if (< y 0)
              (prod y x)
              (+ x (prod x (- y 1)))))))
(define ( prod1 x y )
( cond [(or (= x 0)(= y 0))0]
       [(and (< y 0) (< x 0)) (+ x (prod1 x (+ y 1)))]
       [(< y 0) (+ y (prod1 y (- x 1)))]
       [(> y 0) (+ x ( prod1 x (- y 1)))]
     
))

(prod 12 -1)