# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

email_address = "me@example.com"
client_app_name = "Vacuum Demo"
if User.find_by(email_address: email_address).nil?
  user = User.create!(email_address: email_address, password: "trustme")
  client_app = Doorkeeper::Application.create(name: client_app_name, redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: ["read", "write"])
else
  user = User.find_by(email_address: email_address)
  client_app = Doorkeeper::Application.find_by(name: client_app_name)
end

1.upto(100000) do |i|
  Doorkeeper::AccessToken.create(
    resource_owner_id: user.id,
    application_id: client_app.id,
    refresh_token: SecureRandom.hex(32),
    expires_in: 7200,
    scopes: ''
  )

  if i % 1000 == 0
    puts "Created #{i} access tokens"
  end
end