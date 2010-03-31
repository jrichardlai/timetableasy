# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_timetableasy_session',
  :secret      => '738864bba1820d8adfc5da01b04b97b8a3dedb07d607873e3dabbd54b2fc2896e9a81fc494a4a511c158cf4b831f2be35932f3ef53bd19e5455fb6bf3c850a0d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
