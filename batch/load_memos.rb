if ARGV.size < 1
  puts 'Please specify 1 arg at least'
  exit 1
end

path = ARGV[0]


if not File.exist?(path)
  puts "#{path} does not exist"
  exit 1
end

jsonFile = File.open(path).read
memos = JSON.load(jsonFile) rescue nil

if not memos
  puts "#{path} is not json"
  exit 1
end

Memo.destroy_all


for m in memos.reverse
  memo = Memo.new(
    slug: m['slug'],
    hex: m['_id']['$oid'],
    title: m['title'],
    digest: m['digest'] || '',
    hidden: !!m['hidden'],
    draft: !!m['draft'],
    image_url: m['image_url'] || '',
    content: m['content'],
    updated_at: Time.parse(m['updated_at']['$date']).to_time.to_s(:db),
    created_at: Time.parse(m['created_at']['$date']).to_time.to_s(:db)
  )
  memo.save!
end
