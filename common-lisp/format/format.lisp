(format t "~$" pi)

(format t "~5$" pi)

(format t "~v$" 3 pi)

(format t "~#$" pi)


(format t "~,5f" pi)

(format t "~d" 1000000)
(format t "~:d" 1000000)

(format t "~@d" 1000000)

(format t "~:@d" 1000000)

(format nil "The winners are:~{ ~S~}." '(fred harry jill))

(format nil "Pairs:~{ <~S, ~S>~}." '(a 1 b 2 c 3))

(format nil "~100~")

(format nil "~100|")



