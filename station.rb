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
   str = json.to_s
   return str.gsub(/if(typeof(xml.onload)=='function') xml.onload(xml.data);/,'hoge')
   result = JSON.parse(json)
   return result
  end

end

pref = Pref.new(13)
puts pref.show





