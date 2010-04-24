namespace :bootstrap do
  
  task :campuses => :environment do
    Campus.create(:name => 'Paris', :address => '124 rue du truc') unless Campus.find_by_name('Paris')
  end
  
  task :users => :environment do
    
  end
  
  task :all => [:campuses, :users]
end