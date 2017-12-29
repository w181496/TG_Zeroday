require 'net/http'
require 'uri'
require 'cgi'

$userid = 'YOUR_ID'
$token = 'YOUR_BOT_TOKEN'
$log_path = 'YOUR_LOG_PATH'

f = File.open($log_path, "r+")
prev = f.read()

def get_vul()
    uri = URI("https://zeroday.hitcon.org/vulnerability/disclosed")
    http = Net::HTTP.start(uri.host, uri.port,:use_ssl => uri.scheme == 'https')
    request = Net::HTTP::Get.new(uri.request_uri)
    r = http.request(request)
    vuls = r.body.scan /<a href="(.*)">(.*)<\/a><\/h4>/
end

new_vuls = get_vul()
new_vuls.each do |s|
    if !prev.include? s[0]  # link
        $msg = URI.encode s[1]  # title
        sendMsg = "https://api.telegram.org/bot#{$token}/sendMessage?chat_id=#{$userid}&text=#{$msg}"

        uri = URI(sendMsg)
        Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            request = Net::HTTP::Get.new uri
            response = http.request request 
        end
        f.write(s[0] + "\n")
        sleep(0.5)
    end
end
f.close()
