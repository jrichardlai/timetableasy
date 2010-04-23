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

User.create({:login => '61316', :firstname => "Clement", :lastname => "BEUDOT", :email => "61316@supinfo.com", :password => "toto14", :password_confirmation => "toto14" }) unless User.find_by_login('61316')