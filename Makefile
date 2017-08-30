site_url=$(grep SITE_URL .env | sed 's/SITE_URL=//')
read -d '' htaccess << EOF
# Attempt to load files from production if they're not in our local version
<IfModule mod_rewrite.c>
RewriteEngine on
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule wp-content/uploads/(.*) \
	https://$(site_url)/wp-content/uploads/$1 [NC,L]
</IfModule>
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
EOF

run: up addHosts openSubl startTasker browserSync

install:
	mkdir -p app app/wp-content
	echo '$htaccess' > app/.htaccess

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