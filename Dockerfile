FROM maven:3.6.0-jdk-8 AS deploy
# install mybatis migrate
RUN wget https://oss.sonatype.org/content/repositories/releases/org/mybatis/mybatis-migrations/3.3.5/mybatis-migrations-3.3.5-bundle.zip &&\
    wget https://oss.sonatype.org/content/repositories/releases/org/mybatis/mybatis-migrations/3.3.5/mybatis-migrations-3.3.5-bundle.zip.md5 &&\
    [ $(md5sum mybatis-migrations-3.3.5-bundle.zip | awk '{print $1}') != $(cat mybatis-migrations-3.3.5-bundle.zip.md5) ] && echo "ERROR md5 check";exit 1 &&\
    unzip mybatis-migrations-3.3.5-bundle.zip
RUN mkdir /datadog &&\
    cd /datadog && \
    wget https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/0.33.0/dd-java-agent-0.33.0.jar &&\
    wget https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/0.33.0/dd-java-agent-0.33.0.jar.md5 &&\
    [ $(md5sum dd-java-agent-0.33.0.jar | awk '{print $1}') != $(cat dd-java-agent-0.33.0.jar.md5) ] && echo "ERROR md5 check";exit 1 &&\
    mv dd-java-agent-0.33.0.jar dd-java-agent.jar &&\
    ls
