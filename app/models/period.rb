class Period < ActiveRecord::Base
  belongs_to :period_type
  belongs_to :cursus
  delegate :name, :to => :period_type, :allow_nil => true
  
  validates_presence_of :begin_at
  validates_presence_of :end_at
  validate :dates_do_not_cross?
  
  def dates_do_not_cross?
    errors.add_to_base(I18n.t("errors.overlapping_date")) if
      cursus.periods.exists?(["NOT (? > end_at OR ? < begin_at)", end_at, begin_at])
  end
  
end
