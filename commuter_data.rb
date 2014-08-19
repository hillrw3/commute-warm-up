require 'csv'

data = CSV.read('data/gschool_commute_data.csv', headers: true)
#
hashed_data = {}

array = []

data.each do |commuter|
  array << commuter.to_h
end

grouped_data = array.group_by { |commuter| commuter["Person"] }

grouped_data.each do |commuter|
  commuter.each do |array|
    if array.class == Array
      array.each do |hash|
        hash.tap {|h| h.delete("Person")}
      end
    end
  end
end

p grouped_data

