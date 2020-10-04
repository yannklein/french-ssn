# Livecode objectives
# 1. Build the tests DONE
# 2. Create the RegExp DONE
# 3. Build #french_ssn_info DONE
# 4. Refactor DONE
# 5. Build #valid_key?

# Pseudo-code:
# return "a man, born in December, 1984 in Seine-Maritime."
# define 4 variables from the extracted ssn info
# return a string composed of these 4 variables (interpolation)

require 'date'
require "yaml"

SNN_PATTERN = /(?<gender>^[12])\s(?<year>\d{2})\s(?<month>\d{2})\s(?<department>\d{2})\s\d{3}\s\d{3}\s(?<key>\d{2})/

def french_ssn_info(ssn)
  match_data = ssn.match(SNN_PATTERN)
  if match_data && valid_key?(ssn, match_data["key"])
    gender = build_gender(match_data["gender"])
    month = build_month(match_data["month"])
    year = build_year(match_data["year"])
    department = build_department(match_data["department"])
    return "a #{gender}, born in #{month}, #{year} in #{department}."
  else
    return "The number is invalid"
  end
end

def valid_key?(ssn, key)
  # Create the integer ssn_without_key
  ssn_without_key = ssn[0..-3].delete(" ").to_i
  # calculate the remainer of division (97 - ssn_without_key) by 97
  remainder = (97 - ssn_without_key) % 97
  # compare the remainder with our key (and return the result)
  return remainder == key.to_i
end

def build_gender(code)
  return code.to_i == 1 ? "man" : "women"
end

def build_month(code)
  return Date::MONTHNAMES[code.to_i]
end

def build_year(code)
  return "19#{code}"
end

def build_department(code)
  return YAML.load_file("data/french_departments.yml")[code]
end
