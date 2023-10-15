ARG JDK_VERSION=21
FROM eclipse-temurin:${JDK_VERSION} AS base
RUN apt-get update && apt-get install -y -qq --no-install-recommends --purge unzip

ARG JDK_VERSION=21
FROM eclipse-temurin:${JDK_VERSION}
COPY --from=base /usr/bin/unzip /usr/bin/unzip
ARG KOTLIN_VERSION=1.8.0
RUN curl -sL https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip > kotlin.zip
RUN unzip kotlin.zip
RUN rm kotlin.zip
ENV PATH=/kotlinc/bin:$PATH
RUN kotlin -e '1+1'
CMD kotlinc
