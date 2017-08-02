keys = Rails.application.secrets

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, ENV['spotify_client_id'], ENV['spotify_client_secret'], scope: 'user-read-recently-played playlist-read-private playlist-read-collaborative playlist-modify-public playlist-modify-private streaming user-follow-modify user-follow-read user-library-read user-library-modify user-read-private user-read-birthdate user-read-email user-top-read'
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['facebook_app_id'], ENV['facebook_app_secret'],
        scope: 'email,user_birthday,read_stream'
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :google, ENV['google_client_id'], ENV['google_client_secret']
# end