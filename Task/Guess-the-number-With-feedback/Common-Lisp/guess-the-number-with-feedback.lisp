(defun guess-the-number-feedback (&optional (min 1) (max 100))
  (let ((num-guesses 0)
	(num (+ (random (1+ (- max min))) min))
	(guess nil))
    (format t "Try to guess a number from ~:d to ~:d!~%" min max)
    (loop do (format t "Guess? ")
	  (incf num-guesses)
	  (setf guess (read))
	  (format t "Your guess is ~[not a number.~;too small.~;too large.~;correct!~]~%"
		  (cond ((not (numberp guess)) 0)
			((< guess num) 1)
			((> guess num) 2)
			((= guess num) 3)))
	  until (and (numberp guess)
		     (= guess num)))
    (format t "You got the number correct on the ~:r guess!~%" num-guesses)))
