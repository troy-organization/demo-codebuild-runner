FROM alpine:latest

RUN echo "Hello, World!" > /hello.txt

CMD ["cat", "/hello.txt"]