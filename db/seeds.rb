# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.create!(name: "Framgia",
             phone: "0912489574",
             address: "DN",
             majors: "IT-Software",
             contact_person: "Nguyen Van A",
             company_info: "Framgia Da Nang City",
             logo: "framgia_logo.png",
             banner: "framgia_banner.jpg")
Member.create!(company_id: 1,
            user_id: 1,
            position: "employer"
  )
