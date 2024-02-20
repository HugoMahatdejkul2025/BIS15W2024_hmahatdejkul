# BIS15W2024_hmahatdejkul
Ah yes you have found Hugo Mahatdejkul's mediocre repository. 
## Contact info:
Feel free to contact the 3rd year genomics major at anytime [email](htma@ucdavis.edu)
## Warning: 
Although, do so at your own risk, as he is a threat to all in terms of coding :).

!!!!!!!!!!!!!!MY HOMEWORK IS IN THE CORRESPONDING LAB!!!!!!!!!!!!!!

Cheat sheet:
library("tidyverse") /// library(tidyverse)	
library("janitor") // library(janitor)
install.packages("skimr")
library("skimr")


superhero_powers <- read_csv("data/super_hero_powers.csv")
superhero_powers<-clean_names(superhero_power)

Functions to know:
tabyl(superhero_info, #column name) #gives percentage info
new_variable<-
Superhero_info %>%
select(column 1,column 2,column 3)
filter(column 2 == “good/bad #logical or xxxxx #& xxxx)	
arrange(column)
arrange(desc(column))
mutate(#name of new column added = #adjustment/manipulation of old column)
mutate_all(tolower) #makes all of superhero_info lowercase
mutate(across(c("column 4", "column 7"), tolower)) #only mutate these 2 columns 
mutate(newcolname=ifelse(existing column==-999 #logical, #set variable to this if true, #set variable to this if false (usually the “existing column”))
ifelse(logical,if logical was true, if logical was false))
mutate(across(c(column1,column 2,column3),as_factor))
head(n=4) will show the top 4 of the table
mean(col2,na.rm=T)

Sleepdata %>%
	filter(bodymass>20)
	summarize(averageSleep=mean(sleep_total) #will give data based on the function and name it as the name of the object (in this case averageSleep) that we choose.
functions:mean(),min(),max(),sd(),n()

Example of summarize while only looking at fatter people

msleep %>%
  filter(bodywt>200) %>%
  summarize(mean_sleep_lg=mean(sleep_total),
            	min_sleep_lg=min(sleep_total),
            	max_sleep_lg=max(sleep_total),
            	sd_sleep_lg=sd(sleep_total),
           		total=n()) #gives total number of rows/observations 
n_distinct() will count the number of unique values in a column (like 2 alabama, 7 californias,4 idaho in a column will result in 3 distinct variables.)
msleep %>%
summarize(n_genera=n_distinct(genus)) #this is going to count the number of distinct genus in msleep. (example: bug,bug.bug,dog,dog,cat will return 3)

msleep %>%
group_by(column of interest) #will combine the values with the same name/ variables in the column before continuing
summarize(meanweightbygender=mean(weight))
#NaN means no data for at least 1 in the group
msleep %>%
 	 group_by(vore) %>% #we are grouping by feeding ecology, a categorical variable
  		summarize(min_bodywt = min(bodywt),
    	  	      max_bodywt = max(bodywt),
      	   	   mean_bodywt = mean(bodywt),
       	 	    total=n())
Group_by mean calculations can be screwed up by Nas.

summarize(number_NAs=sum(is.na(column we want to do math on))) #will tell us how many nas there are. We can just pull out all nas from our calculations:

penguins %>%
  filter(!is.na(body_mass_g)) #filter out the NAS from our column 200IQ so we can do calculations
group_by(islands)
summarize(meanbodymass=mean(body_mass_g)	

We can also group_by() multiple variables i.e. group_by(island, species) will then give unique combinations of island and species during calculations when using summary.

For counts: use tabyl
penguins %>%
  tabyl(island,species)

across() can reduce clutter:
penguins %>%
  summarize(across(c(species, island, sex), n_distinct))
VS
penguins %>%
  summarize(distinct_species = n_distinct(species),
            distinct_island = n_distinct(island),
            distinct_sex = n_distinct(sex))

penguins %>%
  summarize(across(contains("mm"), mean, na.rm=T)) # find mean with anything w/ mm
When dealing with matrix:
meantemp<-rowMeans(Temp_matrix) #the rowMeans command will give means of each row and we just assign it to a new variable 
new_matrix<-cbind(temp_matrix,meantemp) #will bind mean temp column to the temp_matrix
Specific value from a matrix: [1,2] #row 1 col 2 [,2] refers to column 2 


glimpse(superhero_info)
summary(superhero_info)
dim(superhero_info) #gives variables col and observations row

Facto is like a category
Practice midterm 1:
Variable names: names(x)
Summarize data:glimpse(x)
Number of distinct orders: n_distinct()
Which island had the most diversity?
Penguins %>%
	group_by(island)
	filter(!is.na(island))
	select(name,island)
	summarize(number_of = n=())
	arrange(desc(island))
