# Zabaldu

![zabaldu logo](zabaldu.png)

[![Build Status](https://travis-ci.com/pxai/zabaldu-backend.svg?branch=master)](https://travis-ci.com/pxai/zabaldu-backend)

[![Codeship Status for pxai/zabaldu](https://app.codeship.com/projects/be5a0a9e-2953-4ad6-bf32-238a982087c6/status?branch=master)](https://app.codeship.com/projects/449018)

https://zabaldu.herokuapp.com/


```shell
bundle install
rails s
```

# Curl commands:

default
```shell
curl -i -H "Content-Type: application/json" http://127.0.0.1:3000/
```

version
```shell
curl -i -H "Content-Type: application/json" http://127.0.0.1:3000/api/v1/version
```

Sign Up
```shell
curl -i -X POST -H "Content-Type: application/json" http://127.0.0.1:3000/api/v1/users/sign_up --data '{"user": {"email": "email3", "name": "name3", "password": "pass3", "password_confirmation": "pass3"}}'
```

Sign In (this will return a token)
```shell
curl -i -X POST -H "Content-Type: application/json" http://127.0.0.1:3000/api/v1/users/index --data '{"user": {"email": "email3", "password": "pass3"}}'
```

# Notes, reminders
# Reminders for RoR

# Steps

rails generate model User name:string password:string email:string active:boolean password_digest:string

rake db:migrate

rails generate model Session token:string active:boolean user:references

rake db:migrate

## General comands
Generate api-only
```shell
rails new --api app_name
```

run
```shell
rails server
```

Test
```shell
rails test
```
or
```shell
rake test
```

Console
```
rails c
```

Console with test
```
RAILS_ENV=test bin/rails db:fixtures:load
rails c -e test
```

Delete DB test
```
bundle exec rake db:reset RAILS_ENV=test
```

## Generators
Generate controlers. This is about, with about method
```shell
rails generate controller about about
```

Generate models:
```shell
rails generate model Lesson name:string description:text
```
Model with references
```
 rails g model dish name:string rating:integer restaurant:references
```

Generate resource:
```shell
rails generate resource entry title:string body:text published:boolean
rails generate resource api/v1/user email:string name:string password:string
rails generate resource api/v1/story title:string body:text published:boolean user:references
```

Generate serializers
```shell
rails g serializer category
```
jsonapi-rb:
```
rails generate jsonapi:serializable tag
```


Check routes:
```shell
rails routes
```

Then:
```shell
rake db:migrate
```
for other envs:
```shell
export RAILS_ENV=production
rake db:migrate
```

Populate the Database
```
rake db:seed
```

## Curl commands

```shell
curl http://localhost:3000/courses
```

```shell
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"title":"xyz","description":"xyz", "published": "false"}' \
  http://localhost:3000/courses
```

```shell
curl -i -X POST -H "Content-Type: application/json" -d  '{"title":"xyz","description":"xyz", "published": "false"}' http://localhost:3000/courses


## Enable access to last commit for heroku

```shell
heroku labs:enable runtime-dyno-metadata -a zabaldu
```
Where zabaldu is the name of the app.

Then we should have: `HEROKU_SLUG_COMMIT`

## rubocop

Running it:
```shell
bundle exec rubocop app
```
Autocorrect:

```shell
bundle exec rubocop -A app test
bundle exec rubocop app test
```

Gen config:
```shell
bundle exec rubocop --auto-gen-config
```
