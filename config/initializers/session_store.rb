# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tracker_session',
  :secret      => '68f994b45c51cb70c69612d6d763077e670b311f82b15876bba38ba2435da0f37aecd0c87756dda99bf5e22fb9c073a94d942f35417b2574986f69c26ba645ed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
