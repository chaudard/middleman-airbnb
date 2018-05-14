activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

data.flats.each_key do |flat_owner|
  flat_owner_name = flat_owner.to_s;
  proxy "/flats/#{flat_owner_name}.html", "/flats/show.html", locals: { owner: flat_owner_name }, ignore: true
end

# ["papillard", "ssaunier", "monsieurpaillard", "chaudard"].each do |name|
#   proxy "/flats/#{name}.html", "/flats/show.html", locals: { owner: name }, ignore: true
# end
