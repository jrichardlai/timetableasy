class Period < ActiveRecord::Base
  belongs_to :period_type
  belongs_to :cursus
  delegate :name, :to => :period_type
end
