Instagram 
===================

Instragram clone created using [Ruby on Rails](https://rubyonrails.org/), [JavaScript](https://www.javascript.com/), [PostgreSQL](https://www.postgresql.org/), [Bootstrap](https://getbootstrap.com/), [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/main) and [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS).. Javascript was used for DOM manipulation and avoiding refreshing when possible (creating a semi-single page application).

Tested using [RSpec](https://rspec.info/) and [Capybara](https://github.com/teamcapybara/capybara).

## Setup

```
> git clone https://github.com/AlfonsoGhislieri/instagram-challenge.git
> cd instagram-challenge
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bin/rails server # Start the server at localhost:3000
```

## Testing
```
> bundle exec rspec # Run the tests to ensure it works
```

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:

```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```

Rails requires a Javascript runtime to work. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again

