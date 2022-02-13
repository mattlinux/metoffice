# metoffice
Script to process the UK Meteorological Office XML feed \
I created this script as a cyclist because I wanted a forward view of key weather data at 3-hourly intervals: \
-- temperature \
-- wind speed (mph) \
-- wind gust (mph) \
-- likelihood of precipitation (rain) as a % \
-- weather type (such as "Cloudy") \
Th script uses python for some preprocessing but but most of the data selection and formatting is carried out in gawk.  \
The main purpose of the script is to output the weather data from Conky so it shows on the dekstop. Your entry in Conky will look something like this: \
${exec /home/myaccount/bin/met_office/met 352253 1ab1cd1-a123-12ab-a1b2-12ab1234ab12} \
This shows a dummy API key (available for free at https://www.metoffice.gov.uk/services/data/datapoint and the UK Met Office location code for Leighton Buzzard. \
Here is some sample data: \
Date: 13-02-2022 \
12:00hrs  Likelihood of rain: 59%; Wind speed: 13mph; Wind gust: 29mph; Temp: 7C; Light rain\
15:00hrs  Likelihood of rain: 97%; Wind speed: 13mph; Wind gust: 29mph; Temp: 7C; Heavy rain\
18:00hrs  Likelihood of rain: 91%; Wind speed: 13mph; Wind gust: 34mph; Temp: 8C; Heavy rain\
21:00hrs  Likelihood of rain: 94%; Wind speed: 11mph; Wind gust: 25mph; Temp: 9C; Heavy rain\
Date: 14-02-2022\
00:00hrs  Likelihood of rain: 94%; Wind speed: 9mph; Wind gust: 20mph; Temp: 8C; Light rain\
03:00hrs  Likelihood of rain: 14%; Wind speed: 11mph; Wind gust: 22mph; Temp: 7C; Cloudy\
06:00hrs  Likelihood of rain: 9%; Wind speed: 13mph; Wind gust: 27mph; Temp: 6C; Cloudy\
09:00hrs  Likelihood of rain: 8%; Wind speed: 13mph; Wind gust: 27mph; Temp: 6C; Cloudy\
12:00hrs  Likelihood of rain: 48%; Wind speed: 16mph; Wind gust: 29mph; Temp: 7C; Cloudy\
15:00hrs  Likelihood of rain: 64%; Wind speed: 13mph; Wind gust: 25mph; Temp: 7C; Heavy rain shower (day)\
18:00hrs  Likelihood of rain: 40%; Wind speed: 13mph; Wind gust: 25mph; Temp: 6C; Cloudy\
21:00hrs  Likelihood of rain: 5%; Wind speed: 13mph; Wind gust: 27mph; Temp: 5C; Cloudy\
Date: 15-02-2022\
00:00hrs  Likelihood of rain: 1%; Wind speed: 11mph; Wind gust: 22mph; Temp: 4C; Partly cloudy (night)\
03:00hrs  Likelihood of rain: 1%; Wind speed: 9mph; Wind gust: 20mph; Temp: 2C; Partly cloudy (night)\
06:00hrs  Likelihood of rain: 13%; Wind speed: 11mph; Wind gust: 27mph; Temp: 3C; Cloudy\
09:00hrs  Likelihood of rain: 69%; Wind speed: 18mph; Wind gust: 34mph; Temp: 6C; Light rain\
12:00hrs  Likelihood of rain: 60%; Wind speed: 18mph; Wind gust: 31mph; Temp: 8C; Light rain\
15:00hrs  Likelihood of rain: 45%; Wind speed: 13mph; Wind gust: 27mph; Temp: 9C; Light rain\
18:00hrs  Likelihood of rain: 46%; Wind speed: 9mph; Wind gust: 18mph; Temp: 8C; Light rain\
21:00hrs  Likelihood of rain: 17%; Wind speed: 9mph; Wind gust: 18mph; Temp: 7C; Cloudy\
Date: 16-02-2022\
00:00hrs  Likelihood of rain: 86%; Wind speed: 11mph; Wind gust: 22mph; Temp: 7C; Heavy rain\
03:00hrs  Likelihood of rain: 86%; Wind speed: 13mph; Wind gust: 27mph; Temp: 9C; Heavy rain\
06:00hrs  Likelihood of rain: 23%; Wind speed: 16mph; Wind gust: 29mph; Temp: 10C; Overcast\
09:00hrs  Likelihood of rain: 7%; Wind speed: 16mph; Wind gust: 29mph; Temp: 10C; Cloudy\
12:00hrs  Likelihood of rain: 12%; Wind speed: 18mph; Wind gust: 31mph; Temp: 12C; Cloudy\
15:00hrs  Likelihood of rain: 54%; Wind speed: 20mph; Wind gust: 38mph; Temp: 13C; Light rain\
18:00hrs  Likelihood of rain: 53%; Wind speed: 25mph; Wind gust: 47mph; Temp: 12C; Light rain\
21:00hrs  Likelihood of rain: 44%; Wind speed: 25mph; Wind gust: 47mph; Temp: 11C; Light rain\
Date: 17-02-2022\
00:00hrs  Likelihood of rain: 6%; Wind speed: 25mph; Wind gust: 45mph; Temp: 9C; Cloudy\
03:00hrs  Likelihood of rain: 2%; Wind speed: 22mph; Wind gust: 43mph; Temp: 8C; Partly cloudy (night)\
06:00hrs  Likelihood of rain: 3%; Wind speed: 20mph; Wind gust: 38mph; Temp: 6C; Clear night\
09:00hrs  Likelihood of rain: 8%; Wind speed: 18mph; Wind gust: 36mph; Temp: 6C; Partly cloudy (day)\
12:00hrs  Likelihood of rain: 5%; Wind speed: 20mph; Wind gust: 40mph; Temp: 8C; Partly cloudy (day)\
15:00hrs  Likelihood of rain: 8%; Wind speed: 18mph; Wind gust: 36mph; Temp: 9C; Sunny day\
18:00hrs  Likelihood of rain: 10%; Wind speed: 13mph; Wind gust: 22mph; Temp: 7C; Cloudy\
21:00hrs  Likelihood of rain: 10%; Wind speed: 11mph; Wind gust: 22mph; Temp: 6C; Cloudy\
