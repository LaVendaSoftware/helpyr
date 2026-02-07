require_relative "helpyr/version"
require_relative "helpyr/engine"
require_relative "helpyr/translation"

module Helpyr
  I18n.load_path += Dir[File.join(__dir__, "helpyr/locales/*.yml")]

  class Error < StandardError; end
end
