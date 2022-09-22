FROM python:latest as builder
RUN echo "Installing Python"
WORKDIR /mycode
COPY ./test ./test
COPY ./mycode/* ./
RUN echo "Building  an application"

FROM alpine:latest as unitest
WORKDIR /unitest
COPY --from=builder /mycode/test ./test
RUN echo "RUNNING UNITEST" > ./test

FROM alpine:latest as security
WORKDIR /security
COPY --from=builder /mycode/* ./
COPY --from=unitest /unitest/test ./test
RUN echo "RUNNING SECURITY" >> ./test

FROM alpine:latest as emailreports
WORKDIR /reports
COPY --from=security /security/test ./test
RUN echo "MAIL STATE"
