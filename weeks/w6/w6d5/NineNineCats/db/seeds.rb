# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

  Cat.destroy_all


  cat1 = Cat.new(birth_date: '2019/10/15', color: 'brown', name: 'Jasper', sex: 'M', description: 'cool cat')
  cat2 = Cat.new(birth_date: '2018/10/15', color: 'white', name: 'Paulo', sex: 'M', description: 'actually a goat')
  cat3 = Cat.new(birth_date: '2017/10/15', color: 'black', name: 'Elmo', sex: 'M', description: 'from Sesame Street')
  cat4 = Cat.new(birth_date: '2016/10/15', color: 'gray', name: 'Whiskers', sex: 'F', description: 'jellicle cats')
  cat5 = Cat.new(birth_date: '2015/10/15', color: 'brown', name: 'Fritz', sex: 'F', description: 'rad cat')
  cat6 = Cat.new(birth_date: '2014/10/15', color: 'white', name: 'Jet', sex: 'F', description: 'appears on assessments')

  cat1.save!
  cat2.save!
  cat3.save!
  cat4.save!
  cat5.save!
  cat6.save!

end