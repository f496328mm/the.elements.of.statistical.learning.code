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


 #  DEMO <br> 
```sh
	#table( train$y )
	 1  2  3  4  5  6  7  8  9 10 11 
	 48 48 48 48 48 48 48 48 48 48 48
```	
 #  做多模型, 1 vs 非1 <br> 	
 
```sh
	t.train.matrix
	     pred.train.class
	       1  2  3  4  5  6  7  8  9 10 11
	   1  39  3  0  0  0  0  0  4  0  2  0
	   2  18 21  9  0  0  0  0  0  0  0  0
	   3   1  6 30  7  0  0  0  0  0  0  4
	   4   1  0  5 40  0  2  0  0  0  0  0
	   5   0  0  0  1 32  1 10  3  0  1  0
	   6   2  0  2 10 14  5 10  3  0  0  2
	   7   0  0  3  1 12  0 11 15  1  5  0
	   8   0  0  0  0  0  0  0 36  3  9  0
	   9   1  0  0  0  0  0  0 13 12 22  0
	   10  1  0  0  0  0  0  0  2  8 37  0
	   11 10  2  5  5  5  2  1  1  2  2 13
```	 
 #  Correct percent <br> 
 ```sh
	sum( diag( t.train.matrix ) )/sum(t.train.matrix)
	 [1] 0.5227273	
```		
	
	
	
	
	
	


