# mix-graph-react

### How to run the server and frontend on HTTPS

#### 1. Change host setting in /etc/hosts

```
127.0.0.1	localhost   headoffice.sydneytools.com.au 
```

#### 2. Configure nginx reverse proxy

```
server {
  listen 80;
  server_name headoffice.sydneytools.com.au;

  location / {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
}

server {
  listen 443 ssl;
  server_name headoffice.sydneytools.com.au;
  
  ssl_certificate /etc/nginx/ssl/headoffice.sydneytools.com.au.pem;
  ssl_certificate_key /etc/nginx/ssl/headoffice.sydneytools.com.au-key.pem;

  location / {
    proxy_pass https://localhost:3000;
    
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
  location /api {
    proxy_pass http://localhost:4000; 

    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```

#### 3. Generate ssl and key for the website

 ```
 mkcert headoffice.sydneytools.com.au.pem

 ```
then, copy the ssl and key to etc/nginx/ssl

#### 4. Restart Nginx Server
```
systemctl restart nginx
```
