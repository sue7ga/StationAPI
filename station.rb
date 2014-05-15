require 'net/http'
require 'uri'
require 'json'

module URL
 def url(uri) 
  json = Net::HTTP.get(uri)
  json =  json.gsub(/xml.data = /,"")
  json =  json.gsub(/if\(typeof\(xml.onload\)=='function'\) xml.onload\(xml.data\);/,"")
  json =  json.gsub(/if\(typeof\(xml\)=='undefined'\) xml = {};/,"")
  result = JSON.parse(json)
  return result
 end
end

class Pref
  include URL

  def initialize(prefid = 14)
   @prefid = prefid
  end                

  def prefid
   @prefid
  end

  def show
   @prefid = self.prefid
   uri = URI.parse("http://www.ekidata.jp/api/p/" + "#{@prefid}" + ".json")
   result = url(uri)
   return result
  end
end

class Line
  include URL

  def initialize(linecode = 11302)
    @linecd = linecode
  end
  
  def linecd
    @linecd
  end

  def show 
   @linecd = self.linecd
    uri = URI.parse("http://www.ekidata.jp/api/l/" + "#{@linecd}"+ ".json")
    result = url(uri)
    return result
  end

end

class Station
  include URL

 def initialize(stationcd = 1130224)
   @stationcode = stationcd
 end

 def stationcode
   @stationcode
 end

 def show
  @stationcode = self.stationcode
  uri = URI.parse("http://www.ekidata.jp/api/s/" + "#{@stationcode}" + ".json")
  result = url(uri) 
  return result
 end

end

class Group
  include URL
 
  def initialize(stationcode = 1130224)
   @groupcode = stationcode
  end
  
  def groupcode
   @groupcode
  end

  def show
   @groupcode = self.groupcode
   uri = URI.parse("http://www.ekidata.jp/api/g/" + "#{@groupcode}" + ".json")
   result = url(uri)
   return result
  end

end

class Near
  include URL

  def initialize(linecode = 11302)
   @linecode = linecode
  end
  
  def linecode
   @linecode
  end

  def show
   @linecode = self.linecode
   uri = URI.parse("http://www.ekidata.jp/api/n/" + "#{@linecode}" + ".json")
   result = url(uri)
   return result  
  end

end

near = Near.new
puts near.show














































