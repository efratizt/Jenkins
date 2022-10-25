FROM alpine:latest as pre-build
COPY ./helloworld.txt ./code/helloworld.txt
RUN echo "this is a PRE-BUILD step"

FROM alpine:latest as build
COPY --from=pre-build ./code/helloworld.txt ./build/helloworld.txt
RUN echo "this is a build step"

FROM alpine:latest as test
COPY --from=build ./build/helloworld.txt ./test/helloworld.txt
RUN echo "this is a test step"

FROM alpine:latest as Security
WORKDIR /security
RUN echo "this is security"


FROM alpine:latest as Back-end
WORKDIR /back-end
RUN echo "this is back-end"

FROM alpine:latest as Front-end
WORKDIR /front-end
RUN echo "this is front-end"


FROM alpine:latest as Deploy
WORKDIR /deploy
RUN echo "this is deploy"

FROM alpine:latest as Post
WORKDIR /post
RUN echo "this is post"
