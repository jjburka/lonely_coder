$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '/lib' )
$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '/lib/lonely_coder' )

require 'lonely_coder'

okc = OKCupid.new('archisextture','!eruttxesihcra!')
sweet_guys = []

search = okc.search({
  :min_age => 18,
  :max_age => 99,
  :gentation => 'guys who like guys',
})

search.results().each do|result|
  puts result.username;
end