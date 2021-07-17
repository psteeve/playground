(get-decoded-time)

(get-universal-time)

(decode-universal-time *)


(multiple-value-bind (second minute hour date month year day daylight-p zone)
            (decode-universal-time **)
          (declare (ignore day daylight-p zone))
          (encode-universal-time second minute hour date month year))
