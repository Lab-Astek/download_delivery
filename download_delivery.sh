#!/bin/bash

# Created by Henri Roumegoux

# Values to edit
JENKINS_USER=""
JENKINS_PASW=""

if [ "$JENKINS_USER" == "" ] || [ "$JENKINS_PASW" == "" ]
then
  echo "You have to provide values for JENKINS_USER and JENKINS_PASW"
  echo "Please edit $0 to give those values"
  exit
fi

if [ "$1" == "-h" ]
then
  echo "Usage :"
  echo "$0 module project group student"
  echo -e "\nExample :"
  echo "$0 B-MUL-100 myhunter PAR-1-1 nao.marvin"
  exit
fi

module=$1
project=$2
group=$3
student=$4

wget -r -np -l 1 -A zip --auth-no-challenge --http-user=$JENKINS_USER --http-password=$JENKINS_PASW "https://jenkins.epitest.eu/job/$module/job/$project/job/2019/job/$group/job/$student/ws/delivery/*zip*/delivery.zip"
wget -r -np -l 1 --auth-no-challenge --http-user=$JENKINS_USER --http-password=$JENKINS_PASW "https://jenkins.epitest.eu/job/$module/job/$project/job/2019/job/$group/job/$student/lastSuccessfulBuild/artifact/reports/style-major.txt"
wget -r -np -l 1 --auth-no-challenge --http-user=$JENKINS_USER --http-password=$JENKINS_PASW "https://jenkins.epitest.eu/job/$module/job/$project/job/2019/job/$group/job/$student/lastSuccessfulBuild/artifact/reports/style-minor.txt"
unzip "jenkins.epitest.eu/job/$module/job/$project/job/2019/job/$group/job/$student/ws/delivery/*zip*/delivery.zip" -d $student

major=`cat jenkins.epitest.eu/job/$module/job/$project/job/2019/job/$group/job/$student/lastSuccessfulBuild/artifact/reports/style-major.txt | wc -l`
major=$((major * 3))
minor=`cat jenkins.epitest.eu/job/$module/job/$project/job/2019/job/$group/job/$student/lastSuccessfulBuild/artifact/reports/style-minor.txt | wc -l`
style=$((major + minor))

echo -e "\n\nSTYLE SCORE : $style"
echo "minor: $minor"
echo "major: $major"