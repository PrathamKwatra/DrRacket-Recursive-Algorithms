#lang racket
(define (successorLZO N)
  (cond[(null? N) (cons 1 N)]
      [(= 0 (first N)) (cons 1 (rest N))]
      [(cons 0 (successorLZO (rest N)))]
      )
  )
(define (predecessorLZO N)
  (cond[(null? N) (cons 0 N)]
      [(= 1 (first N)) (cons 0 (rest N))]
      [(cons 1 (predecessorLZO (rest N)))]
      )
  )


(define (addLZO N Z)
(cond  [(not (member 1 N)) Z]
       [(not (member 1 Z)) N]
       [(addLZO (predecessorLZO N) (successorLZO Z))]
))
(predecessorLZO '())
(successorLZO '())
(addLZO '(1 1 1 1) '(1 1 1 1 1))