require 'slugify'
puts "Destroy Comments"
Comment.destroy_all
puts "Destroy Articles"
Post.destroy_all
puts "Destroy Members"
Member.destroy_all
puts "Destroy Users"
User.destroy_all

def get_image(type)
  Dir[File.join(File.dirname(__FILE__), "../app/assets/images/#{type}/*")]
end

@admin = User.new(
  email: "antoine@hellomother.io",
  first_name: "Antoine",
  last_name: "Duvauchelle",
  password: "Mc:Fenl3a84",
  role: "admin"
)

@admin.save
puts "Admin created"

antoine = Member.new(
  first_name: "Antoine",
  last_name: "Duvauchelle",
  email: "antoine@duvauchelle.co",
  phone: "+33646635877",
  status: "active"
)

antoine.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Antoine Duvauchelle.jpeg")].first), filename: "Antoine Duvauchelle.jpg")

antoine.save!

alexandre = Member.new(
  first_name: "Alexandre",
  last_name: "Valeanu",
  status: "active"
)

alexandre.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Alexandre Valeanu.jpeg")].first), filename: "Alexandre Valeanu.jpg")

alexandre.save!

alyse = Member.new(
  first_name: "Alyse",
  last_name: "Zajackowski",
  status: "active"
)

alyse.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Alyse Zajackowski.jpeg")].first), filename: "Alyse Zajackowski.jpg")

alyse.save!

aurelie = Member.new(
  first_name: "Aurélie",
  last_name: "Galaup",
  status: "active"
)

aurelie.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Aurélie Galaup.jpeg")].first), filename: "Aurélie Galaup.jpg")

aurelie.save!

camille = Member.new(
  first_name: "Camille",
  last_name: "Vassilopoulos",
  status: "active"
)

camille.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Camille Vassilopoulos.jpeg")].first), filename: "Camille Vassilopoulos.jpg")

camille.save!

catarina = Member.new(
  first_name: "Catarina",
  last_name: "Lopez",
  status: "active"
)

catarina.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Catarina Lopez.jpeg")].first), filename: "Catarina Lopez.jpg")

catarina.save!

gaelle = Member.new(
  first_name: "Gaëlle",
  last_name: "Bohé",
  status: "inactive"
)

gaelle.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Gaëlle Bohé.jpeg")].first), filename: "Gaëlle Bohé.jpg")

gaelle.save!

laure = Member.new(
  first_name: "Laure",
  last_name: "Bathelier",
  status: "active"
)

laure.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Laure Bathelier.jpeg")].first), filename: "Laure Bathelier.jpg")

laure.save!

marie = Member.new(
  first_name: "Marie",
  last_name: "Thumerelle",
  status: "active"
)

marie.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Marie Thumerelle.jpeg")].first), filename: "Marie Thumerelle.jpg")

marie.save!

nathalie = Member.new(
  first_name: "Nathalie",
  last_name: "Grand",
  status: "active"
)

nathalie.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Nathalie Grand.jpeg")].first), filename: "Nathalie Grand.jpg")

nathalie.save!

severine = Member.new(
  first_name: "Séverine",
  last_name: "Bellina",
  status: "active"
)

severine.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Séverine Bellina.jpeg")].first), filename: "Séverine Bellina.jpg")

severine.save!

sophie = Member.new(
  first_name: "Sophie",
  last_name: "Anfosso-Torlotin",
  status: "active"
)

sophie.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Sophie Anfosso-Torlotin.jpeg")].first), filename: "Sophie Anfosso-Torlotin.jpg")

sophie.save!

stephanie = Member.new(
  first_name: "Stéphanie",
  last_name: "Grujic",
  status: "active"
)

stephanie.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Stéphanie Grujic.jpeg")].first), filename: "Stéphanie Grujic.jpg")

stephanie.save!

victor = Member.new(
  first_name: "Victor",
  last_name: "Holl",
  status: "inactive"
)

victor.picture.attach(io: File.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/members/Victor Holl.jpeg")].first), filename: "Victor Holl.jpg")

victor.save!

# 30.times do |i|
#   user = User.new(
#     first_name: Faker::Name.first, filename: ".jpg"_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     address: Faker::Address.street_address,
#     address_details: [Faker::Address.street_address, ""].sample,
#     zipcode: Faker::Address.zip_code,
#     city: Faker::Address.city,
#     country: Faker::Address.country,
#     phone: Faker::PhoneNumber.phone_number,
#     password: 'mpxUSER1!',
#     role: "user",
#     status: ["active", "inactive"].sample
#   )

#   user.save!
#   puts "User #{i + 1} created"
#   puts '------------------'
# end

# 40.times do |i|
#   member = Member.new(
#     first_name: Faker::Name.first, filename: ".jpg"_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     phone: Faker::PhoneNumber.phone_number,
#     status: ["active", "inactive"].sample
#   )

#   member.picture.attach(io: File.open(get_image("avatars").sample), filename: 'file.jpg')

#   member.save!

#   puts "Member #{i + 1} created"
#   puts '------------------'
# end

# 30.times do |i|
#   title = Faker::Game.title
#   post = Post.new(
#     user: User.where(role: "admin").sample,
#     title: title,
#     summary: "Summary Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
#     body: "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p><ul><li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.</p>",
#     status: Post::STATUSES.sample,
#     slug: title.slugify,
#     created_at: ((Date.today - 200)..Date.today).to_a.sample
#   )

#   post.thumbnail.attach(io: File.open(get_image("posts").sample), filename: 'file.jpg')

#   post.save!

#   (1..1000).to_a.sample.times do
#     PostDatum.create(post: post, datum_type: "view", created_at: (post.created_at.to_date..Date.today).to_a.sample)
#   end
#   puts "Post #{i + 1} created"
#   puts '------------------'
# end

# 160.times do |i|
#   post = Post.where(status: "published").sample
#   comment = Comment.new(
#     post: post,
#     author: Faker::Name.first, filename: ".jpg"_name,
#     email: Faker::Internet.email,
#     status: Comment::STATUSES.sample,
#     body: Faker::Movies::HarryPotter.quote,
#     created_at: ((post.created_at.to_date)..Date.today).to_a.sample
#   )

#   comment.save!

#   (1..1000).to_a.sample.times do
#     CommentDatum.create(comment: comment, datum_type: ["upvote", "downvote"].sample, created_at: (comment.created_at.to_date..Date.today).to_a.sample)
#   end
#   puts "Comment #{i + 1} on post #{post.title} created"
#   puts '------------------'
# end
