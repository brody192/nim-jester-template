FROM nimlang/nim:1.6.12-alpine

WORKDIR /app

COPY . .

RUN nimble refresh

RUN nimble build

CMD ./main