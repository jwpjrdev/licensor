# frozen_string_literal: true

require "licensee"

def match_license(license_name)
  Licensee.licenses.each do |license|
    return license if license.key == license_name
  end
  nil
end
