(in-package :series)


(defun primep (n)
  (zerop
   (collect-length
    (choose-if (lambda (d)
                 (zerop (mod n d)))
               (scan-range :from 2 :upto (sqrt n))))))

(defun all-primes ()
  (choose-if 'primep (scan-range :from 2)))
