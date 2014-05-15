require 'net/http'
require 'uri'
require 'json'

module JSON
 
end

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

class Line

  def initialize(linecode = 11302)
    @linecd = linecode
  end
  
  def linecd
    @linecd
  end

  def show 
   @linecd = self.linecd
    uri = URI.parse("http://www.ekidata.jp/api/l/" + "#{@linecd}"+ ".json")
    json = Net::HTTP.get(uri)
    json =  json.gsub(/xml.data = /,"")
    json =  json.gsub(/if\(typeof\(xml.onload\)=='function'\) xml.onload\(xml.data\);/,"")
    json =  json.gsub(/if\(typeof\(xml\)=='undefined'\) xml = {};/,"")
    result = JSON.parse(json)
    return result
  end

end

class Station

 def initialize(stationcd = 1130224)
   @stationcode = stationcd
 end

 def stationcode
   @stationcode
 end

 def show
  @stationcode = self.stationcode
  uri = URI.parse("http://www.ekidata.jp/api/s/" + "#{@stationcode}" + ".json")
  json = Net::HTTP.get(uri)   
  json =  json.gsub(/xml.data = /,"")
  json =  json.gsub(/if\(typeof\(xml.onload\)=='function'\) xml.onload\(xml.data\);/,"")
  json =  json.gsub(/if\(typeof\(xml\)=='undefined'\) xml = {};/,"")
  result = JSON.parse(json)
  return result
 end

end

class Group

end

station = Station.new
station = station.show

line =  station['station']

line.each{
 |line|
 puts line['line_name']
}





