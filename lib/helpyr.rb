require_relative "helpyr/version"

module Helpyr
  I18n.load_path += Dir[File.join(__dir__, "helpyr/locales/*.yml")]

  class Error < StandardError; end
end
