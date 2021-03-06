# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'kawakita@keisuke',
    password: 'kkkkkk',
	)

Genre.create!(
	[
	  {
	  	name: 'food'
	  },
	  {
	  	name: 'music'
	  },
	  {
	  	name: 'sport'
	  },
	  {
	  	name: 'drink'
	  }
	]
	)

Item.create!(
    [
    	{
    		name: 'apple',
    		description: '赤い',
    		price: '60',
    		genre_id: '1'
    	},
    	{
    		name: 'fanta',
    		description: 'ぶどう味',
    		price: '100',
    		genre_id: '4'
    	}
    ]

	)

