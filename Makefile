run: up addHosts openSubl startTasker browserSync

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