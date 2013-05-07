module Selenium
  module Phantomjs
    class WebDriver < Instance
      LOG               = 'log/phantomjs.log'.freeze
      LOGLEVEL          = 'WARN'.freeze
      SELENIUM_GRID_URL = "http://#{Selenium::WebDriver::Platform.localhost}:4444".freeze

      def run(options = {[:out, :err] => [LOG, 'a']})
        super({
          :wd                            => nil, 
          :'webdriver-selenium-grid-hub' => SELENIUM_GRID_URL, 
          :'webdriver-loglevel'          => LOGLEVEL
        }, options)
      end
    end
  end
end
