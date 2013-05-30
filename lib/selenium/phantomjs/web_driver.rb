module Selenium
  module Phantomjs
    class WebDriver < Instance
      LOG               = 'log/phantomjs.log'.freeze
      LOGLEVEL          = 'WARN'.freeze
      SELENIUM_GRID_URL = "http://#{Selenium::WebDriver::Platform.localhost}:4444".freeze

      def run(args = {}, options = {[:out, :err] => [LOG, 'a']})
        phantomjs_args = {
          :'webdriver-selenium-grid-hub' => SELENIUM_GRID_URL,
          :'webdriver-loglevel'          => LOGLEVEL
        }.merge(args).merge(wd: nil)

        super(phantomjs_args, options)
      end
    end
  end
end
