# Selenium::Phantomjs

Provides integration between selenium-webdriver and PhantomJS via Ghostdriver

## Installation

Add this line to your application's Gemfile:

    gem 'selenium-phantomjs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install selenium-phantomjs

## Usage

To use PhantomJS as a browser for Selenium test just add to your ```spec_helper.rb``` or ```Spork.prefork``` block

```ruby
Capybara.default_driver = :selenium_phantomjs
```

Please note that Ghostdriver needs Selenium Grid server to run at ```localhost:4444```. To run a server do

```
./selenium-server-standalone
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
