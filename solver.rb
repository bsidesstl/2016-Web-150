require 'typhoeus'

urls = (0..9999).map{ |num| "http://localhost/login/donutsAreGr8/#{'%04d' % num.to_s}"}

hydra = Typhoeus::Hydra.new

successes = 0

urls.each do |url|
    request = Typhoeus::Request.new(url, timeout: 15000)
    request.on_complete do |response|
        if response.success?
            puts "Successfully requested " + url + response.body
            successes += 1
        end
    end
    hydra.queue(request)
end

hydra.run

puts "Fetched all urls!" if successes == urls.length