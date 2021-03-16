# Development

## Without Docker

- Clone project
- Make sure you have a running postgres database at port 26257 with a postgres/postgres username/password
- Download the ruby gems `bundle install`
- Launch the puma server `bundle exec rails s`
- Launch a rails console `bundle exec rails c`
- Launch rubocop to lint code: `bundle exec rubocop`

## With Docker

- Simple `docker-compose up` 
- If you get an error from the db connection, you can do `docker-compose exec api bundle exec rake db:create && rake db:migrate`
- If you want to launch a rails console, you can `docker-compose exec api bundle exec rails c`

# Test

- Make sure that your test database has been created or you can do `RAILS_ENV=test bundle exec rake db:create` to create it then `RAILS_ENV=test bundle exec rake db:migrate`
- If you want to run all the test you can do: `RAILS_ENV=test bundle exec rspec spec` or if you want to run only one test then `RAILS_ENV=test bundle exec rspec spec/acceptance/city_controller_spec.rb`
- Annotate models with : `bundle exec annotate --models`
- Generate API Blueprint: `RAILS_ENV=test bundle exec rake docs:generate:ordered`
- Generate API documentation: `aglio -i doc/index.apib -o public/index.html`

# Heroku

- Api link: `https://tunisia-open-data-back.herokuapp.com/`
- Api documentation: `https://tunisia-open-data-back.herokuapp.com/`

- View project logs: `heroku logs --app  tunisia-open-data-back`
- Migrate database project: `heroku run rake db:seed --app tunisia-open-data-back`
# Using the API:

- In order to use the api, one should generate a valid token. One can obtain a valid `jwt` through this website: [https://jwt.io/]. In the example select `HS256` algorithm, and in the payload data, construct a json in the following format:
```
{
	'user': {
		'email': 'anas.ksibi@gmail.com'
	}
}
```

- After getting a valid token, one must call the api with http requests including a bearer token as an authorization token.
- curl -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImVtYWlsIjoiYW5hcy5rc2liaUBnbWFpbC5jb20ifX0.iOC8sFHXe95rI3xw25HYvpQPWmfEEvldPomyMSFFbBY" https://tunisia-open-data-back.herokuapp.com/v1/cities