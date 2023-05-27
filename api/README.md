# API-REST

## 🛠️ Environment configuration

### 🔥 Application execution

You could install rails or run through `bin/rails`


Run the development server:

```bash
bin/rails server
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You could test the API with [Postman](https://www.postman.com/)
or using curl:
```bash
curl --location 'http://127.0.0.1:3000/routes'
curl --location --request POST 'http://127.0.0.1:3000/route/create?climbing_time=1234&difficult_level=V&comments=wopwop'
```

### 🐳 Docker execution

```bash
docker-compose up --build
docker-compose run web rails db:create db:migrate
```

### ✅ Tests execution

```bash
bundle exec rspec
```


## How to create a new model

```bash
rails generate model User email:string
rails db:migrate
rails generate rspec:model user
```
