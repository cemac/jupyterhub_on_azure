cd Certificates
mkdir ca ca/certs ca/crl ca/newcerts ca/private
chmod 700 ca/private
touch ca/index.txt
echo 1000 > ca/serial
openssl genrsa -aes256 -out ca/private/ca.key.pem 4096
chmod 400 ca/private/ca.key.pem
openssl req -config openssl.cnf -key ca/private/ca.key.pem -new -x509 -days 7300 -sha256 -extensions v3_ca -out ca/certs/ca.cert.pem
chmod 444 ca/certs/ca.cert.pem
mkdir jupyter jupyter/csr jupyter/certs jupyter/private
chmod 700 jupyter/private
openssl genrsa -out jupyter/private/ssl.key.pem 2048
chmod 400 jupyter/private/ssl.key.pem
openssl req -config openssl.cnf -key jupyter/private/ssl.key.pem  -new -sha256 -out jupyter/csr/ssl.csr.pem
openssl req -text -noout -in jupyter/csr/ssl.csr.pem
openssl ca -config openssl.cnf -extensions server_cert -days 1024 -notext -md sha256 -in jupyter/csr/ssl.csr.pem -out jupyter/certs/ssl.cert.pem
openssl x509 -in jupyter/certs/ssl.cert.pem -noout -text
