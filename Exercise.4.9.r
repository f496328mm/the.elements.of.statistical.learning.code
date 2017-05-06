
	# exercise 4.9
	# Write a computer program to perform a quadratic discriminant
	# analysis by fitting a separate Gaussian model per class. Try it out on the
	# vowel data, and compute the misclassification error for the test data. The
	# data can be found in the book website www-stat.stanford.edu/ElemStatLearn

	#function
	
	# 最後預測  final prediction
	pred.fun=function(total.model,train){
		
		pred.train = 
				sapply(c(1:length(total.model)) , 
				function(x)
				predict(total.model[[x]],train[,c(-1,-2),with=F])
				) %>% data.table
		
		colnames(pred.train) = 
			paste("y=",c(1:length(total.model)),sep="") 
		
		#apply( pred.train , 1 , sum )
		return(pred.train)
	}

	# 製造模型 build OLS model
	classification.fun=function(train,test,i=4){

		temp 	= train[,-1,with=F]
		temp$y[ temp$y!=i ]=0
		temp$y[ temp$y==i ]=1
		
		model 		= lm(y~.,data=temp)
		#summary(model)
		pred.train 	= predict( model,temp[,-1,with=F] )		
		pred.test 	= predict( model,test[,c(-1,-2),with=F] )				
		
		return( list(  model  ) )
	}
	# Probability -> classification
class.pred.fun=function(tem){
	class.y = which( ( tem %in% max(tem) ) ==1 )
	return(class.y)
}

#==============================================================
	# exercise 4.9
	# main
	library(data.table)
	library(dplyr)

	setwd("d:/ml")
	# input data
	train = fread("vowel.train.txt")
	test = fread("vowel.test.txt")

	#misclassification , balance data, 11 classification
	table( train$y )

	# 做多模型, 1 vs 非1
	set.seed(100)
	temp = sapply(c(1:11),
			function(x)
			classification.fun(train,test,i=x)
			)
	# total model, 11 個 model
	total.model = temp
	#--------------------------------------------
	# train pred
	pred.train = pred.fun(total.model,train)
	# 機率改成分類
	pred.train.class = apply( pred.train,1,class.pred.fun)
	# confusion matrix
	t.train.matrix = table(train$y,pred.train.class)
	t.train.matrix
	# Correct percent
	sum( diag( t.train.matrix ) )/sum(t.train.matrix)
	#--------------------------------------------
	# test pred
	pred.test = pred.fun(total.model,test)
	# 機率改成分類
	pred.test.class = apply( pred.test,1,class.pred.fun)
	# confusion matrix
	t.test.matrix = table(test$y,pred.test.class)
	t.test.matrix
	# Correct percent
	sum( diag( t.test.matrix ) )/sum(t.test.matrix)
	#--------------------------------------------








