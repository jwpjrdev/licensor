class LicenseFetcher
    def match_license(license_name)
        case license_name
        when "mit"
            return "mit"
        when "gpl-3.0"
            return "gpl"
        else
            return "other"
        end
    end
end