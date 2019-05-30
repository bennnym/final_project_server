# https://richonrails.com/articles/seeding-your-database-with-seed-fu


(0..10).each do |anything|
Employer.seed do |s|
  s.first_name = "Ben"
  s.last_name = "Muller"
  s.email = "ben@ga.co"
  s.company = "Google"
  s.password_digest = "chicken"
end

Student.seed do |a|
  a.first_name = "stu"
  a.last_name = "dent"
  a.email = "stu@dent.co"
  a.university = "general assembly"
  a.gpa = 4.0
  a.profile_photo = "https://i.imgur.com/YTxzqUN.jpg"
  a.cv = "https://github.com/bennnym/employment/raw/master/CV.pdf"
  a.reserve_price = 70000
  a.auction_duration = Time.now + 7.days
  a.password_digest = 'chicken'
end

end