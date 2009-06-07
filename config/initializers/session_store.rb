# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ipv6portal_session',
  :secret      => 'aa80f6a0c49058fcdf636a04986abe4e1c31ac7ea4719c46ec2f85547f5493568638d9b07991b87996da722a763b24f7f2aa388439782dba67b46924339f192c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
