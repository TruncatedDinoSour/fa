# syntax=docker/dockerfile:1
FROM debian
RUN apt-get update
RUN apt-get install -y fasm python3 curl python3-pip
WORKDIR /fa
COPY . .
RUN pip install -r requirements.txt
RUN ./scripts/devsetup.sh
CMD ["./src/fac", "/fa/a.fa", "-run", "-no-ansi"]
