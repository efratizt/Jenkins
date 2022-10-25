FROM alpine:latest as Pre-build
WORKDIR /app
RUN echo "pre-build actions"

FROM alpine:latest as Build
WORKDIR /build
COPY --from=Pre-build /app/* .
RUN echo "building..."

FROM alpine:latest as Test
WORKDIR /test
COPY --from=Build /build/* .
RUN echo "building..."

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
