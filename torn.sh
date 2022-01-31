#!/bin/sh

url="https://thepiratebay.party/search/$1/1/99/0"
url2="https://thepiratebay.party/search/$1/2/99/0"
url3="https://thepiratebay.party/search/$1/3/99/0"


result1=$(curl "$url" | grep "<td><nobr>.*</td>" | sed 's/<a href="//g'|sed 's_">.*</a></b>__g' | sed 's_<link .*>__g' | sed 's_<script .*>.*</script>__g' | sed 's_<td><nobr>__g' | sed 's_" title=.*</nobr></td>__g')
result2=$(curl "$url2" | grep "<td><nobr>.*</td>" | sed 's/<a href="//g'|sed 's_">.*</a></b>__g' | sed 's_<link .*>__g' | sed 's_<script .*>.*</script>__g' | sed 's_<td><nobr>__g' | sed 's_" title=.*</nobr></td>__g')
result3=$(curl "$url3" | grep "<td><nobr>.*</td>" | sed 's/<a href="//g'|sed 's_">.*</a></b>__g' | sed 's_<link .*>__g' | sed 's_<script .*>.*</script>__g' | sed 's_<td><nobr>__g' | sed 's_" title=.*</nobr></td>__g')

result4=$(curl "$url" | grep "<a .*>.*</a>" |  sed 's_<td><nobr>.*</nobr></td>__g' | sed 's_<td><a href="/user.*</a></td>__g' | sed 's_<td class="vertTh">.*</a></td>__g' | sed 's_<td><a href="/user.*</a></td>__g' | sed 's_<td><a href=.*">__g' |  sed 's/<a href="//g' | sed 's_/.*;__g' | sed 's_/" class=.*</a>__g' | sed 's_ /.*</a>__g' | sed 's_<th>.*</th>__g' | sed 's_<b>__g' | sed 's_</a>__g' | sed 's_/.*|__g' | sed 's_1.*>__g' | sed 's_<.*>__g'| sed 's_/.*.__g'| sed 's_http.*__g'| grep "\S"| grep .)
result5=$(curl "$url2" | grep "<a .*>.*</a>" |  sed 's_<td><nobr>.*</nobr></td>__g' | sed 's_<td><a href="/user.*</a></td>__g' | sed 's_<td class="vertTh">.*</a></td>__g' | sed 's_<td><a href="/user.*</a></td>__g' | sed 's_<td><a href=.*">__g' |  sed 's/<a href="//g' | sed 's_/.*;__g' | sed 's_/" class=.*</a>__g' | sed 's_ /.*</a>__g' | sed 's_<th>.*</th>__g' | sed 's_<b>__g' | sed 's_</a>__g' | sed 's_/.*|__g' | sed 's_1.*>__g' | sed 's_<.*>__g'| sed 's_/.*.__g'| sed 's_http.*__g'| grep "\S"| grep .)
result6=$(curl "$url3" | grep "<a .*>.*</a>" |  sed 's_<td><nobr>.*</nobr></td>__g' | sed 's_<td><a href="/user.*</a></td>__g' | sed 's_<td class="vertTh">.*</a></td>__g' | sed 's_<td><a href="/user.*</a></td>__g' | sed 's_<td><a href=.*">__g' |  sed 's/<a href="//g' | sed 's_/.*;__g' | sed 's_/" class=.*</a>__g' | sed 's_ /.*</a>__g' | sed 's_<th>.*</th>__g' | sed 's_<b>__g' | sed 's_</a>__g' | sed 's_/.*|__g' | sed 's_1.*>__g' | sed 's_<.*>__g'| sed 's_/.*.__g'| sed 's_http.*__g'| grep "\S"| grep .)


echo "$result1 $result2 $result3" > /tmp/magnetlink.csv
echo "$result4 $result5 $result6" > /tmp/searchresult.csv
printf "end of the file \n" >> /tmp/searchresult.csv
printf "\n\nSearch results are : \n"

index=1
while IFS= read -r line;do
	echo "$index ) $line"
    ((index=$index+1));
done < /tmp/searchresult.csv

printf "\nPlease enter the index"
read choice

count=1
while IFS= read -r line;
do 
    if [ "$count" = "$choice" ];
    then
    qbittorrent "$line";
    fi
((count=$count+1))
done < /tmp/magnetlink.csv







