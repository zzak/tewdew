# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Priority.create(:name=>'Critical', :color => 'red')
Priority.create(:name=>'High', :color => 'orange')
Priority.create(:name=>'Medium', :color => 'yellow')
Priority.create(:name=>'Good', :color => 'green')
Priority.create(:name=>'Low', :color => 'blue')
