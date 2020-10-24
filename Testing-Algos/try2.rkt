#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (square n)
  (* n n)
  )
;Test Bed
;(display "Question 1 Tests(10 Points)\n")
(define-test-suite test_square
  (check-equal? (square 1)1 )
  (check-equal? (square 2) 4)
  (check-equal? (square 3) 9)
  (check-equal? (square 4) 16)
  (check-equal? (square 5) 25)
  (check-equal? (square 6) 36)
  (check-equal? (square 7) 49)
  (check-equal? (square 8) 64)
  (check-equal? (square 9) 81))
;(run-tests test_square)
(define (f x)
  (if (= x (+ x 1)) (display "This will never be true") (display "The result should always be this")))
(define (fibo n)
  (if (>= 2 n ) 1 (+ (fibo (- n 1)) (fibo (- n 2))))
  )

(fibo 1)(fibo 2)(fibo 3)