require 'csv'

data = CSV.read('data/gschool_commute_data.csv', headers: true)

array = []

data.each do |commuter|
  array << commuter.to_h
end

grouped_data = array.group_by { |commuter| commuter["Person"] }

grouped_data = grouped_data.each do |commuter|
  commuter.each do |array|
    if array.class == Array
      array.each do |hash|
        hash.tap { |h| h.delete("Person") }
        hash["Week"] = hash["Week"].to_i
        hash["Outbound"] = hash["Outbound"].to_i
        hash["Inbound"] = hash["Inbound"].to_i
      end
    end
  end
end


nates_commute = 0
grouped_data['Nate'].each do |hash|
  if hash["Week"] == 4 && hash['Day'] == 'Wednesday'
    nates_commute += hash['Inbound']
  end
end
p nates_commute

average_commute_time = 0
grouped_data.each do |array|
  if array.class == Array
    array.each do |a|
      if a.class == Array
        a.each do |hash|
          average_commute_time += hash["Inbound"]
          average_commute_time += hash["Outbound"]
        end
      end
    end
  end
end
p average_commute_time

grouped_data.each do |array|
  if array.class == Array
    array.each do |a|
      if a.class == Array
        # p a
        # a.sort_by { |arr| arr.each {|hash| hash["Week"].to_i}}
      end
    end
  end
end

