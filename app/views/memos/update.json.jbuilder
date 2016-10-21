if @valid
  json.merge! @memo.attributes, _id: @memo.id
end

if @memo.errors
  json.errors @memo.errors
else
  json.errors []
end
