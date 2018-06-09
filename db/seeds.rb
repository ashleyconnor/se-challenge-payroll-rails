# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

JobGroup.create(
  [
    {code: "A", hourly_wage: BigDecimal.new("20.00")},
    {code: "B", hourly_wage: BigDecimal.new("30.00")}
  ]
)