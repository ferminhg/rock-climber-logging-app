# API-REST

## 🛠️ Environment configuration

### 🔥 Application execution

You could install rails or run through `bin/rails`


Run the development server:

```bash
bin/rails server
```

Open [http://localhost:3001](http://localhost:3001) with your browser to see the result.

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
