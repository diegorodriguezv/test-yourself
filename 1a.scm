;;; Exercises in the article "Test Yourself" by Joel Spolsky 
;;; https://www.joelonsoftware.com/2005/12/29/test-yourself/


; given function
(define (accumulate combiner null-value l) 
   (if (null? l)
       null-value
       (combiner (car l)
                 (accumulate combiner
                             null-value
                             (cdr l)))))

; couple of tests
(define (mysum l)
  (accumulate + 0 l))

(define (mymult l)
  (accumulate * 1 l))

; sum of squares without accumulate
(define (sos l)
  (if (null? l)
      0
      (+ (* (car l) (car l))
	 (sos (cdr l)))))

; multiply using the given function for increased nerdity but decreased performance (probably!?)
(define (fancy-square n)
  (mymult (list n n)))

; a proper square function
(define (square n)
  (* n n))

; my first version using map and square
(define (sum-of-squares l)
  (accumulate + 0 (map square l)))

(define (combine x y)
  (+ (* x x) y))

; my second version using a helper function, combine
(define (sum-of-squares2 l)
  (accumulate combine 0 l))

; master nerd's way (Joel)
(define (sum-of-squares3 l)
  (accumulate (lambda (x y) (+ (* x x) y)) 0 l))

; various tests
 
(square 7)
;Value: 49

(mymult '(7 7))
;Value: 49

(mysum '(1 2 3 4 5))
;Value: 15

(sos '(1 2 3 4 5))
;Value: 55

(sum-of-squares '(1 2 3 4 5))
;Value: 55

(sum-of-squares2 '(1 2 3 4 5))
;Value: 55

(sum-of-squares3 '(1 2 3 4 5))

