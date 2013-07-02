require 'net/http'
require "json"

Included = nil
Exclude4 = false

def parse(numList)
  freeList = Array.new
  numList.each_with_index { |num, index|
    if(num.to_s.length == 11 && numList[index + 1] == 0) then
      freeList.push(num.to_s) 
    end
  }
  
  ##includeList = Array.new if Included
  ##freeList.each{|num|
  ##  includeList.push(num) if(Included && num.include?(Included))
  ##}
  
  freeList.each{ |num|
    if(Exclude4) then
      puts num unless num.include? '4'
    else
      puts num
    end
  } 
end

ARGV.each{ |argv|
  Exclude4 = true if argv == '-e'
  Included = argv unless argv == '-e'
}
throw 'please input a search value' unless Included

uri = URI('http://num.10010.com/NumApp/chseNumList/serchNums')
params = { :province => 11, :cityCode => 110, :sortType=>'numAsc', :searchType=>'01', :searchValue=>Included }
uri.query = URI.encode_www_form(params)

res = Net::HTTP.get_response(uri)
result = res.is_a?(Net::HTTPSuccess)
##result = true;
if(!result) then
  puts "Query failed "
elsif
  numList = JSON.parse(res.body)["moreNumArray"]
  ##numList = [18500132525,1800,0,126,110,1,18501364632,0,1,0,110,0]
  parse(numList)
end

