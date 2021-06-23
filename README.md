# Zabaldu
**WARNING, Work in progress until Monday**

[![Build Status](https://travis-ci.com/pxai/zabaldu.svg?token=arqgKqUXMMcY8kTPhsyy&branch=master)](https://travis-ci.com/pxai/zabaldu)

[![Codeship Status for pxai/zabaldu](https://app.codeship.com/projects/be5a0a9e-2953-4ad6-bf32-238a982087c6/status?branch=master)](https://app.codeship.com/projects/445389)

[ABOUT](about/ABOUT.md)

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
