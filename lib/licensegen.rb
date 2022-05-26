# frozen_string_literal: true

require_relative "licensegen/version"
require_relative "licensegen/fetcher"

module LicenseGen
  class Error < StandardError; end

  fetcher = LicenseFetcher.new
  puts fetcher.match_license("mit")
  puts fetcher.match_license("gpl-3.0")
  puts fetcher.match_license("wtfpl")
end
