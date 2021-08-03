case Rails.env
when "development"
   puts "Seeding for env = development"
   Dir[File.join(Rails.root, 'db', 'seeds', 'development', '*.rb')].sort.each { |seed| load seed }
when "production"
  puts "Seeding for env = production"
  Dir[File.join(Rails.root, 'db', 'seeds', 'production', '*.rb')].sort.each { |seed| load seed }
end
