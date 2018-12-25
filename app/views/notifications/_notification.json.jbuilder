json.extract! notification, :id, :like_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
