#lang racket

(provide time-it)

(require (for-syntax syntax/parse))

(define-syntax (time-it stx)
  (syntax-parse stx
    [(_ task)
     #'(thunk-time-it (lambda () task))]))

(define (thunk-time-it task)
  (define before (cim))
  (define answer (task))
  (define delta (- (cim) before))
  (printf "time: ~a ms\n" delta)
  answer)

(define cim current-inexact-milliseconds)

(time-it (printf "toto\n"))
