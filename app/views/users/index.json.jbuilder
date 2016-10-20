# json.array!(@users) do |user|
#   json.extract! user, :id, :username, :created_at, :updated_at
# end


json.array! @users, :id, :username, :created_at, :updated_at
