#lang racket

(require rackunit)

; Complete the function definitions below:

; Question 3a: Simple Sequential Substitution

;input-spec L1 is a list (possibly nested list)
; substitution is a pair (A1 B1) where A1 and B1 are expressions or values
;output-spec  every item of L1 which is equal (matches
; to A1 has B1 instead in the result.  Racket doesn't change list
; it creates a new structure where values in it are either copied over from
; the input L1, or are substitute values.
(define (substitute L1 substitution)
  (if (member (car substitution) L1)
      (if (equal? (car substitution) (car L1))
          (append (cdr substitution) (substitute (cdr L1) substitution))
          (list* (car L1) (substitute (cdr L1) substitution)))
        L1
   )
  )

(module+ test
  (check-equal? (substitute '(1 2 3) '(2 7)) '(1 7 3)
     " one item substitution of a value")
  (check-not-equal? (substitute '() '(2 7)) '(1 7 3) 
    " one item substitution of a value")
  (check-equal? (substitute '(a b c) '(c (7 8 ))) '(a b (7 8))
     " one item substitution of a list")
  (check-equal? (substitute '(c a b c) '(c (7 8 ))) '((7 8) a b (7 8)) 
    " one item substitution of a list, more than once")
  (check-equal? (substitute '(d (2) c) '((2) 7)) '(d 7 c)
     " one item substitution of a value")
  (check-not-equal? (substitute '() '(2 7)) '(a 7 b) 
    " one item substitution of a value")
  (check-equal? (substitute '(a b c d e f) '(f (a b c ))) '(a b c d e (a b c))
     " one item substitution of a list")
  (check-equal? (substitute '(c (a b) c) '((a b) (a c ))) '(c (a c) c) 
    " one item substitution of a list, more than once")
  
  )

; Question 3b: Second Sequential Substitution

;input-spec L1 is a list (possibly nested list)
; substitution1 and substitution2 are both pairs (A1 B1) and (A2 B2)
; where Ai and Bi are expressions or values.  
;output-spec  first substitutions are done of B1 for A1.  Then in that
; result substitutions are done of B2 for A2.  So if A2 is the same as B1
; then two changes might happen.
(define (sequentialSubstitute2 L1 substitution1 substitution2)
  (substitute (substitute L1 substitution1) substitution2)
  )

(module+ test
  (check-equal? (sequentialSubstitute2 '(1 3 (1 5) 3) '(3 (1 5)) '((1 5) 17)) '(1 17 17 17))
  (check-not-equal? (sequentialSubstitute2 '(1 3 (1 5) 3) '(3 (1 5)) '((1 5) 17)) '(1 (1 5)  17 (1 5)))
  (check-equal? (sequentialSubstitute2 '(a b (1 5) c) '(c (1 5)) '((1 5) b)) '(a b b b))
  (check-not-equal? (sequentialSubstitute2 '( (1 3) (1 5) 3) '( (1 3) (1 5)) '((1 5) 17)) '(1 (1 5)  17 (1 5)))
  (check-equal? (sequentialSubstitute2 '((a b) (1 5) c) '(c (1 5)) '((a b) (1 5))) '((1 5) (1 5) (1 5)))
  )

; Question 3c: Several Sequential Substitutions

;input-spec L1 is a list (possibly nested list)
; substitutions is a list of pairs ( (A1 B1) (A2 B2) ... (An Bn)
; where Ai and Bi are expressions or values.  
;output-spec  Each specified substitution is applied to the result
; of the previous substitution.  So for each Aj  the same as some Bi for
;i<j, multiple changes might happen.
(define (sequentialSubstitute L1 substitutions)
  (cond [(null? substitutions) L1]
        [(sequentialSubstitute (substitute L1 (car substitutions)) (cdr substitutions))]
  ) )

(module+ test
  (check-equal? (sequentialSubstitute '(1 2 3) '( ( 1 2) (2 3) (3 4))) '(4 4 4))
  (check-equal? (sequentialSubstitute '(4 2 4) '( (4 2) (2 3) (3 4))) '(4 4 4))
  (check-equal? (sequentialSubstitute '((4 2) 4) '( ((4 2) (3 2)) (2 3) (3 4))) '((3 2) 4))
  (check-not-equal? (sequentialSubstitute '(1 2 3) '( ( 1 2) (2 3) (3 4))) '(2 3 4))
  )


#|Extra Credit Problem|#


;input-spec expr is a list (possibly nested list)
; substitutions is a list of pairs ( (A1 B1) (A2 B2) ... (An Bn)
; where Ai and Bi are expressions or values.  
;output-spec  Each specified substitution is applied to the result
; of the previous substitution in parallel. For each element only a single
; substitution should be made. If there are two substitutions (1 2) and (2 3),
; then all 1s should be replaced with 2s, and 2s with 3s, but 1s should not be
; replaced with 3s. In addition, any sublist within expr that contains an expression that needs
; to be substituted must also be substituted.
(define (parallelSubstitute expr substitutions)
  ()
  )

(module+ test
  (check-equal? (parallelSubstitute '(1 3 (4 2 3)) '((3 6) (4 7))) '(1 6 (7 2 6))
                "Simple nested substitutions")
  (check-equal? (parallelSubstitute '(4 ((5 5) 3 (4 5)) 2 3 (5 5)) '(((5 5) 9) (4 (2 1))))'((2 1) (9 3 ((2 1) 5)) 2 3 9)
                "Complex nested substitutions")
  (check-equal? (parallelSubstitute '(1 2 3) '((1 2) (2 4) (4 5))) '(2 4 3)
                "simple parallel substitution")
  (check-equal? (parallelSubstitute '(1 (1 3) (2 (3 4)) ( 37 ((4 5) 1) )) '( ( (1 3) 2) (1 3) (3 (4 5)) ( (4 5) 6))) '( 3 2 (2  ( ( 4 5) 4)) (37 ( 6 3)))
                "complex nested parallel substitution")
  )
