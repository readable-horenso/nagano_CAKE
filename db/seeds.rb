# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者アカウント
Admin.create!(
	          email: "admin@gmail.com",
	          password: "121212",
	          password_confirmation: "121212")
	          
#顧客アカウント
Customer.create!(
                 [
                  { family_name: "ながの",
                    given_name: "に",
                    family_name_kana: "ナガノ",
                    given_name_kana: "ニ",
                    postcode: "1111111",
                    address: "東京都渋谷区渋谷町0-1",
                    phone_number: "111111111",
                    email: "bbb@gmail.com",
                    password: "111222",
    	            password_confirmation: "111222",
                  },
                  
                  { family_name: "ながの",
                    given_name: "さん",
                    family_name_kana: "ナガノ",
                    given_name_kana: "サン",
                    postcode: "2222222",
                    address: "東京都渋谷区渋谷町0-2",
                    phone_number: "222222222",
                    email: "ccc@gmail.com",
                    password: "333444",
    	            password_confirmation: "333444",
                  },
              
                  { family_name: "ながの",
                    given_name: "よん",
                    family_name_kana: "ナガノ",
                    given_name_kana: "ヨン",
                    postcode: "3333333",
                    address: "東京都渋谷区渋谷町0-3",
                    phone_number: "333333333",
                    email: "ddd@gmail.com",
                    password: "555666",
    	            password_confirmation: "555666",
                  }
    	         ]
    	        )