#lang racket
(require gigls/unsafe)

(define canvas (image-show (image-new 200 200)))
(define tommy (turtle-new canvas))
(turtle-teleport! tommy 100 100)
(repeat 30 (lambda () 
             (turtle-forward! tommy (random 10)) 
             (turtle-turn! tommy (random 20))))