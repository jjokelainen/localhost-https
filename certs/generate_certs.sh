openssl genrsa -des3 -out ca.key 2048 
openssl req -x509 -new -nodes -key ca.key -sha256 -days 365 -out ca.crt -subj "/C=FI/CN=localhost-https"
openssl req -new -nodes -newkey rsa:2048 -keyout localhost.key -out localhost.csr -subj "/C=FI/L=Oulu/CN=localhost"
openssl x509 -req -sha256 -days 1024 -in localhost.csr -CA ca.crt -CAkey ca.key -CAcreateserial -extfile domains.ext -out localhost.crt