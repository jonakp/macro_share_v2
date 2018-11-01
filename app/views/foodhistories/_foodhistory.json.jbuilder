json.extract! foodhistory, :id, :name, :calorie, :protein, :fat, :carbo, :image_name, :created_at, :updated_at
json.url foodhistory_url(foodhistory, format: :json)
