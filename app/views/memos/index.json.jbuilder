json.array!(@memos) do |memo|
  json._id  "#{memo.id}"
  json.merge! memo.attributes
end
