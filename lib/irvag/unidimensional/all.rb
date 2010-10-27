pattern = File.join(File.dirname(__FILE__), '*.rb')
files = Dir.glob(pattern) - [__FILE__]
files.each do |filepath|
  require filepath
end
