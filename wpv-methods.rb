def wpv(site)
  require 'net/http'
  require 'uri'

  print "Site: " + site + " WP: "

  uri = URI.parse(site)
  response = Net::HTTP.get_response(uri)
  wpv=response.body.lines.grep(/"generator"/)

  if wpv.empty?
    puts "No WP Version."
  else
    wpv.each do |line|
      puts line.split("\"")[3].split(" ")[1]
    end
  end
end
