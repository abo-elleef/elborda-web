json.extract! poem, :id, :name, :created_at, :updated_at
json.url poem_url(poem, format: :json)
