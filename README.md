# Predicting Diabetes and Graph of Glucose
This repository is made for showing prediction if a person is diabetic and to show the normal glucose level of that person through the source [ihealth.sepdek.net](https://ihealth.sepdek.net)

######Group Members
* [Evan Harsojo](https://github.com/evnhar828)
* [Marselus Vinsens](https://github.com/mvinsens)
* [Reinard Johan Fenriawan](https://github.com/ReinardJohan)

## Preparation
To use, you need to
1. install R (version 3.5.1 preferred)
2. Rstudio (Suitable IDE for this project)
3. Internet Browser

Run R and install these packages with command `install.packages('packages_name')`
replace the `packages_name` with:
- `jsonlite`
- `plotly`
- `shinyjs`

be sure you are connected to the internet and are able to open
[ihealth.sepdek.net](https://ihealth.sepdek.net)

## How To Run
Follow these steps to run this project:
1. Download the necessary files on this repository
2. Run `Rstudio` app
3. Open `server.r` or `ui.r` and click `Run App`

## Data Filtering and Data Collecting
Data filter is using `subset` function:
`temp[i,] <- data[13, ]$value`
This function will filter the data so that only the 13th data will be present, which is the `glucose level` that will be essential
for the project. The data taken live from [ihealth.sepdek.net](https://ihealth.sepdek.net).
after the data is filtered, you can save it into csv, just print, or immediately use it into the `server.r`

to determine if the person is diabetic, we use the information about diabetic person from [diabetesdaily](https://www.diabetesdaily.com/learn-about-diabetes/understanding-blood-sugars/is-my-blood-sugar-normal/).
after we obtain the data previously from the source, we make it into R code, applying a fall off parameter by 5

## Data Training
We take some live sample and save them locally, then train the data to get the mean of blood sugar level. The mean we obtained from the data mined is used as the normals for our live data, and it will show us the fluctuation of the blood sugar level of the person live. This will provide us information about the logical number of their blood sugar level. We take the data from [ihealth.sepdek.net](https://ihealth.sepdek.net) for a duration of 120 second or 2 minutes that is taken every 2 second. To process the data gathered, we tried to make 2 separate datas, split into 80% and 20% respectively for data training and testing. But instead of that we use the fixed data for the data trained and the live data feed for the testing data. To train the data first we need to change the data type to character then to numeric, and then we use R basic library for mean to get the average.

## Display


## Disclaim
All data are owned by their own user.
This project was made for academic purposes only.
