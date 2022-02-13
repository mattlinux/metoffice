curl "http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/xml/"{$1}"?res=3hourly&key="{$2}"" |
python3 -c ' #perform some preprocessing in Python, including stripping out the definitions 
import xml.etree.ElementTree as ET
import sys
tree=ET.parse(sys.stdin) #parse the Met Office data from standard input
root = tree.getroot()
print("\n\n")
for period in root.iter("Period"):
     print(period.tag,period.attrib)
     for report in period.iter("Rep"):
        print(report.text,report.attrib)' | gawk ' #Carry out the main selection of data and format the data in gawk 
/Period/ { 
gsub("Z|'\''|,|}","") #strip out unwanted characters from the weather forecast date   
split($5,date,"-") # Put the year, month and date into an array 
printf("Date: %s",date[3]); printf("-%s",date[2]); printf("-%s\n",date[1]) #Display the date of forecast in the correct order
}
function weather_at_time(time) {	
	printf("%s ",time)
}
function weather_report(record){
	split(record,report," ")
	for(i=0;i<=19;i++)
	{
		gsub("'\''|,","",report[i]) #strip out unwanted characters from the forecast data 
	}
	if(length(report[11])==1)
		printf("Likelihood of rain:  %s\045  ",report[11]);  #process the precipitation probability, display the the value as a % (Octal 045) 
	if(length(report[11])==2)
		printf("Likelihood of rain: %s\045  ",report[11]); #process the precipitation probability, display the the value as a % (Octal 045) 
	if(length(report[13])==1)
		printf("Wind speed:  %smph  ",report[13]); #process the wind speed
	if(length(report[13])==2)
		printf("Wind speed: %smph  ",report[13]) #process the wind speed
	if(length(report[7])==1)
		printf("Wind gust:  %smph   ",report[7]); #process the wind gust
	if(length(report[7])==2)
		printf("Wind gust: %smph  ",report[7]); #process the wind gust
	if(length(report[15])==1)
		printf("Temp:  %sC  ",report[15]) #process the temperature
	if(length(report[15])==2)
		printf("Temp: %sC  ",report[15]) #process the temperature
	switch(report[19]) # Print substitute text for the UK Met Office weather type value
		{
		case "NA":
			printf("Not available\n");
			break
		case "0":
			printf("Clear night\n");
			break
		case "1":
			printf("Sunny day\n");
			break
		case "2":
			printf("Partly cloudy (night)\n");
			break
		case "3":
			printf("Partly cloudy (day)\n");
			break
		case "4":
			printf("Value not used!\n");
			break
		case "5":
			printf("Mist\n");
			break
		case "6":
			printf("Fog\n");
			break
		case "7":
			printf("Cloudy\n");
			break
		case "8":
			printf("Overcast\n");
			break
		case "9":
			printf("Light rain shower (night)\n");
			break
		case "10":
			printf("Light rain shower (night)\n");
			break
		case "11":
			printf("Drizzle\n");
			break
		case "12":
			printf("Light rain\n");
			break
		case "13":
			printf("Heavy rain shower (night)\n");
			break
		case "14":
			printf("Heavy rain shower (day)\n");
			break
		case "15":
			printf("Heavy rain\n");
			break
		case "16":
			printf("Sleet shower (night)\n");
			break
		case "17":
			printf("Sleet shower (day)\n");
			break
		case "18":
			printf("Sleet\n");
			break
		case "19":
			printf("Hail shower (night)\n");
			break
		case "20":
			printf("Hail shower (day)\n");
			break
		case "21":
			printf("Hail\n");
			break
		case "22":
			printf("Light snow shower (night)\n");
			break
		case "23":
			printf("show shower (day)\n");
			break
		case "24":
			printf("Light snow\n");
			break
		case "25":
			printf("Heavy snow shower (night)\n");
			break
		case "26":
			printf("Heavy snow shower (day)\n");
			break
		case "27":
			printf("Heavy snow\n");
			break
		case "28":
			printf("Thunder shower (night)\n");
			break
		case "29":
			printf("Thunder shower (day)\n");
			break
		case "30":
			printf("Thunder\n");
			break
		}
}
/^0/ 	{weather_at_time("00:00hrs "); weather_report($0)}
/^180/ 	{weather_at_time("03:00hrs "); weather_report($0)}
/^360/ 	{weather_at_time("06:00hrs "); weather_report($0)}
/^540/ 	{weather_at_time("09:00hrs "); weather_report($0)}
/^720/ 	{weather_at_time("12:00hrs "); weather_report($0)}
/^900/ 	{weather_at_time("15:00hrs "); weather_report($0)}
/^1080/	{weather_at_time("18:00hrs "); weather_report($0)}
/^1260/ {weather_at_time("21:00hrs "); weather_report($0)}
'
