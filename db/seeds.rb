# Add seed data here. Seed your database with `rake db:seed`
lp = LibraryParser.new
filenames_array = lp.call
filenames_array.each do |n|
  info_array = lp.parse_filename(n)
  lp.build_objects(info_array[0], info_array[1], info_array[2])
end
