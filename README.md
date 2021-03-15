# Development

- Clone project
- Make sure you have a running postgres database at port 26567 with a postgres/postgres username/password
- Download the ruby gems `bundle install`
- Launch the puma server `bundle exec rails s`
- Launch a rails console `bundle exec rails c`

# Test

- Make sure that your test database has been created or you can do `RAILS_ENV=test bundle exec rake db:create` to create it then `RAILS_ENV=test bundle exec rake db:migrate`
- If you want to run all the test you can do: `RAILS_ENV=test bundle exec rspec spec` or if you want to run only one test then `RAILS_ENV=test bundle exec rspec spec/acceptance/city_controller_spec.rb`
- Generate API Blueprint: `RAILS_ENV=test bundle exec rake docs:generate:ordered`