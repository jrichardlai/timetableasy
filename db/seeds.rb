# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
['admin', 'campus manager', 'intervenant', 'student'].each do |role|
  RoleType.find_or_create_by_name(role)
end

['workshop', 'lecture'].each do |role|
  EventType.find_or_create_by_name(role)
end

[
  ['timeadmin', 'admin@timetableasy.com', ['admin']],
  ['manager', 'manager@timetableasy.com', ['campus manager']],
  ['student', 'student@timetableasy.com', ['student']],
  ['intervenant', 'intervenant@timetableasy.com', ['intervenant', 'student']],  
].each do |user|
  login, email, roles = user
  if User.find_by_login(login).nil?
    puts "creating user #{login} #{email} with roles : #{roles}"
    @user = User.create(:login => login, :email => email, :password => login, :password_confirmation => login)
    @user.role_types << RoleType.find_by_name(roles)
  end
end



# User.create({:login => '61316', :firstname => "Clement", :lastname => "BEUDOT", :email => "61316@supinfo.com", :password => "toto14", :password_confirmation => "toto14" }) unless User.find_by_login('61316')
# User.create({:login => 'test', :firstname => "Clement", :lastname => "BEUDOT", :email => "test@supinfo.com", :password => "toto14", :password_confirmation => "toto14" }) unless User.find_by_login('test')