# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_one(model_class, attrs)
  if model_class.where(attrs).exists?
    p " ~ (already exists) #{ model_class } #{ attrs }."
    return
  end

  model = model_class.new attrs
  yield model if block_given?

  [ [ model.save ? p(" + (created)") : "! (error)",
      model_class,
    ].join(' '),
    "#{ attrs }."
  ].join(' ')
end


seed_one User, email: 'admin@local.ru' do |m|
  m.password = m.password_confirmation = '111111'
end

