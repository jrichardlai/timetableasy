class Management < ActiveRecord::Base
  belongs_to :user
  belongs_to :campus
end
