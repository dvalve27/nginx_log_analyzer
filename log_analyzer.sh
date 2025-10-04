#!/bin/bash
echo -e "\n Top 5 IPs with most requests:" 
awk '{print "requests for: " $1}' $1| sort | uniq -c | sort -r | head -n 5

echo -e "\n Top 5 requested paths:" 
grep -o '".*HTTP' $1|  grep -o '/.*/' | sort | uniq -c | sort -r | head -n 5

echo -e "\n Top 5 response codes:" 
grep -o 'HTTP/1.1".*' $1 | awk '{print "response codes for: " $2}' | sort | uniq -c | sort -r | head -n 5

echo -e "\n Top user agents:"
grep -o '"-" ".*(' $1 | awk '{print "user agent count for: "$2}' | sed 's/"//g' | sort | uniq -c | sort -r | head -n 5