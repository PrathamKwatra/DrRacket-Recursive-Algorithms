#lang racket
;input-spec: arity of 2, mRock is a rock notation list and nRock is rock notation list of length L
;output-spec: one rock notation list
(define (addRock mRock nRock)
;(cond [(null? mRock) nRock]
;[(null? nRock) mRock]
(append mRock nRock))
;(addRock '() '(rock))

(define (doubDB N)
  (if (equal? N 'zero) 'zero (list 'D N)))

(define (succDB N)
  (cond [(equal? N 'zero) '(DP1 zero)]
        [(equal? (first N) 'D) (cons 'DP1 (rest N))]
        [(doubDB (succDB (second N)))]
   )
 )

(define (preDB N)
  (cond [(equal? '(DP1 zero) N) 'zero]
        [(equal? (first N) 'D) (succDB (doubDB (preDB (second N))))]
        [(doubDB (second N))]
       )
  )

(define (addDB N X)
  (cond [(equal? 'zero N) X]
        [(equal? 'zero X) N]
        [(addDB (preDB N) (succDB X))] ) )
;(addDB '(D (DP1 zero)) '(DP1 (D (DP1 zero))))