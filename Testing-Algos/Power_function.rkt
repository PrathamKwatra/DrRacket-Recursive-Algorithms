#lang racket
(define (new_power n p)
  (cond [(> p 1) (* n (new_power n (- p 1)))] [(< p 1) (* (/ n) (new_power n (+ p 1)))] [n])
  )
(define (power_neg n p)
  (if (>= p 0) 1 (* (/ n) (power_neg n (+ p 1))) )
  )