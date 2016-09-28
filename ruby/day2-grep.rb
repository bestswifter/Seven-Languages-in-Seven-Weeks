word = ARGV[0]

File::open("/Users/zxy/Desktop/dsl.rb") do |f|
  line_number = 0
  f.each_line do |line|
    line_number = line_number + 1
    if line.include? word
      puts "#{line_number}  #{line.lstrip}"
    end
  end
end
