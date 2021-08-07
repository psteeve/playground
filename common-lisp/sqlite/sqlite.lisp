(clsql:connect '("/tmp/worldcup.db") :database-type :sqlite3)

(clsql:def-view-class final ()
  ((city :accessor city
         :initarg :city
         :type string)
   (year :accessor year
         :initarg :year
         :type integer)
   (winner :accessor winner
           :initarg :winner
           :type keyword)))

(defun add-datas ()
  (let ((clsql:*db-auto-sync* t))
    (loop for (city year winner) in '(("Paris" 1938 :ita)
                                      ("Bern" 1954 :deu)
                                      ("Solna" 1958 :bra)
                                      ("Santiago" 1962 :bra)
                                      ("Mexico City" 1970 :bra)
                                      ("Munich" 1974 :deu)
                                      ("Madrid" 1982 :ita)
                                      ("Rome" 1990 :deu)
                                      ("Pasadona" 1994 :bra)
                                      ("Yokohama" 2002 :bra)
                                      ("Berlin" 2006 :ita)
                                      ("Rio" 2014 :deu))
          for final = (make-instance 'final :city city
                                            :year year
                                            :winner winner)
          finally (return final))))

(clsql:select 'final :flatp t)

(clsql:enable-sql-reader-syntax)

(clsql:select 'final :where [= [city] "Rome"] :flatp t)

(clsql:select [winner] [count [*]]
              :from [final] :group-by [winner])

(clsql:query "select distinct winner from final")

(clsql:do-query ((winner) [select [distinct [winner]]
                 :from [final]])
  (princ winner))

(loop for winner being the records
        of [select [winner] :from [final]]
      count (string= ":ITA" winner))
