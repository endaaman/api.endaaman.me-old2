

Memo.create(
  # :slug: 'slug',  # filled automatically by random string
  title: 'hoge1',
  digest: 'digest1',
  hidden: false,
  draft: false,
  image_url: '',
  content: 'hoge hoge hoge'
)

if User.where(username: 'ken').count < 1
  User.create(
    username: 'ken',
    password: 'hogehoge',
    password_confirmation: 'hogehoge'
  )
end
