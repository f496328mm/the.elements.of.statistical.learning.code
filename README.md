# the elements of statistical learning, Exercise R code
the.elements.of.statistical.learning-2009

book: http://statweb.stanford.edu/~tibs/ElemStatLearn/

finish:<br>
Exercise 4.9 : <br>

Write a computer program to perform a quadratic discriminant
analysis by fitting a separate Gaussian model per class. Try it out on the
vowel data, and compute the misclassification error for the test data. The
data can be found in the book website www-stat.stanford.edu/ElemStatLearn <br>
使用高斯模型(迴歸)，對 vowel data 進行多元分類，主要利用 1 vs 非1 去做多個迴歸 model<br>
data 如下， 1 vs 非1 的方法可以參考 code，如有問題麻煩留言給我

	# train data 	: http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/vowel.train
	# test  data 	: http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/vowel.test
	# info		: http://statweb.stanford.edu/~tibs/ElemStatLearn/datasets/vowel.info.txt


 #  DEMO <br> 
```sh
	 table( train$y )
	 1  2  3  4  5  6  7  8  9 10 11 
	 48 48 48 48 48 48 48 48 48 48 48
	 # 11 類，做 11 個 1 vs 非1 的迴歸 model
	 #  y = 1 : 11
	 # example:	model_1 : y = 1, y[y!=1]=0
	 #		model_2 : y = 2, y[y!=2]=0
	 #		   ....................
	 #		model_11 : y = 11, y[y!=11]=0
```	
 #  Confusion matrix <br> 	
 
```sh
     		pred_train_class
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
	   
     		pred_test_class
  	    1  2  3  4  5  6  7  8  9 10 11
   	1  41  0  1  0  0  0  0  0  0  0  0
   	2  25  5  9  0  0  0  0  0  0  3  0
   	3   4  5 21  8  0  4  0  0  0  0  0
   	4   0  0  4 26  6  6  0  0  0  0  0
   	5   0  0  0 15  9 12  3  3  0  0  0
   	6   1  0  6 13  9  8  2  0  0  3  0
   	7   0  5  0  6 18  3  0  1  2  7  0
   	8   0  0  0  0  4  0  0 18  1 19  0
   	9   0  0  2  0  0  0  0  6  3 31  0
	10 12  0  4  0  0  0  0  0  4 22  0
   	11 11  1  8  9  0  1  0  0  2  9  1	   
```	 
 #  Correct percent <br> 
 ```sh

	train :
	sum( diag( t.train.matrix ) )/sum(t.train.matrix)
	 [1] 0.5227273	
	test : 
	sum( diag( t.test.matrix ) )/sum(t.test.matrix)
	 [1] 0.3333333	 
```		
	

	
	
	


