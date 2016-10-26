json.merge! @memo.attributes
json.set! :_id, "#{@memo.id}"

if @memo.errors
  json.errors @memo.errors
else
  json.errors []
end
