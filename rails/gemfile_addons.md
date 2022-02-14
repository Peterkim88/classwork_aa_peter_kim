group :development do
  # Run 'bundle exec annotate' in Terminal to add helpful comments to models.
  gem 'annotate'

  # These two give you a great error handling page.
  # But make sure to never use them in production!
  gem 'better_errors'
  gem 'binding_of_caller'

  # Gotta have byebug...
  gem 'byebug'

  # pry > irb
  gem 'pry-rails'
end