metoffice
Script to process the UK Meteorological Office XML feed \
I created this script as a cyclist because I wanted a forward view of key weather data at 3-hourly intervals: \
-- temperature \
-- wind speed (mph) \
-- wind gust (mph) \
-- likelihood of precipitation (rain) as a % \
-- weather type (such as "Cloudy") \
The script uses python for some preprocessing but most of the data selection and formatting is carried out in gawk.  \
The main purpose of the script is to output the weather data from Conky so it shows on the dekstop. Your entry in Conky will look something like this: \
${exec /home/myaccount/bin/met_office/met.sh 352253 1ab1cd1-a123-12ab-a1b2-12ab1234ab12} \
This shows a dummy API key (available for free at https://www.metoffice.gov.uk/services/data/datapoint) and the UK Met Office location code (in this case Leighton Buzzard, UK). \
Here is some sample data: \
Date: 14-02-2022\
15:00hrs  | Likelihood of rain: 17% |  Wind speed: 16mph | Wind gust:  29mph |  Temp:   7C |  Cloudy\
18:00hrs  | Likelihood of rain: 15% |  Wind speed: 13mph | Wind gust:  27mph |  Temp:   6C |  Cloudy\
21:00hrs  | Likelihood of rain:  4% |  Wind speed: 13mph | Wind gust:  27mph |  Temp:   5C |  Partly cloudy (night)\
-----------------------------------------------------------------------------------------------------------------------
Date: 15-02-2022\
00:00hrs  | Likelihood of rain:  0% |  Wind speed: 11mph | Wind gust:  25mph |  Temp:   4C |  Clear night\
03:00hrs  | Likelihood of rain:  0% |  Wind speed:  9mph | Wind gust:  25mph |  Temp:   3C |  Clear night\
06:00hrs  | Likelihood of rain: 12% |  Wind speed: 13mph | Wind gust:  27mph |  Temp:   4C |  Cloudy\
09:00hrs  | Likelihood of rain: 91% |  Wind speed: 18mph | Wind gust:  34mph |  Temp:   7C |  Heavy rain\
12:00hrs  | Likelihood of rain: 84% |  Wind speed: 16mph | Wind gust:  31mph |  Temp:   8C |  Heavy rain\
15:00hrs  | Likelihood of rain: 33% |  Wind speed: 11mph | Wind gust:  25mph |  Temp:   9C |  Cloudy\
18:00hrs  | Likelihood of rain:  6% |  Wind speed:  7mph | Wind gust:  18mph |  Temp:   6C |  Cloudy\
21:00hrs  | Likelihood of rain: 63% |  Wind speed:  9mph | Wind gust:  20mph |  Temp:   6C |  Light rain\
-----------------------------------------------------------------------------------------------------------------------
Date: 16-02-2022\
00:00hrs  | Likelihood of rain: 93% |  Wind speed: 11mph | Wind gust:  25mph |  Temp:   7C |  Heavy rain\
03:00hrs  | Likelihood of rain: 59% |  Wind speed: 18mph | Wind gust:  34mph |  Temp:  10C |  Light rain\
06:00hrs  | Likelihood of rain: 16% |  Wind speed: 16mph | Wind gust:  31mph |  Temp:  11C |  Overcast\
09:00hrs  | Likelihood of rain:  5% |  Wind speed: 18mph | Wind gust:  31mph |  Temp:  11C |  Cloudy\
12:00hrs  | Likelihood of rain:  9% |  Wind speed: 22mph | Wind gust:  40mph |  Temp:  13C |  Overcast\
15:00hrs  | Likelihood of rain: 54% |  Wind speed: 22mph | Wind gust:  43mph |  Temp:  13C |  Light rain\
18:00hrs  | Likelihood of rain: 52% |  Wind speed: 27mph | Wind gust:  51mph |  Temp:  13C |  Light rain\
21:00hrs  | Likelihood of rain: 38% |  Wind speed: 27mph | Wind gust:  51mph |  Temp:  11C |  Light rain shower (night)\
-----------------------------------------------------------------------------------------------------------------------
Date: 17-02-2022\
00:00hrs  | Likelihood of rain: 10% |  Wind speed: 25mph | Wind gust:  47mph |  Temp:   9C |  Cloudy\
03:00hrs  | Likelihood of rain:  5% |  Wind speed: 25mph | Wind gust:  47mph |  Temp:   7C |  Cloudy\
06:00hrs  | Likelihood of rain:  2% |  Wind speed: 22mph | Wind gust:  43mph |  Temp:   6C |  Partly cloudy (night)\
09:00hrs  | Likelihood of rain:  4% |  Wind speed: 20mph | Wind gust:  38mph |  Temp:   6C |  Sunny day\
12:00hrs  | Likelihood of rain:  7% |  Wind speed: 22mph | Wind gust:  40mph |  Temp:   8C |  Cloudy\
15:00hrs  | Likelihood of rain:  6% |  Wind speed: 18mph | Wind gust:  34mph |  Temp:   8C |  Partly cloudy (day)\
18:00hrs  | Likelihood of rain:  8% |  Wind speed: 13mph | Wind gust:  25mph |  Temp:   7C |  Cloudy\
21:00hrs  | Likelihood of rain:  6% |  Wind speed: 11mph | Wind gust:  22mph |  Temp:   6C |  Cloudy\
-----------------------------------------------------------------------------------------------------------------------
Date: 18-02-2022\
00:00hrs  | Likelihood of rain: 15% |  Wind speed: 11mph | Wind gust:  20mph |  Temp:   6C |  Cloudy\
03:00hrs  | Likelihood of rain: 75% |  Wind speed: 16mph | Wind gust:  29mph |  Temp:   7C |  Heavy rain\
06:00hrs  | Likelihood of rain: 78% |  Wind speed: 20mph | Wind gust:  38mph |  Temp:   7C |  Heavy rain\
09:00hrs  | Likelihood of rain: 54% |  Wind speed: 25mph | Wind gust:  49mph |  Temp:   7C |  Light rain\
12:00hrs  | Likelihood of rain: 42% |  Wind speed: 27mph | Wind gust:  51mph |  Temp:   8C |  Light rain shower (night)\
15:00hrs  | Likelihood of rain: 17% |  Wind speed: 25mph | Wind gust:  49mph |  Temp:   7C |  Partly cloudy (day)\
18:00hrs  | Likelihood of rain: 13% |  Wind speed: 20mph | Wind gust:  38mph |  Temp:   5C |  Partly cloudy (night)\
21:00hrs  | Likelihood of rain:  9% |  Wind speed: 18mph | Wind gust:  34mph |  Temp:   4C |  Cloudy\
