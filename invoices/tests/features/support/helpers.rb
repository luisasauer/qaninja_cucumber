require 'fileutils'

module Helpers
    def take_screenshot(scenario)
        page.save_screenshot(scenario)
    end
end