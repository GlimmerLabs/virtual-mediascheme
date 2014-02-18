#lang racket
(require gigls/unsafe)

(define canvas (image-new 200 200))
(image-select-ellipse! canvas REPLACE 10 20 90 120)
(context-set-fgcolor! "black")
(image-fill! canvas)
(context-set-fgcolor! "red")
(image-stroke-selection! canvas)
(image-select-nothing! canvas)
(image-show canvas)
