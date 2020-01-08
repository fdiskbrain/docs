FROM maven:3.6.0-jdk-8 AS deploy
# install mybatis migrate
RUN wget -q https://oss.sonatype.org/content/repositories/releases/org/mybatis/mybatis-migrations/3.3.5/mybatis-migrations-3.3.5-bundle.zip &&\
    wget -q https://oss.sonatype.org/content/repositories/releases/org/mybatis/mybatis-migrations/3.3.5/mybatis-migrations-3.3.5-bundle.zip.md5 &&\
    echo $(cat mybatis-migrations-3.3.5-bundle.zip.md5) mybatis-migrations-3.3.5-bundle.zip>md5sum  &&\
    md5sum -c md5sum &&\
    unzip mybatis-migrations-3.3.5-bundle.zip
RUN mkdir /datadog &&\
    cd /datadog &&\
    wget -q https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/0.33.0/dd-java-agent-0.33.0.jar &&\
    wget -q https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/0.33.0/dd-java-agent-0.33.0.jar.md5 &&\
    echo $(cat dd-java-agent-0.33.0.jar.md5) dd-java-agent-0.33.0.jar >md5sum &&\
    md5sum -c md5sum &&\
    mv dd-java-agent-0.33.0.jar dd-java-agent.jar &&\
    ls
