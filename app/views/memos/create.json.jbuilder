if @valid
  json.merge! @memo.attributes
end

if @memo.errors
  json.errors @memo.errors
else
  json.errors []
end
