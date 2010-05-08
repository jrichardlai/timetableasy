require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  has_many  :roles
  has_many  :role_types, :through => :roles

  #for campus managers
  has_many  :managements
  has_many  :managed_campuses, :source => :campus, :through => :managements
  has_many  :classrooms, :through => :managed_campuses

  #for students
  has_one   :classroom, :through => :schooling
  has_one   :campus, :through => :classroom

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :firstname,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :firstname,     :maximum => 100

  validates_format_of       :lastname,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :lastname,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  validate                  :should_has_classroom, :if => :student?

  has_many  :events, :as => :event_scope, :dependent => :destroy

  #for intervenants
  has_many  :intervening_events, :class_name => 'Event', :foreign_key => :speaker_id

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :lastname, :firstname, :password, :password_confirmation, :role_types, :role_type_ids, :managed_campus_ids
  accepts_nested_attributes_for :role_types

  cattr_accessor :current_user


  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  def admin?
    has_role?('admin')
  end

  def student?
    has_role?('student')
  end

  def intervenant?
    has_role?('intervenant')
  end

  def manager?
    !managed_campuses.empty?
  end

  def role_names
    @role_names ||= role_types.collect(&:name).uniq
  end

  def has_role?(role)
    role_names.include?(role)
  end

  def self.intervenants
    User.find(:all, :joins => :roles, :conditions => {:roles => {:role_type_id => RoleType.find_by_name('intervenant').id}})
  end

  def cumulated_options
    options = [:global_event, [:for_user, self]]
    if admin?
      options.push([:for_campus, Campus.all], [:for_classroom, Classroom.all], [:for_cursus, Cursus.all])
    else
      options.push([:whos_speaker, self]) if intervenant?
      options.push([:for_campus, campus], [:for_classroom, classroom]) if student?
      options.push([:for_campus, managed_campuses], [:for_classroom, classrooms]) if manager?
    end
    return options
  end

  def busy_at?(date)
    not Event.whos_speaker(self).all(:conditions => ["? > begin_at and ? < end_at ", date, date]).empty?
  end

  def busy_between?(start_date, end_date)
    busy_at?(start_date) | busy_at?(end_date)
  end

  protected

  def should_has_classroom
    errors.add_to_base('user.should_has_class') if classroom_id.nil?
  end

end
