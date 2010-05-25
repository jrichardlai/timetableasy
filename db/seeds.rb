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

['Workshop', 'Lecture','Cours', 'Examen', 'Examen Blanc', 'Presentation', 'Evenement General', 'Partiel'].each do |role|
  EventType.find_or_create_by_name(role)
end

[
  ['timeadmin', 'admin@timetableasy.com', ['admin']],
  ['manager', 'manager@timetableasy.com', ['campus manager']],
  ['manager_solo', 'manager_solo@timetableasy.com', ['campus manager']],
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

[
  ['PARIS', '23 Rue du Chateau Landon', 'PARIS', '75010', 'FRANCE', 'UTC'],
  ['MONTPELLIER', '56 Rue de la Ville Gaiete', 'MONTPELLIER', '34000', 'FRANCE', 'UTC'],
  ['BEIJING', '5 Place de Yao Ming', 'BEIJING', '198283', 'CHINE', 'UTC'],
  ['BORDEAUX', '33 Avenue Sainte Catherine', 'BORDEAUX', '33100', 'FRANCE', 'UTC'],
  ['TOULOUSE', '12 Impasse du Mouroir', 'TOULOUSE', '31000', 'FRANCE', 'UTC'],
  ['LILLE', '45 Vallée du Chevreuil Noir', 'LILLE', '54029', 'FRANCE', 'UTC'],
  ['METZ', '98 Rue du Blouson Noir', 'METZ', '57989', 'FRANCE', 'UTC'],
  ['LYON', '67 Allee de la contrepetrie', 'LYON', '69876', 'FRANCE', 'UTC'],
  ['GRENOBLE', '93 Place de la muerte fugace', 'GRENOBLE', '38567', 'FRANCE', 'UTC'],
  ['SAN FRANCISCO', '45 Garfield Square', 'SAN FRANCISCO', '33442Z', 'ETATS UNIS', 'UTC'],
  ['MEXICO', '34 Calle de la Vega Rodriguez', 'MEXICO', '77433D', 'MEXIQUE', 'UTC'],
].each do |campus|
  name, address, city, zip, country, timezone = campus
  if Campus.find_by_name(name).nil?
    puts "Creating Campus #{name} - #{address} - #{zip} #{city}, #{country}"
    @campus = Campus.create(:name => name, :address => address, :city => city, :zip => zip, :country => country, :timezone => timezone)
  end
end

[
  ['PSA - INFORMATIQUE 2011', 'Cursus Informatique PSA promotion 2011'],
  ['PSA - INFORMATIQUE 2012', 'Cursus Informatique PSA promotion 2012'],
  ['PSA - INFORMATIQUE 2013', 'Cursus Informatique PSA promotion 2013'],
  ['PSA - INFORMATIQUE 2014', 'Cursus Informatique PSA promotion 2014'],
  ['PSA - MEDECINE 2011', 'Cursus Medecine PSA promotion 2011'],
  ['PSA - MEDECINE 2012', 'Cursus Medecine PSA promotion 2012'],
  ['PSA - MEDECINE 2013', 'Cursus Medecine PSA promotion 2013'],
  ['PSA - MEDECINE 2014', 'Cursus Medecine PSA promotion 2014'],
  ['BDE - FINANCES 2011', 'Cursus Finances PSA promotion 2011'],
  ['BDE - FINANCES 2012', 'Cursus Finances PSA promotion 2012'],
  ['BDE - FINANCES 2013', 'Cursus Finances PSA promotion 2013'],
  ['BDE - FINANCES 2014', 'Cursus Finances PSA promotion 2014'],
  ['UNIV4 - RESSOURCES HUMAINES 2012', 'Cursus Ressources Humaines Univ 4 promotion 2012'],
  ['UNIV4 - RESSOURCES HUMAINES 2013', 'Cursus Ressources Humaines Univ 4 promotion 2013'],
].each do |cursus|
  name, description = cursus
  if Cursus.find_by_name(name).nil?
    puts "Creating Cursus #{name} - #{description}"
    @cursus = Cursus.create(:name => name, :description => description)
  end
end

[
  ['PARIS', 'PSA - INFORMATIQUE 2011'],
  ['PARIS', 'PSA - INFORMATIQUE 2012'],
  ['PARIS', 'PSA - INFORMATIQUE 2013'],
  ['PARIS', 'PSA - INFORMATIQUE 2014'],
  ['PARIS', 'PSA - MEDECINE 2011'],
  ['PARIS', 'PSA - MEDECINE 2012'],
  ['PARIS', 'PSA - MEDECINE 2013'],
  ['PARIS', 'PSA - MEDECINE 2014'],
  ['MONTPELLIER', 'PSA - MEDECINE 2011'],
  ['MONTPELLIER', 'PSA - MEDECINE 2012'],
  ['MONTPELLIER', 'PSA - MEDECINE 2013'],
  ['MONTPELLIER', 'PSA - MEDECINE 2014'],
  ['MONTPELLIER', 'BDE - FINANCES 2011'],
  ['MONTPELLIER', 'BDE - FINANCES 2012'],
  ['MONTPELLIER', 'BDE - FINANCES 2013'],
  ['MONTPELLIER', 'BDE - FINANCES 2014'],
  ['BEIJING','PSA - INFORMATIQUE 2011'],
  ['BEIJING','PSA - INFORMATIQUE 2012'],
  ['BEIJING','PSA - INFORMATIQUE 2013'],
  ['BEIJING','PSA - INFORMATIQUE 2014'],
  ['BEIJING','UNIV4 - RESSOURCES HUMAINES 2012'],
  ['BEIJING','UNIV4 - RESSOURCES HUMAINES 2013'],
  ['BORDEAUX','PSA - INFORMATIQUE 2011'],
  ['BORDEAUX','PSA - INFORMATIQUE 2012'],
  ['BORDEAUX','PSA - INFORMATIQUE 2013'],
  ['BORDEAUX','PSA - INFORMATIQUE 2014'],
  ['BORDEAUX','BDE - FINANCES 2011'],
  ['BORDEAUX','BDE - FINANCES 2012'],
  ['BORDEAUX','BDE - FINANCES 2013'],
  ['BORDEAUX','BDE - FINANCES 2014'],
  ['TOULOUSE','PSA - MEDECINE 2011'],
  ['TOULOUSE','PSA - MEDECINE 2012'],
  ['TOULOUSE','PSA - MEDECINE 2013'],
  ['TOULOUSE','PSA - MEDECINE 2014'],
  ['LILLE','PSA - MEDECINE 2011'],
  ['LILLE','PSA - MEDECINE 2012'],
  ['LILLE','PSA - MEDECINE 2013'],
  ['LILLE','PSA - MEDECINE 2014'],
  ['LILLE','PSA - INFORMATIQUE 2011'],
  ['LILLE','PSA - INFORMATIQUE 2012'],
  ['LILLE','PSA - INFORMATIQUE 2013'],
  ['LILLE','PSA - INFORMATIQUE 2014'],
  ['METZ','BDE - FINANCES 2011'],
  ['METZ','BDE - FINANCES 2012'],
  ['METZ','BDE - FINANCES 2013'],
  ['METZ','BDE - FINANCES 2014'],
  ['METZ','PSA - MEDECINE 2011'],
  ['METZ','PSA - MEDECINE 2012'],
  ['METZ','PSA - MEDECINE 2013'],
  ['METZ','PSA - MEDECINE 2014'],
  ['METZ','PSA - INFORMATIQUE 2011'],
  ['METZ','PSA - INFORMATIQUE 2012'],
  ['METZ','PSA - INFORMATIQUE 2013'],
  ['METZ','PSA - INFORMATIQUE 2014'],
  ['LYON','PSA - INFORMATIQUE 2011'],
  ['LYON','PSA - INFORMATIQUE 2012'],
  ['LYON','PSA - INFORMATIQUE 2013'],
  ['LYON','PSA - INFORMATIQUE 2014'],
  ['LYON','UNIV4 - RESSOURCES HUMAINES 2012'],
  ['LYON','UNIV4 - RESSOURCES HUMAINES 2013'],
  ['GRENOBLE','UNIV4 - RESSOURCES HUMAINES 2012'],
  ['GRENOBLE','UNIV4 - RESSOURCES HUMAINES 2013'],
  ['GRENOBLE','BDE - FINANCES 2011'],
  ['GRENOBLE','BDE - FINANCES 2012'],
  ['GRENOBLE','BDE - FINANCES 2013'],
  ['GRENOBLE','BDE - FINANCES 2014'],
  ['SAN FRANCISCO','PSA - MEDECINE 2011'],
  ['SAN FRANCISCO','PSA - MEDECINE 2012'],
  ['SAN FRANCISCO','PSA - MEDECINE 2013'],
  ['SAN FRANCISCO','PSA - MEDECINE 2014'],
  ['SAN FRANCISCO','PSA - INFORMATIQUE 2011'],
  ['SAN FRANCISCO','PSA - INFORMATIQUE 2012'],
  ['SAN FRANCISCO','PSA - INFORMATIQUE 2013'],
  ['SAN FRANCISCO','PSA - INFORMATIQUE 2014'],
  ['MEXICO','UNIV4 - RESSOURCES HUMAINES 2012'],
  ['MEXICO','UNIV4 - RESSOURCES HUMAINES 2013'],
  ['MEXICO','PSA - MEDECINE 2011'],
  ['MEXICO','PSA - MEDECINE 2012'],
  ['MEXICO','PSA - MEDECINE 2013'],
  ['MEXICO','PSA - MEDECINE 2014'],
  ['MEXICO','PSA - INFORMATIQUE 2011'],
  ['MEXICO','PSA - INFORMATIQUE 2012'],
  ['MEXICO','PSA - INFORMATIQUE 2013'],
  ['MEXICO','PSA - INFORMATIQUE 2014'],
].each do |campus_cursus|
  name_campus, name_cursus = campus_cursus
  campus = Campus.find_by_name(name_campus)
  cursus = Cursus.find_by_name(name_cursus)
  
  unless campus.cursuses.include? cursus
    campus.cursuses << cursus
    puts "Creating Campus => Cursus association #{campus.name} <==> #{cursus.name}"
  end
end

%w{SEMESTER YEAR MONTH WEEK TRIMESTER QUARTER}.each do |name|
  if PeriodType.find_by_name(name).nil?
    puts "Creating Period Type #{name}"
    @period_type = PeriodType.create(:name => name)
  end
end

[
  ['PARIS', 'manager_solo'],
  ['MONTPELLIER', 'manager'],
  ['MONTPELLIER', 'manager_solo'],
  ['BEIJING', 'manager'],
  ['BORDEAUX', 'manager'],
  ['TOULOUSE', 'manager'],
  ['LILLE', 'manager'],
  ['METZ', 'manager'],
  ['LYON', 'manager'],
  ['GRENOBLE', 'manager'],
  ['SAN FRANCISCO', 'manager'],
  ['MEXICO', 'manager'],
].each do |manager|
  name_campus, login = manager
  campus = Campus.find_by_name(name_campus)
  user = User.find_by_login(login)
  
  unless campus.managers.include? user
    campus.managers << user
    puts "Giving the Campus Manager Role on #{campus.name} to #{user.login}"
  end
end

[
  ['PARIS', 'PARIS - BAT A - ETAGE 1 - SALLE A'],
  ['PARIS', 'PARIS - BAT A - ETAGE 2 - SALLE A'],
  ['PARIS', 'PARIS - BAT A - ETAGE 3 - SALLE A'],
  ['PARIS', 'PARIS - BAT A - ETAGE 4 - SALLE A'],
  ['PARIS', 'PARIS - BAT B - ETAGE 1 - SALLE A'],
  ['PARIS', 'PARIS - BAT B - ETAGE 2 - SALLE A'],
  ['PARIS', 'PARIS - BAT C - ETAGE 1 - SALLE A'],
  ['MONTPELLIER', 'MONTPELLIER - BAT A - ETAGE 1 - SALLE A'],
  ['MONTPELLIER', 'MONTPELLIER - BAT A - ETAGE 2 - SALLE A'],
  ['MONTPELLIER', 'MONTPELLIER - BAT A - ETAGE 3 - SALLE A'],
  ['MONTPELLIER', 'MONTPELLIER - BAT A - ETAGE 4 - SALLE A'],
  ['MONTPELLIER', 'MONTPELLIER - BAT A - ETAGE 5 - SALLE A'],
  ['MONTPELLIER', 'MONTPELLIER - BAT A - ETAGE 6 - SALLE A'],
  ['BEIJING', 'BEIJING - BAT C - ETAGE 1 - SALLE MAO'],
  ['BEIJING', 'BEIJING - BAT C - ETAGE 2 - SALLE MAO'],
  ['BEIJING', 'BEIJING - BAT C - ETAGE 3 - SALLE MAO'],
  ['BEIJING', 'BEIJING - BAT C - ETAGE 4 - SALLE MAO'],
  ['BORDEAUX', 'BORDEAUX - BAT B - ETAGE 1 - SALLE VINCI'],
  ['BORDEAUX', 'BORDEAUX - BAT B - ETAGE 2 - SALLE DESCARTES'],
  ['BORDEAUX', 'BORDEAUX - BAT B - ETAGE 3 - SALLE APOLINAIRE'],
  ['BORDEAUX', 'BORDEAUX - BAT B - ETAGE 4 - SALLE CLAUDEL'],
  ['TOULOUSE', 'BORDEAUX - BAT A - ETAGE 1 - SALLE A'],
  ['TOULOUSE', 'BORDEAUX - BAT A - ETAGE 2 - SALLE B'],
  ['TOULOUSE', 'BORDEAUX - BAT A - ETAGE 3 - SALLE C'],
  ['LILLE', 'LILLE - BAT A - ETAGE 1 - SALLE A'],
  ['LILLE', 'LILLE - BAT A - ETAGE 2 - SALLE B'],
  ['METZ', 'METZ - BAT A - ETAGE 1 - SALLE A'],
  ['METZ', 'METZ - BAT A - ETAGE 2 - SALLE B'],
  ['METZ', 'METZ - BAT A - ETAGE 3 - SALLE C'],
  ['METZ', 'METZ - BAT A - ETAGE 4 - SALLE D'],
  ['LYON', 'LYON - BAT A - ETAGE 1 - SALLE A'],
  ['LYON', 'LYON - BAT A - ETAGE 2 - SALLE B'],
  ['LYON', 'LYON - BAT A - ETAGE 3 - SALLE C'],
  ['LYON', 'LYON -BAT A - ETAGE 4 - SALLE D'],
  ['GRENOBLE', 'GRENOBLE - BAT A - ETAGE 1 - SALLE A'],
  ['GRENOBLE', 'GRENOBLE - BAT A - ETAGE 2 - SALLE B'],
  ['GRENOBLE', 'GRENOBLE - BAT A - ETAGE 3 - SALLE C'],
  ['SAN FRANCISCO', 'SAN FRANCISCO - BAT A - ETAGE 1 - SALLE A'],
  ['SAN FRANCISCO', 'SAN FRANCISCO - BAT A - ETAGE 2 - SALLE B'],
  ['SAN FRANCISCO', 'SAN FRANCISCO - BAT A - ETAGE 3 - SALLE C'],
  ['MEXICO', 'MEXICO - BAT A - ETAGE 1 - SALLE A'],
  ['MEXICO', 'MEXICO - BAT A - ETAGE 2 - SALLE A'],
  ['MEXICO', 'MEXICO - BAT A - ETAGE 3 - SALLE A'],
  ['MEXICO', 'MEXICO - BAT A - ETAGE 4 - SALLE A'],
  ['MEXICO', 'MEXICO - BAT A - ETAGE 5 - SALLE A'],
].each do |salle|
  name_campus, nom_salle = salle
  campus = Campus.find_by_name(name_campus)
  my_salle = campus.rooms.find_by_name(nom_salle)
  
  unless campus.rooms.include? my_salle
    campus.rooms.create(:name => nom_salle)
    puts "Creating Room for campus #{campus.name} => #{nom_salle}"
  end

end

# User.create({:login => '61316', :firstname => "Clement", :lastname => "BEUDOT", :email => "61316@supinfo.com", :password => "toto14", :password_confirmation => "toto14" }) unless User.find_by_login('61316')
# User.create({:login => 'test', :firstname => "Clement", :lastname => "BEUDOT", :email => "test@supinfo.com", :password => "toto14", :password_confirmation => "toto14" }) unless User.find_by_login('test')