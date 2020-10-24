#lang racket
(define (seqDec n)
   (if (= n 0) '(0) (cons n (seqDec (- n 1)))))

(define (seqInc n)
   (if (> n 0) (cons n (seqInc (- n 1))) '(0)))
(seqInc 6)