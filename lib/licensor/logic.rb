# frozen_string_literal: true

require "licensee"

module Licensor::Logic
  def self.match_license(license_name)
    license_name = license_name.strip.downcase
    Licensee.licenses.each do |license|
      return license if license.key == license_name
    end
    nil
  end

  # TODO: check for any others & migrate to hashes or files rather than relying on licensee
  def self.format_license(license, author)
    content = license.content

    if license.key == "mit"
      content = content.gsub("[year]", Time.now.year.to_s).gsub("[fullname]", author)
    elsif license.key == "apache-2.0"
      content = content.gsub("[yyyy]", Time.now.year.to_s).gsub("[name of copyright owner]", author)
    end

    content
  end

  # TODO: add other sources
  def self.fetch_author
    # if git is installed
    `git config user.name`.strip
  end
end
