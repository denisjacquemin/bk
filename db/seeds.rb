# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


Language.create(:name => 'Francais')
Language.create(:name => 'Neerlandais')
Language.create(:name => 'Anglais')

Sex.create(:name => 'Homme')
Sex.create(:name => 'Femme')

Nationality.create(:name => 'Belge')
Nationality.create(:name => 'Neerlandais')
Nationality.create(:name => 'Luxembourgeois')
Nationality.create(:name => 'Francais')
Nationality.create(:name => 'Allemand')

Title.create(:name => 'Monsieur')
Title.create(:name => 'Madame')
Title.create(:name => 'Mademoiselle')
Title.create(:name => 'Maitre')
Title.create(:name => 'Docteur')

Country.create(:name => 'Belgique', :code => 'be')
Country.create(:name => 'France', :code => 'fr')
Country.create(:name => 'Pays-bas', :code => 'nl')
Country.create(:name => 'Luxembourg', :code => 'lu')
Country.create(:name => 'Allemagne', :code => 'de')

Tva.create(:value => 6, :sort => '1')
Tva.create(:value => 21, :sort => '2')

Status.create(:name => 'assur.status.sent', :active => 1, :sort => 1 )
Status.create(:name => 'assur.status.paid', :active => 1, :sort => 2 )
Status.create(:name => 'assur.status.late', :active => 1, :sort => 3 )



