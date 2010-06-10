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
  ['manager_solo', 'manager_solo@timetableasy.com', ['campus manager']]
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

[
  ["PSA - INFORMATIQUE 2011", "2009-11-01", "2010-02-19", "SEMESTER"],
  ["PSA - INFORMATIQUE 2011", "2010-03-04", "2010-06-30", "SEMESTER"],
  ["PSA - INFORMATIQUE 2012", "2009-11-01", "2010-02-19", "SEMESTER"],
  ["PSA - INFORMATIQUE 2012", "2010-03-04", "2010-06-30", "SEMESTER"],
  ["PSA - INFORMATIQUE 2013", "2009-11-01", "2010-02-19", "SEMESTER"],
  ["PSA - INFORMATIQUE 2013", "2010-03-04", "2010-06-30", "SEMESTER"],
  ["PSA - INFORMATIQUE 2014", "2009-11-01", "2010-02-19", "SEMESTER"],
  ["PSA - INFORMATIQUE 2014", "2010-03-04", "2010-06-30", "SEMESTER"],
  ["PSA - MEDECINE 2011", "2009-11-01", "2010-02-19", "SEMESTER"],
  ["PSA - MEDECINE 2011", "2010-03-04", "2010-06-30", "SEMESTER"],
  ["PSA - MEDECINE 2012", "2009-11-01", "2010-02-19", "SEMESTER"],
  ["PSA - MEDECINE 2012", "2010-03-04", "2010-06-30", "SEMESTER"],
  ["PSA - MEDECINE 2013", "2009-11-01", "2010-02-19", "SEMESTER"],
  ["PSA - MEDECINE 2013", "2010-03-04", "2010-06-30", "SEMESTER"],
  ["PSA - MEDECINE 2014", "2009-11-01", "2010-02-19", "SEMESTER"],
  ["PSA - MEDECINE 2014", "2010-03-04", "2010-06-30", "SEMESTER"],
  ["BDE - FINANCES 2011", "2009-11-01", "2009-12-31", "TRIMESTER"],
  ["BDE - FINANCES 2011", "2010-01-01", "2010-03-31", "TRIMESTER"],
  ["BDE - FINANCES 2011", "2010-04-01", "2010-06-30", "TRIMESTER"],
  ["BDE - FINANCES 2012", "2009-11-01", "2009-12-31", "TRIMESTER"],
  ["BDE - FINANCES 2012", "2010-01-01", "2010-03-31", "TRIMESTER"],
  ["BDE - FINANCES 2012", "2010-04-01", "2010-06-30", "TRIMESTER"],
  ["BDE - FINANCES 2013", "2009-11-01", "2009-12-31", "TRIMESTER"],
  ["BDE - FINANCES 2013", "2010-01-01", "2010-03-31", "TRIMESTER"],
  ["BDE - FINANCES 2013", "2010-04-01", "2010-06-30", "TRIMESTER"],
  ["BDE - FINANCES 2014", "2009-11-01", "2009-12-31", "TRIMESTER"],
  ["BDE - FINANCES 2014", "2010-01-01", "2010-03-31", "TRIMESTER"],
  ["BDE - FINANCES 2014", "2010-04-01", "2010-06-30", "TRIMESTER"],
  ["UNIV4 - RESSOURCES HUMAINES 2012", "2009-11-01", "2009-11-30", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2012", "2009-12-01", "2009-12-31", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2012", "2010-01-01", "2010-01-31", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2012", "2010-02-01", "2010-02-28", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2012", "2010-03-01", "2010-03-31", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2012", "2010-04-01", "2010-06-30", "TRIMESTER"],
  ["UNIV4 - RESSOURCES HUMAINES 2013", "2009-11-01", "2009-11-30", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2013", "2009-12-01", "2009-12-31", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2013", "2010-01-01", "2010-01-31", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2013", "2010-02-01", "2010-02-28", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2013", "2010-03-01", "2010-03-31", "MONTH"],
  ["UNIV4 - RESSOURCES HUMAINES 2013", "2010-04-01", "2010-06-30", "TRIMESTER"],
].each do |period|
  name_cursus, begin_at, end_at, period_type = period
  cursus = Cursus.find_by_name(name_cursus)
  my_period_type = PeriodType.find_by_name(period_type)
  
  unless cursus.periods.exists?(:begin_at => begin_at, :end_at => end_at)
    cursus.periods.create(:begin_at => begin_at, :end_at => end_at, :period_type => my_period_type)
    puts "Creating Period for Cursus #{cursus.name} => Du : #{begin_at} - au : #{end_at} (Type: #{my_period_type.name})"
  end
end

# Creating classrooms
[
  ['PARIS', 'PSA - INFORMATIQUE 2011', ['PSA1', 'PSA2']],
  ['PARIS', 'PSA - INFORMATIQUE 2012', ['PSA1', 'PSA2']],
  ['MONTPELLIER', 'PSA - MEDECINE 2011', ['PSA1', 'PSA2']],
  ['MONTPELLIER', 'PSA - MEDECINE 2012', ['PSA1', 'PSA2']],
  ['BORDEAUX','PSA - INFORMATIQUE 2011', ['PSA1', 'PSA2']],
  ['BORDEAUX','PSA - INFORMATIQUE 2012', ['PSA1', 'PSA2']]
].each do |array|
  campus_name, cursus_name, classrooms = array
  campus = Campus.find_by_name(campus_name)
  cursus = Cursus.find_by_name(cursus_name)
  classrooms.each do |classroom_name|
    unless Classroom.exists?(:name => classroom_name, :campus_id => campus.id, :cursus_id => cursus.id)
      Classroom.create(:name => classroom_name, :campus_id => campus.id, :cursus_id => cursus.id)
      puts "Creating Classroom #{classroom_name} => #{cursus_name} and #{campus_name}"
    end
  end
end

# Creating Students
[
  ['PARIS', 'PSA - INFORMATIQUE 2011', 'PSA1', ['junior', 'acadoss', 'boboyx']],
  ['PARIS', 'PSA - INFORMATIQUE 2011', 'PSA2', ['tiduse', 'fabrice', 'yuniko']],
  ['PARIS', 'PSA - INFORMATIQUE 2012', 'PSA1', ['veritable', 'acalmie', 'rotogok']],
  ['PARIS', 'PSA - INFORMATIQUE 2012', 'PSA2', ['jeanlede', 'fabrice', 'yuniko']],
  ['MONTPELLIER', 'PSA - MEDECINE 2011', 'PSA1', ['ronald', 'yehened', 'tehlor']],
  ['MONTPELLIER', 'PSA - MEDECINE 2011', 'PSA2', ['yonisha', 'clemence', 'yalice']],
  ['MONTPELLIER', 'PSA - MEDECINE 2012', 'PSA1', ['jonathan', 'andred', 'clement']],
  ['MONTPELLIER', 'PSA - MEDECINE 2012', 'PSA2', ['ludacris', 'loried', 'axeled']],
  ['BORDEAUX', 'PSA - INFORMATIQUE 2011', 'PSA1', ['thuyanh', 'soniale', 'phuulix']],
  ['BORDEAUX', 'PSA - INFORMATIQUE 2011', 'PSA2', ['vaneha', 'micadoex', 'redverds']],
  ['BORDEAUX', 'PSA - INFORMATIQUE 2012', 'PSA1', ['zackary', 'kantinc', 'yehnew']],
  ['BORDEAUX', 'PSA - INFORMATIQUE 2012', 'PSA2', ['michel', 'francois', 'luckas']]
].each do |array|
  campus_name, cursus_name, classroom_name, students = array
  role = RoleType.find_by_name('student')
  campus = Campus.find_by_name(campus_name)
  cursus = Cursus.find_by_name(cursus_name)
  if campus and cursus
    classroom = Classroom.find(:first, :conditions => {:name => classroom_name, :campus_id => campus.id, :cursus_id => cursus.id})
    students.each do |login|
      if User.find_by_login(login).nil?
        email = "#{login}@timetableasy.com"
        puts "creating student #{login} #{email}"
        @user = User.create(:login => login, :email => email, :password => login, :password_confirmation => login, :classroom => classroom)
        @user.role_types << role
      end
    end if classroom
  end
end

#Add intervening rights to users
['veritable', 'acalmie', 'rotogok', 'jonathan', 'andred', 'clement', 'manager'].each do |login|
  user = User.find_by_login(login)
  role = RoleType.find_by_name('intervenant')
  unless user.intervenant?
    puts "Add to #{login} intervening rights"
    user.role_types << role
  end
end

[
  ["PSA - INFORMATIQUE 2011","Cisco", "Cisco - Security 2"],
  ["PSA - INFORMATIQUE 2011","Cisco VoIP", "Cisco - VoIP"],
  ["PSA - INFORMATIQUE 2011","ASP.NET 2.0", "Microsoft ASP.NET 2.0"],
  ["PSA - INFORMATIQUE 2011","Java", "Java Enterprise"],
  ["PSA - INFORMATIQUE 2011","Ruby On Rails", "Ruby over the Rails Framework"],
  ["PSA - INFORMATIQUE 2011","Management", "IT Management - Session 4"],
  ["PSA - INFORMATIQUE 2011","IT Law", "IT Law - International Rights"],
  ["PSA - INFORMATIQUE 2011","IBM", "IBM MainFrame"],
  ["PSA - INFORMATIQUE 2012","Cisco", "Cisco - Security 1"],
  ["PSA - INFORMATIQUE 2012","Oracle", "DBA 2"],
  ["PSA - INFORMATIQUE 2012","Microsoft", "Microsoft C#"],
  ["PSA - INFORMATIQUE 2012","Java", "Java Mobile"],
  ["PSA - INFORMATIQUE 2012","Management", "IT Management - Session 3"],
  ["PSA - INFORMATIQUE 2012","CheckPoint", "CheckPoint Security"],
  ["PSA - INFORMATIQUE 2013","Cisco", "Cisco - CCNA 3 & 4"],
  ["PSA - INFORMATIQUE 2013","Oracle", "PL/SQL"],
  ["PSA - INFORMATIQUE 2013","Microsoft", "Microsoft Active Directory 2008"],
  ["PSA - INFORMATIQUE 2013","Java", "Java Swing and Basics"],
  ["PSA - INFORMATIQUE 2013","Management", "IT Management - Session 2"],
  ["PSA - INFORMATIQUE 2013","Maths", "Mathematics Matrix & Equations"],
  ["PSA - INFORMATIQUE 2014","Cisco", "Cisco - CCNA 1 & 2"],
  ["PSA - INFORMATIQUE 2014","Oracle", "SQL"],
  ["PSA - INFORMATIQUE 2014","Microsoft", "Microsoft Windows 7"],
  ["PSA - INFORMATIQUE 2014","C", "C Development"],
  ["PSA - INFORMATIQUE 2014","Management", "IT Management - Session 1"],
  ["PSA - INFORMATIQUE 2014","Maths", "Mathematics Bascis Vectors"],
  ["PSA - MEDECINE 2011","Biologie", "Biologie Générale"],
  ["PSA - MEDECINE 2011","Bio-Chimie", "Bio Chimie du corps Humain"],
  ["PSA - MEDECINE 2011","Histoire de la Medecine", "Histologie - Session 1"],
  ["PSA - MEDECINE 2011","Bio-Physique", "Biologie Physique des Flux"],
  ["PSA - MEDECINE 2011","Biologie Cellulaire", "Biologie des Cellules et leurs Fonctions"],
  ["PSA - MEDECINE 2011","Sciences Humaines et Sociales", "SHS"],
  ["PSA - MEDECINE 2011","Anatomie", "Anatomie du Corps Humain"],
  ["PSA - MEDECINE 2011","Physiologie", "Systeme Musculaire"],
  ["PSA - MEDECINE 2011","Bio-Statistiques", "Statistiques Mathématiques Medecine"],
  ["PSA - MEDECINE 2011","Histologie et Cytologie", "Histologie - Session 2"], 
  ["PSA - MEDECINE 2011","Embryologie", "Embryologie et Reproduction"],
  ["PSA - MEDECINE 2012","Biologie", "Biologie Générale"],
  ["PSA - MEDECINE 2012","Bio-Chimie", "Bio Chimie du corps Humain"],
  ["PSA - MEDECINE 2012","Histoire de la Medecine", "Histologie - Session 4"],
  ["PSA - MEDECINE 2012","Bio-Physique", "Biologie Physique des Flux - Avance"],
  ["PSA - MEDECINE 2012","Biologie Cellulaire", "Biologie des Cellules et Contraintes"],
  ["PSA - MEDECINE 2012","Sciences Humaines et Sociales", "SHS Session 2"],
  ["PSA - MEDECINE 2012","Anatomie", "Anatomie du Corps Humain"],
  ["PSA - MEDECINE 2012","Physiologie", "Systeme Musculaire"],
  ["PSA - MEDECINE 2012","Histologie et Cytologie", "Histologie - Session 5"], 
  ["PSA - MEDECINE 2012","Embryologie", "Embryologie et Reproduction Avance"],
  ["PSA - MEDECINE 2013","Biologie", "Biologie Générale"],
  ["PSA - MEDECINE 2013","Bio-Chimie", "Bio Chimie du corps Humain"],
  ["PSA - MEDECINE 2013","Histoire de la Medecine", "Histologie - Session 1"],
  ["PSA - MEDECINE 2013","Bio-Physique", "Biologie Physique des Flux"],
  ["PSA - MEDECINE 2013","Biologie Cellulaire", "Biologie des Cellules et leurs Fonctions"],
  ["PSA - MEDECINE 2013","Sciences Humaines et Sociales", "SHS"],
  ["PSA - MEDECINE 2013","Anatomie", "Anatomie du Corps Humain"],
  ["PSA - MEDECINE 2013","Physiologie", "Systeme Musculaire"],
  ["PSA - MEDECINE 2013","Bio-Statistiques", "Statistiques Mathématiques Medecine"],
  ["PSA - MEDECINE 2013","Histologie et Cytologie", "Histologie - Session 2"], 
  ["PSA - MEDECINE 2013","Embryologie", "Embryologie et Reproduction"],
  ["PSA - MEDECINE 2014","Biologie", "Biologie Générale"],
  ["PSA - MEDECINE 2014","Bio-Chimie", "Bio Chimie du corps Humain"],
  ["PSA - MEDECINE 2014","Histoire de la Medecine", "Histologie - Session 1"],
  ["PSA - MEDECINE 2014","Bio-Physique", "Biologie Physique des Flux"],
  ["PSA - MEDECINE 2014","Biologie Cellulaire", "Biologie des Cellules et leurs Fonctions"],
  ["PSA - MEDECINE 2014","Sciences Humaines et Sociales", "SHS"],
  ["PSA - MEDECINE 2014","Anatomie", "Anatomie du Corps Humain"],
  ["PSA - MEDECINE 2014","Physiologie", "Systeme Musculaire"],
  ["PSA - MEDECINE 2014","Bio-Statistiques", "Statistiques Mathématiques Medecine"],
  ["PSA - MEDECINE 2014","Histologie et Cytologie", "Histologie - Session 2"], 
  ["PSA - MEDECINE 2014","Embryologie", "Embryologie et Reproduction"],
  ["BDE - FINANCES 2011","Economie", "Economie Générale des Marchés Financiers"],
  ["BDE - FINANCES 2011","Micro Economie", "Economie de L'entreprise"],
  ["BDE - FINANCES 2011","Macro Economie", "Economie Mondialisée"],
  ["BDE - FINANCES 2011","Gestion", "Gerer son Entreprise"],
  ["BDE - FINANCES 2011","Entrepreunariat", "Devenir Auto Entrepreneur"],
  ["BDE - FINANCES 2011","Management", "Management d'Entreprise"],
  ["BDE - FINANCES 2012","Economie", "Economie Générale des Marchés Financiers"],
  ["BDE - FINANCES 2012","Micro Economie", "Economie de L'entreprise"],
  ["BDE - FINANCES 2012","Macro Economie", "Economie Mondialisée"],
  ["BDE - FINANCES 2012","Gestion", "Gerer son Entreprise"],
  ["BDE - FINANCES 2012","Entrepreunariat", "Qu'est ce que l'Auto Entrepreneur"],
  ["BDE - FINANCES 2012","Management", "Management d'Entreprise"],
  ["BDE - FINANCES 2013","Economie", "Economie Générale des Marchés Financiers"],
  ["BDE - FINANCES 2013","Micro Economie", "Economie de L'entreprise"],
  ["BDE - FINANCES 2013","Macro Economie", "Economie Mondialisée"],
  ["BDE - FINANCES 2013","Gestion", "Gerer son Entreprise"],
  ["BDE - FINANCES 2013","Entrepreunariat", "Qu'est ce que l'Auto Entrepreneur"],
  ["BDE - FINANCES 2013","Management", "Management d'Entreprise"],
  ["BDE - FINANCES 2014","Economie", "Economie Générale des Marchés Financiers"],
  ["BDE - FINANCES 2014","Micro Economie", "Economie de L'entreprise"],
  ["BDE - FINANCES 2014","Macro Economie", "Economie Mondialisée"],
  ["BDE - FINANCES 2014","Gestion", "Gerer son Entreprise"],
  ["BDE - FINANCES 2014","Entrepreunariat", "Qu'est ce que l'Auto Entrepreneur"],
  ["BDE - FINANCES 2014","Management", "Management d'Entreprise"],
  ["UNIV4 - RESSOURCES HUMAINES 2012","Management", "Management d'Entreprise"],
  ["UNIV4 - RESSOURCES HUMAINES 2012","Economie", "Economie de l'Entreprise"],
  ["UNIV4 - RESSOURCES HUMAINES 2012","Expression", "Mener un Entretien d'Embauche"],
  ["UNIV4 - RESSOURCES HUMAINES 2012","Mathematiques", "Calculs et Augmentation des Salaires"],
  ["UNIV4 - RESSOURCES HUMAINES 2012","Gestion", "Gerer les Salaries"],
  ["UNIV4 - RESSOURCES HUMAINES 2012","Droit", "Les Droits d'un DRH"],
  ["UNIV4 - RESSOURCES HUMAINES 2012","Droit Salarie", "Les Droits d'un Salarie"],
  ["UNIV4 - RESSOURCES HUMAINES 2013","Management", "Management d'Entreprise"],
  ["UNIV4 - RESSOURCES HUMAINES 2013","Economie", "Economie de l'Entreprise"],
  ["UNIV4 - RESSOURCES HUMAINES 2013","Expression", "Mener un Entretien d'Embauche"],
  ["UNIV4 - RESSOURCES HUMAINES 2013","Mathematiques", "Calculs et Augmentation des Salaires"],
  ["UNIV4 - RESSOURCES HUMAINES 2013","Gestion", "Gerer les Salaries"],
  ["UNIV4 - RESSOURCES HUMAINES 2013","Droit", "Les Droits d'un DRH"],
  ["UNIV4 - RESSOURCES HUMAINES 2013","Droit Salarie", "Les Droits d'un Salarie"],
].each do |school_subject|
  cursus_name, ss_name, ss_description = school_subject
  cursus = Cursus.find_by_name(cursus_name)
  
  unless cursus.school_subjects.exists?(:name => ss_name, :description => ss_description)
    school_subject = cursus.school_subjects.create(:name => ss_name, :description => ss_description)
    puts "Creating School Subject for Cursus #{cursus.name} => #{ss_name} (#{ss_description})"
    TeachingMethod::TYPES.each do |type|
      nb_hours = rand(5) - 1
      if (nb_hours > 0) 
        school_subject.teaching_methods.create(:teaching_type => type, :duration => nb_hours)
        puts "Creating teaching method (#{type}) with #{nb_hours} for #{ss_name}"
      end
    end
  end
end