# the elements of statistical learning, Exercise R code
the.elements.of.statistical.learning-2009

book: http://statweb.stanford.edu/~tibs/ElemStatLearn/

finish:<br>
Exercise 4.9 : <br>

Write a computer program to perform a quadratic discriminant
analysis by fitting a separate Gaussian model per class. Try it out on the
vowel data, and compute the misclassification error for the test data. The
data can be found in the book website www-stat.stanford.edu/ElemStatLearn

	# train data 	: http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/vowel.train
	# test  data 	: http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/vowel.test
	# info		: http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/vowel.info.txt


<big>DEMO

	table( train$y )
	## 
	##  1  2  3  4  5  6  7  8  9 10 11 
	## 48 48 48 48 48 48 48 48 48 48 48


