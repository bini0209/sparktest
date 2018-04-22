#Setting up Nginx
#Install dependencies for nginx
#We have few pre-requisites to be installed to compile which include development libraries along with source code compilers.

yum -y install gcc gcc-c++ make zlib-devel pcre-devel openssl-devel

nginxVersion="1.12.2"
wget http://nginx.org/download/nginx-$nginxVersion.tar.gz
tar -xzf nginx-$nginxVersion.tar.gz 
cd nginx-$nginxVersion

sudo ./configure --user=etlspark --group=etlspark 		\
	--prefix=/home/instance/nginx                   	\
	--sbin-path=/home/instance/nginx/sbin/nginx     	\
	--conf-path=/home/instance/nginx/nginx.conf     	\
	--pid-path=/home/instance/nginx/run/nginx.pid   	\
	--lock-path=/home/instance/nginx/run/nginx.lock 	\
	--error-log-path=/home/instance/nginx/log/error.log \
	--http-log-path=/home/instance/nginx/log/access.log \
	--with-http_gzip_static_module        \
	--with-http_stub_status_module        \
	--with-http_ssl_module                \
	--with-pcre                           \
	--with-file-aio                       \
	--with-http_realip_module             \
	--without-http_scgi_module            \
	--without-http_uwsgi_module           \
	--without-http_fastcgi_module

sudo make
sudo make install 

