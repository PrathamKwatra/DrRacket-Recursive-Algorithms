#lang racket
(define (successorDP N)
  (cond [(or (equal? N '(zero)) (equal? N 'zero)) '(DP1 zero)]
        [(equal? (first N) 'D) #|(cons 'DP1 (cons (rest N) '()))|# (list 'DP1 (rest N))]
;        [(equal? N '(DP1 zero)) '(DP1 zero)]
        [#|(cons 'D (cons (successorDP (rest N)) '()))|# (list 'D (successorDP (rest N)))]
        )
  )

( successorDP( successorDP (successorDP '(DP1 zero))))