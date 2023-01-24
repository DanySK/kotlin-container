# `danysk/kotlin` container

A lightweight container with the JDK and Kotlin.
Ideal if you need Kotlin-script.

DockerHub: https://hub.docker.com/repository/docker/danysk/kotlin/general

New containers get generated upon stable releases from JetBrains or new JDKs.
The version tag is always `<kotlinVersion>-jdk<JDKVersion>`.

Try with, e.g.: 
- `docker run --rm -it danysk/kotlin` (opens a Kotlin REPL)
- `docker run --rm danysk/kotlin kotlin -e '1+1'` (should print 2)
