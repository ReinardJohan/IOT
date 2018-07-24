# Predicting Diabetes and Graph of Glucose
This repository is made for showing prediction if a person is diabetic and to show the normal glucose level of that person through the source [ihealth.sepdek.net](https://ihealth.sepdek.net)

Group Members
* Evan Harsojo
* Marselus Vinsens
* Reinard Johan Fenriawan

## Preparation
To use, you need to
1. install R (version 3.5.1 preferred)
2. Rstudio
3. Internet Browser

Run R and install these packages with command `install.packages('packages_name')`
replace the `packages_name` with:
- `jsonlite`
- `plotly`
- `shinyjs`

be sure you are connected to internet and able to open
[ihealth.sepdek.net](https://ihealth.sepdek.net)

## How To Run
follow these steps to run this project:
1. Download the files on this repository
2. Run `Rstudio` app
3. Open `server.r` or `ui.r` and click `Run App`

## Data Filtering and Data Collecting
Data filter is using `subset` function:
`temp[i,] <- data[13, ]$value`
that function will make you only that the value of the sensor and only take the `glucose level` which are used in this project.
the data taken live from [ihealth.sepdek.net](https://ihealth.sepdek.net)
after the the data filtered, you can save it into csv, just print, or immediately use it into the `server.r`

to determine if the person is diabetic, we use the information about diabetic person from [diabetesdaily](https://www.diabetesdaily.com/learn-about-diabetes/understanding-blood-sugars/is-my-blood-sugar-normal/)

## Data Training

## Display

## Disclaim
