if Rails.env.development? || Rails.env.staging?
  ActiveRecord::Base.connection.tables.map { |table| Object.const_get(table.classify) rescue nil }.compact.each do |_class|
    ActiveRecord::Base.connection.execute("TRUNCATE #{_class.table_name}")
  end
end

if Category.all.blank?
  ['takajut', 'cumil', 'kagum', 'berita', 'kuyak', 'bikin ketawa', 'seksi'].each do |name|
    Category.create name: name
  end
end

if Rails.env.development?
  User.create name: 'user', email: 'user@doubledown.jp', password: 'secret', password_confirmation: 'secret'

  10.times do |i|
    article = Article.new(title: "image article#{i}", description: "article#{i}'s description", category: Category.all.sample, source_name: "article#{i}'s source name", source_url: 'http://www.youtube.com/watch?v=e8M6S8EKbnU', displayable: true)
    rand(5).times do |j|
      article.media.build type: 'Image', remote_file_url: 'http://placehold.jp/200x200.png'
    end
    article.save

    article = Article.new(title: "video article#{i}", description: "article#{i}'s description", category: Category.all.sample, source_name: "article#{i}'s source name", source_url: 'http://www.youtube.com/watch?v=e8M6S8EKbnU', displayable: true)
    article.media.build type: 'Video', url: 'http://www.youtube.com/embed/e8M6S8EKbnU'
    article.save
  end
end
