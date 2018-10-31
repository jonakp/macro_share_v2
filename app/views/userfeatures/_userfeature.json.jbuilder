json.extract! userfeature, :id, :user_id, :height, :weight, :age, :activity, :purpose, :total_calorie, :protein, :fat, :carbo, :created_at, :updated_at
json.url userfeature_url(userfeature, format: :json)
