if Memo.count < 1
  Memo.create(
    title: 'hoge1',
    digest: 'digest1',
    hidden: false,
    draft: false,
    image_url: '',
    content: 'hoge hoge hoge'
  )
end

if User.where(username: 'ken').count < 1
  User.create(
    username: 'ken',
    password: 'hogehoge',
    password_confirmation: 'hogehoge'
  )
end
