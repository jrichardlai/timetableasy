class Education < ActiveRecord::Base
  set_table_name :campuses_cursuses
  belongs_to :cursus
  belongs_to :campus
end
