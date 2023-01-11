Pry.config.theme  = "railscasts"
Pry.config.editor = "vim -p"

Pry.hooks.add_hook :after_read, :hack_encoding do |str, _|
  str.force_encoding("ASCII-8BIT")
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "#{exception.class}: #{exception.message}"
  exception.backtrace.each do |bt|
    puts "\tfrom: #{bt}"
    break if bt =~ /^\(pry\)/
  end
end

%w(httparty base64 uri json csv cgi).each {|dep| require dep }
