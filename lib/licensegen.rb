# frozen_string_literal: true

require_relative "licensegen/version"
# require_relative "licensegen/fetcher"

# main entry point for licensegen's command line interface
module LicenseGen
  class Error < StandardError; end
end

def match_license(license_name)
  Licensee.licenses.each do |license|
    return license if license.key == license_name
  end
  nil
end
