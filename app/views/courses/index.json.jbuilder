json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :prerequisite, :locations_id, :categories_id
  json.url course_url(course, format: :json)
end
