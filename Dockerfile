FROM node:20-alpine3.16 as build

RUN npm install -g typescript @vercel/ncc postject

WORKDIR /app

COPY . .

RUN NODE_ENV=development npm install && \
    tsc && \
    ncc build dist/index.js -o out && \
    node --experimental-sea-config sea-config.json && \
    cp $(which node) out/demo && \
    postject out/demo NODE_SEA_BLOB out/program.blob --sentinel-fuse NODE_SEA_FUSE_fce680ab2cc467b6e072b8b5df1996b2

FROM alpine:3.16

# required by node applications
RUN apk add libstdc++

COPY --from=build /app/out/demo /usr/local/bin/demo

ENV NODE_NO_WARNINGS=1
CMD ["/usr/local/bin/demo"]
