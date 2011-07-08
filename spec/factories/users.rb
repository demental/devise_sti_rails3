# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.sequence(:email) {|n| "user#{n}@example.org"}
  f.password  'password123'
  f.password_confirmation 'password123'
end

Factory.define :admin, :parent => :user, :class => Admin do |f|
  f.sequence(:email) {|n| "admin#{n}@example.org"}
end