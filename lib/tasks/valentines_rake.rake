require 'set'
task :matches => :environment do
  gender = ENV['gender']
  matched = Set.new
  searching = Person.where(:gender => gender).order(:id).all
  possible_matches = Person.where(:looking_for => gender).order(:id).all
  searching.each do |person|
    next if matched.include? person.id
    while not possible_matches.empty?
      valentine = possible_matches.shift
      next if valentine == person
      next if matched.include? valentine.id
      puts "#{person.username};#{valentine.username}"
      puts "#{valentine.username};#{person.username}"
      matched.merge [valentine.id, person.id]
      break
    end
  end
end