require 'csv'

data = CSV.read('data/gschool_commute_data.csv', headers: true)
#
hashed_data = {}

array = []

data.each do |commuter|
  array << commuter.to_h
end

grouped_data =  array.group_by{|commuter| commuter["Person"]}

p grouped_data

