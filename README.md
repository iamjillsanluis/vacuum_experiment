# README

bin/rails db:migrate
bin/rails c

```ruby
Doorkeeper::Application.create(name: "Vacuum Demo", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: ["read", "write"])

#<Doorkeeper::Application:0x0000000123f99d80
 id: 1,
 name: "Vacuum Demo",
 uid: "-JSa7hQkDDkOiYSfOH568zaTKLRLfqJZROZb6ExD8aw",
 secret: "[FILTERED]", # ewbt4Wa0OqGZGZvuNax9S-IOcYqtlO94Bet_zsFV1-w
 redirect_uri: "urn:ietf:wg:oauth:2.0:oob",
 scopes: "read write",
 confidential: true,
 created_at: "2025-08-14 17:23:34.932119000 +0000",
 updated_at: "2025-08-14 17:23:34.932119000 +0000">


User.create!(email_address: "me@example.com", password: "trustme")
#<User:0x0000000132c35c98
 id: 1,
 email_address: "[FILTERED]",
 password_digest: "[FILTERED]",
 created_at: "2025-08-14 17:25:48.597481000 +0000",
 updated_at: "2025-08-14 17:25:48.597481000 +0000">
```

bin/rails s
```sh
time for i in {1..1000000}; do
  curl -X POST http://localhost:3000/oauth/token \
    -H "Content-Type: application/json" \
    -d '{
      "email_address": "me@example.com",
      "password": "trustme",
      "grant_type": "password",
      "client_id": "-JSa7hQkDDkOiYSfOH568zaTKLRLfqJZROZb6ExD8aw",
      "client_secret": "ewbt4Wa0OqGZGZvuNax9S-IOcYqtlO94Bet_zsFV1-w"
    }' \
    --silent --output /dev/null
  if [ $((i % 1000)) -eq 0 ]; then
    echo "Completed $i requests"
  fi
done
```

Run script from https://github.com/ioguix/pgsql-bloat-estimation/tree/master

