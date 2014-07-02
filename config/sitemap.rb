# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://kupikupidulu.com'

SitemapGenerator::Sitemap.create do
  Article.find_each do |article|
    add article_path(article), lastmod: article.updated_at, changefreq: 'daily', priority: 0.8
  end
  add contact_path, changefreq: 'monthly', priority: 0.1
end
