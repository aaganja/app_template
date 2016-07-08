remove_file "README.rdoc"
create_file "README.md",  "TODO"
gem 'pry-rails', group: [:test, :development]
run "bundle install"

if yes? "Do you want to generate root controller? yes/no"
  name = ask("what should be its name?").underscore
  generate :controller, "#{name} index"
  route "root to: '#{name}\#index'"
end

git :init
append_file ".gitignore", "config/database.yml"
run "cp config/database.yml config/example_database.yml"
git add: '.', commit: "-m 'initial commit'"
