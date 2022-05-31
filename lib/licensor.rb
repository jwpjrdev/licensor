# frozen_string_literal: true

require_relative "licensor/version"
# require_relative "licensor/fetcher"

# main entry point for licensor's command line interface
module Licensor
  class Error < StandardError; end
end

def match_license(license_name)
  Licensee.licenses.each do |license|
    return license if license.key == license_name
  end
  nil
end
