# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Accounts Database
user1 = User.create! :email => 'a@yahoo.com', :password => 'password', :password_confirmation => 'password'

user2 = User.create! :email => 'g@gmail.com', :password => 'password', :password_confirmation => 'password'

user3 = User.create! :email => 'h@hotmail.com', :password => 'password', :password_confirmation => 'password'


#Journals Database
journal1 = Journal.create! :title => "Budhi: A Journal of Ideas and Culture", :global_institutional_price => '55.00', :global_individual_price => '40.00', :local_institutional_price => '950.00', :local_individual_price => '800.00', :global_price_per_issue => '20.00', :local_price_per_issue => '330.00'

journal2 = Journal.create! :title => "Landas: Journal of Loyola School of Theology", :global_institutional_price => '45.00', :global_individual_price => '45.00', :local_institutional_price => '450.00', :local_individual_price => '450.00', :global_price_per_issue => '10.00', :local_price_per_issue => '100.00'

journal3 = Journal.create! :title => "Perspectives in the Arts and Humanities Asia", :global_institutional_price => '70.00', :global_individual_price => '55.00', :local_institutional_price => '1000.00', :local_individual_price => '800.00', :global_price_per_issue => '40.00', :local_price_per_issue => '550.00'

journal4 = Journal.create! :title => "Social Transformations: Journal of the Global South", :global_institutional_price => '60.00', :global_individual_price => '45.00', :local_institutional_price => '800.00', :local_individual_price => '600.00', :global_price_per_issue => '30.00', :local_price_per_issue => '450.00'

