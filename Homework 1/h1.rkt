#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (zip l1 l2);two inputs l1 is for list 1 and l2 is for list 2
   (if (or (null? l1) (null? l2));if condition first checks if any of the list is a null, base case

       (cond;if the condition is true...there are three possible cases
         
         [(and (null? l1) (null? l2)) '()];both list 1 and 2 are null, thus returning an empty list
         [(null? l1) l2];only list 1 is a null, therefore returning list 2
         [(null? l2) l1]);only list 2 is a null, therefore returning list 1

       (append;this is the recursive case
        (cons (first l1) (cons (first l2) '()));there are two cons to avoid (1 . 1) situation
        (zip (rest l1) (rest l2)));this calls the function again while removing the first elements from both lists
  ))
;Test Bed
;(display "Testing Zip Function")
(define-test-suite test_zip; perform unit tests
(check-equal? (zip '(1 2 3) '(4 5 6)) '( 1 4 2 5 3 6))
(check-equal? (zip '( (1 2 3) 4) ' (5 (6 7) 8 )) ' ( ( 1 2 3) 5 4 (6 7 ) 8))
  )
;(run-tests test_zip)

(define (Pell x)
  (if (<= x 2) 1.0 (+ (* 2 (Pell (- x 1))) (Pell (- x 2)))))
(define (p x)
  (if (<= x 2) 1.0 ( / (+ (Pell (- x 1)) (Pell x)) (Pell x))))


(define (C n k)
  (cond [(or (= n 0) (= k 0) (= n k)) 1] [(+ (C (- n 1) k) (C (- n 1) (- k 1)))]))
;(display "\nTesting C Function\n")
;(C 25 10)

(define (funca L)
  (if (null? L) 0 (- 1 (funca (rest L)))))

(define (funcb n)
(if (> 2 n) 0 (+ 1 (funcb (quotient n 2)))))