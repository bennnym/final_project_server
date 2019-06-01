Student.destroy_all
Employer.destroy_all

20.times do  
  emploer = Employer.create :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :company => Faker::Company.name, :password => 'chicken', :password_confirmation => 'chicken'

end

30.times do 
  student = Student.create :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :university => Faker::Company.name, :gpa => rand(0.0..4.0).round(2), :profile_photo => Faker::LoremFlickr.image("#{rand(100..500)}x#{rand(100..500)}", ['profilephoto']), :cv => Faker::LoremFlickr.image("#{rand(100..500)}x#{rand(100..500)}", ['profilephoto']), :reserve_price => rand(20000..150000), :auction_duration => Time.now+rand(1000000), :password => 'chicken', :password_confirmation => 'chicken'
  end
