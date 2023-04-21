OPTIONS=--sentinel-fuse NODE_SEA_FUSE_fce680ab2cc467b6e072b8b5df1996b2
NODE=$$(command -v node)

local-image:
	docker build -f Dockerfile.local -t node20bin:demo .

start:
	docker compose up

stop:
	docker stop $$(docker ps -q)

shell:
	docker exec -it node20 sh

clean:
	rm -rf ./dist
	rm -rf ./out

binary: clean
	tsc
	ncc build dist/index.js -o out
	$(NODE) --experimental-sea-config sea-config.json
	cp $(NODE) demo
	npx postject demo NODE_SEA_BLOB program.blob $(OPTIONS)

build:
	docker build -t node20bin:latest .

run:
	NODE_NO_WARNINGS=1 ./demo
