require_relative "helpyr/version"
require_relative "helpyr/engine"
require_relative "helpyr/translation"
require_relative "helpyr/page_title"

module Helpyr
  I18n.load_path += Dir[File.join(__dir__, "helpyr/locales/*.yml")]

  class Error < StandardError; end
end
