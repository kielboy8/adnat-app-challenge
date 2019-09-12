json.extract! user, :id, :organization_id, :name, :email_address, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
