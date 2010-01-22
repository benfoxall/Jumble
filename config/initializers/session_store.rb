# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jumble_session',
  :secret      => '07bc903cb1ac598eab09fc53d25cf2d2cc94419f4b383a7f3660d2123bd6d69fb66b3f591a664b187aa23b5e3649c3c90ae45b325af6e6ed818dfb3d9bb4e35a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
