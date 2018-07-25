# Predicting Diabetes and Graph of Glucose
This repository is made for showing prediction if a person is diabetic and to show the normal glucose level of that person through the source [ihealth.sepdek.net](https://ihealth.sepdek.net)

###### Group Members
* [Evan Harsojo](https://github.com/evnhar828)
* [Marselus Vinsens](https://github.com/mvinsens)
* [Reinard Johan Fenriawan](https://github.com/ReinardJohan)

## Preparation
To use, you need to:
1. install R (version 3.5.1 preferred)
2. Rstudio (Suitable IDE for this project)
3. Internet Browser

Run R and install these packages with command `install.packages('packages_name')`
replace `packages_name` with:
- `jsonlite`
- `plotly`
- `shinyjs`

be sure you are connected to the internet and are able to open
[ihealth.sepdek.net](https://ihealth.sepdek.net)

## How To Run
Follow these steps to run this project:
1. Download the necessary files on this repository
2. Run `Rstudio` app
3. Open `da.r` or `training.r` and click `Run App`, `da.r` plots the glycose level line chart alongside with the mean level displayed
in shiny, while `training.r` performs data training and figure out if the glycose level is high enough to be considered diabetic.

## Flowchart
![picture](https://github.com/ReinardJohan/diabetes-prediction/blob/master/img/flowchart.jpg)

## Data Filtering and Data Collecting
Data filter is using `subset` function:
`temp[i,] <- data[13, ]$value`
This function will filter the data so that only the 13th data will be present, which is the `glucose level` that will be essential for the project and only the `value` is taken since we only need the value of the `glucose level`.
The data taken live from [ihealth.sepdek.net](https://ihealth.sepdek.net).
after the data is filtered, you can save it into csv, just print on the console, or immediately use it into the `server.r`

to determine if the person is diabetic, we use the information about diabetic person from [diabetesdaily](https://www.diabetesdaily.com/learn-about-diabetes/understanding-blood-sugars/is-my-blood-sugar-normal/).
after we obtain the data previously from the source, we make it into R code, applying a fall off parameter by 5 because there is some slight differences of blood sugar level between people.

## Data Training
We take some live sample and save them locally, then train the data to get the mean of blood sugar level. The mean we obtained from the data mined is used as the normals for our live data, and it will show us the fluctuation of the blood sugar level of the person live. This will provide us information about the logical number of their blood sugar level. We take the data from [ihealth.sepdek.net](https://ihealth.sepdek.net) for a duration of 120 second or 2 minutes that is taken every 2 second. To process the data gathered, we tried to make 2 separate datas, split into 80% and 20% respectively for data training and testing. But instead of that we use the fixed data for the data trained and the live data feed for the testing data. To train the data first we need to change the data type to character then to numeric, and then we use R basic library for mean to get the average.

## Display
in the display section, we make it into 2 kind of displays:
1. plotting into graph that show the mean and the live data of the glucose level.
![picture](https://github.com/ReinardJohan/diabetes-prediction/blob/master/img/graph.jpg)
the blue line show the mean of the data received, the mean based on the data training

2. pie chart showing the `TRUE` and `FALSE` which show if the person is diabetic or not by percentage.
![picture](https://github.com/ReinardJohan/diabetes-prediction/blob/master/img/piechart.jpg)

## Notes
The way we obtain live data from [ihealth.sepdek.net](https://ihealth.sepdek.net) is by recurring the function for taking data and immidiately call the data to the grahical.

The lines in graph are separated into 2 different lines :
1. Blue lines is obtained from the trained data (data collected randomly trough the time and was done statistical average). It's purpose    is for showing the fluctuation of the average / expected glucose level to be shown for normal.
2. Green lines is obtained from live data from [ihealth.sepdek.net](https://ihealth.sepdek.net) and it will be showing new data every 
   seconds.
   
The Pie chart was made to show the the chance of that person (owner of data) is having an abnormal glucose level that might affect his / her health. The pie chart is based on ratio of `TRUE` and `FALSE` from live data -/+ 5 </> from the mean of trained datas. This pie chart can be shown as a percentage of Normal vs. Abnormal blood sugar level.

## Disclaim
All data are owned by their own user.
This project mainly used for student project at UPH.
This project was made for academic purposes only.
