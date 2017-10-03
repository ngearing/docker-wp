site=cat .env | grep SITE_URL .env | sed 's/SITE_URL=//'


run: up addHosts openSubl startTasker browserSync

install:
	mkdir -p app app/wp-content
	echo '${site}'
	cat ./bin/.htaccess | sed 's/SITE_URL/$(site)/g' | tee ./app/.htaccess

up:
	docker-compose up -d

addHosts:
	echo "Todo: auto update hosts file"

removeHosts:
	echo "Todo: auto remove hosts"

openSubl:
	subl *.sublime-workspace

startTasker:
	echo "setup grunt or something"

browserSync:
	echo "start browserSync"