npm_install:
	npm install

run: 
	npm run build
	go run . serve

migrate_save:
	pocketbase migrate collections

migrate_up:
	pocketbase migrate up

air: npm_install
	echo 'export const endpoint = "http://127.0.0.1:8090"' > ./src/lib/endpoint.ts
	which air || go install github.com/air-verse/air@latest
	air

release: npm_install
	echo 'export const endpoint = "https://timerx.isaacinit.com/"' > ./src/lib/endpoint.ts
	npm run build
	bash ./deploy/install.sh
