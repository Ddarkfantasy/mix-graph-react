# mix-graph-react
## Operation of Schema
### Schema for ecto (Phoenix to database)

#### 1. Create new schema by command
```
# create a users schema with name and age attributes in Accounts module(folder)
mix phx.gen.context Accounts User users name:string age:integer
# create a users schema with name and age attributes
mix phx.gen.schema User users name:string age:integer
```

#### 2. Use migration to change table
```
mix ecto.gen.migration new_change_constraint
```
sample code of migration
```
def change do
  alter table(:users) do
    add :email, :string
    modify :username, :string, null: false
    remove :bio

    timestamps()
  end

  create table(:projects) do
    add :name, :string

    timestamps()
  end
end
```
Run the following to migrate the change to databse:
```
mix ecto.migrate
```

#### 3. Set constraint to table
1. in migration:
```
def change do
  create unique_index(:users, [:username])
  create unique_index(:users, [:email])
end
```
2. in ecto schema:
```
def changeset(user, attrs) do
  user
  |> unique_constraint(:email)
  |> unique_constraint(:username)
end
```


## How to run the server and frontend on HTTPS

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
