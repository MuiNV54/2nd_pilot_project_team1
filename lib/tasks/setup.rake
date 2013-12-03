namespace :devise do
  desc 'setup devise example migrating db and creating a default user'
  task :setup => ['db:drop', 'db:create', 'db:migrate', 'environment'] do
    user = User.create! do |u|
      u.email = 'user@test.com'
      u.password = 'user1234'
      u.password_confirmation = 'user1234'
      u.ensure_authentication_token!
    end
    user.confirm!
    puts 'New user created!'
    puts 'Email   : ' << user.email
    puts 'Password: ' << user.password
  end
end
