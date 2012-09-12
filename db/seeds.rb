# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



admins = [
    {
        :user =>
            {
                :name => 'Sergio Lopez',
                :email => 'wapankh+a@gmail.com',
                :role => 'admin',
            }
    }
].each do |admin|
  if user = User.where(:email => admin[:user][:email]).first
    user.role = "admin"
    user.add_role :admin
    user.password = 'abcd1234' unless user.password
    user.save!
  else
    admin[:user][:password] = 'purex123'
    admin[:user][:password_confirmation] = admin[:user][:password]
    admin[:user][:role] = "admin"
    user = User.create!(admin[:user])
  end
end

appraisers = [
    {
        :user =>
            {
                :name => 'Sergio Lopez',
                :email => 'wapankh+apraiser@gmail.com',
                :role => 'appraiser',
            }
    }
].each do |admin|
  if user = User.where(:email => admin[:user][:email]).first
    user.role = "appraiser"
    user.add_role :appraiser
    user.password = 'abcd1234' unless user.password
    user.save!
  else
    admin[:user][:password] = 'abcd1234'
    admin[:user][:password_confirmation] = admin[:user][:password]
    admin[:user][:role] = "appraiser"
    user = User.create!(admin[:user])
  end

 end