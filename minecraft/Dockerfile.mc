FROM ubuntu
EXPOSE 1025
WORKDIR /minecraft

ARG version=1.18.1
ARG xmx="-Xmx8g"
ARG xms="-Xms8g"

ENV XMX=${xmx}
ENV XMS=${xms}
ENV JARFILE="spigot-${version}.jar"


SHELL [ "/bin/bash", "-c" ]


RUN apt update
RUN DEBIAN_FRONTEND=noninteractive tz="Etc/UTC" apt install git curl tzdata -y
RUN apt install openjdk-17-jdk-headless -y
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN git config --global core.autocrlf false
RUN java -jar BuildTools.jar --rev $version
RUN java -jar ./spigot-${version}.jar
RUN sed -i 's/false/true/g' eula.txt
COPY ./server.properties /minecraft/server.properties

CMD java $XMX $XMS -jar $JARFILE