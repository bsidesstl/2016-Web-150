# escape=`

FROM ubuntu:14.04
RUN apt-get update && apt-get install -y build-essential
RUN apt-get -y install ruby-full
RUN gem install sinatra
RUN gem install thin

COPY API.rb /home
COPY bash.bashrc /etc

RUN chmod 755 /home/API.rb