#1. Use ”Su_raw_matrix.txt” for the following questions (30 points).
setwd("C:\\Users\\DELL\\Desktop\\CSC587\\Week2\\datamining-main\\Rscripts")
getwd()
# Load in the data set from disk.
# (a)Use read.delim function to read Su_raw_matrix.txt into a variable called su.
data.file <- file.path('data', 'Su_raw_matrix.txt')
su <- read.delim(data.file, header = TRUE)
# (b) Use mean and sd functions to find mean and standard deviation of Liver_2.CEL column
mean(su[["Liver_2.CEL"]])
sd(su[["Liver_2.CEL"]])
# (c) Use colMeans and colSums functions to get the average and total values of each column.
colMeans(su)
colSums(su)

#2. Use rnorm(n, mean = 0, sd = 1) function in R to generate 10000 numbers for the following (mean, sigma) pairs 
#and plot histogram for each, meaning you need to change the function parameter accordingly. 
#Then comment on how these histograms are different from each other and state the reason. (20 points)
#(a) mean=0, sigma=0.2
sigma1 <- data.frame(X = rnorm(10000, mean = 0, sd = 0.2))
#(b) mean=0, sigma=0.5
sigma2 <- data.frame(X = rnorm(10000, mean = 0, sd = 0.5))
#Please save your figures as image from RStudio. 
#(Hint: to see the difference in plots you may need to set the xlim parameter in plot function to c(-5,5))
# Start visualizing data using the ggplot2 package.
library('ggplot2')
sigma1ggpot = ggplot(sigma1, aes(x = X)) + geom_histogram(binwidth = 0.001) + xlim(c(-5, 5))
sigma2ggpot = ggplot(sigma2, aes(x = X)) + geom_histogram(binwidth = 0.001) + xlim(c(-5, 5))
ggsave("histogram_sigma1.png", plot = sigma1ggpot, width = 2, height = 2, dpi = 5000)
ggsave("histogram_sigma2.png", plot = sigma2ggpot, width = 2, height = 2, dpi = 5000)
#Answer the sigma 0.5 is lower/shorter and wider.The sigma 0.5 is lower/shorter and wider. 
#The reason for these differences is that the standard deviation (sigma) controls the spread of the distribution.
#A smaller sigma results in a narrower distribution, while a larger sigma leads to a wider distribution.

#3. Perform the steps below with ”dat” dataframe which is just a sample data for you to observe how each plot function
#( 3b through 3e ) works. Notice that you need to have ggplot2 library installed on your system. Please refer slides how
#to install and import a library. Installation is done only once, but you need to import the library every time you need it
#by saying library(ggplot2). Then run the following commands for questions from 3a through 3e and observe how
#the plots are generated first. (20 points)
#(a) dat <- data.frame(cond = factor(rep(c("A","B"), each=200)), rating = c(rnorm(200),rnorm(200, mean=.8)))
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)), rating = c(rnorm(200),rnorm(200, mean=.8)))
#(b) # Overlaid histograms
#ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, alpha=.5, position="identity")
t1 = ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, alpha=.5, position="identity")
#(c) # Interleaved histograms
#ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")
t2 = ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")
#(d) # Density plots
#ggplot(dat, aes(x=rating, colour=cond)) + geom_density()
t3 = ggplot(dat, aes(x=rating, colour=cond)) + geom_density()
#(e) # Density plots with semitransparent fill
#ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)
t4 = ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)
#(f) Read ”diabetes_train.csv” into a variable called diabetes and apply the same functions 3b through 3e for the
#mass attribute of diabetes and save the images. (Hint: instead of cond above, use the class attribute to color
#your groups. When you have fill option, your plots should show same type of chart for both groups in different
#colors on the same figure. Keep in mind that diabetes and dat are both DataFrames)
data.file <- file.path('data', 'diabetes_train.csv')
diabetes <- read.csv(data.file, header = TRUE, sep = ',')
p1 = ggplot(diabetes, aes(x=mass, fill=class)) + geom_histogram(binwidth=.5, alpha=.5, position="identity")
p2 = ggplot(diabetes, aes(x=mass, fill=class)) + geom_histogram(binwidth=.5, position="dodge")
p3 = ggplot(diabetes, aes(x=mass, colour=class)) + geom_density()
p4 = ggplot(diabetes, aes(x=mass, fill=class)) + geom_density(alpha=.3)
ggsave("histogram_3fb.png", plot = p1, width = 8, height = 8, dpi = 1000)
ggsave("histogram_3fc.png", plot = p2, width = 8, height = 8, dpi = 1000)
ggsave("histogram_3fd.png", plot = p3, width = 8, height = 8, dpi = 1000)
ggsave("histogram_3fe.png", plot = p4, width = 8, height = 8, dpi = 1000)
ggsave("histogram_3b.png", plot = t1, width = 8, height = 8, dpi = 1000)
ggsave("histogram_3c.png", plot = t2, width = 8, height = 8, dpi = 1000)
ggsave("histogram_3d.png", plot = t3, width = 8, height = 8, dpi = 1000)
ggsave("histogram_3e.png", plot = t4, width = 8, height = 8, dpi = 1000)

#4. Read the titanic.csv file from DATA folder to a variable named passengers and perform the following steps and
#explain the operation very briefly (20 points):
data.file <- file.path('data', 'titanic.csv')
passengers <- read.csv(data.file, header = TRUE, sep = ',')
#(a) passengers \%>\% drop_na() \%>\% summary()
#First drops rows where any column contains a missing value from passengers. Then make the summary.
library(tidyr)
passengers %>% drop_na() %>% summary()
#(b) passengers \%>\% filter(Sex == "male")
#This code filters the passengers data to include only rows where the 'Sex' column is equal to "male".
library(dplyr)
passengers %>% filter(Sex=="male")
#(c) passengers \%>\% arrange(desc(Fare))
#This code arranges the passengers data in descending order based on the 'Fare' column.
passengers %>% arrange(desc(Fare))
#(d) passengers \%>\% mutate(FamSize = Parch + SibSp)
#This code adds a new column 'FamSize' with column 'Parch' and 'SibSp' to the passengers data.
passengers %>% mutate(FamSize = Parch + SibSp)
#(e) passengers \%>\% group_by(Sex) \%>\% summarise(meanFare = mean(Fare), numSurv = sum(Survived))
#This code groups the passengers data by the 'Sex' column. Then It then calculates the mean of 'Fare' and the sum of 'Survived' for each group ('Sex').
passengers %>% group_by(Sex) %>% summarise(meanFare = mean(Fare), numSurv = sum(Survived))
#5. By using quantile(), calculate 10th,30th,50th,60th percentiles of skin attribute of diabetes data. (10 points)
skin <- with(diabetes_train_dat, skin)
quantiles_skin <- quantile(skin, c(0.1, 0.3, 0.5, 0.6))
print(quantiles_skin)
