require 'net/http'
require 'uri'
require 'json'

class Pref

  def initialize(prefid = 14)
   @prefid = prefid
  end                

  def prefid
   @prefid
  end

  def show
   @prefid = self.prefid
   uri = URI.parse("http://www.ekidata.jp/api/p/" + "#{@prefid}" + ".json")
   json = Net::HTTP.get(uri)
   json =  json.gsub(/xml.data = /,"")
   json =  json.gsub(/if\(typeof\(xml.onload\)=='function'\) xml.onload\(xml.data\);/,"")
   json =  json.gsub(/if\(typeof\(xml\)=='undefined'\) xml = {};/,"")
   result = JSON.parse(json)
   return result
  end

end

pref = Pref.new(13)
station =  pref.show

line = station['line']

line.each{
   |line| 
   puts line['line_cd'],line['line_name'],"\n"
}












