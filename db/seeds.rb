puts "Destroy Purchases"
Purchase.destroy_all
puts "Destroy Orders"
Order.destroy_all
puts "Destroy Items"
Item.destroy_all
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

30.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.street_address,
    address_details: [Faker::Address.street_address, ""].sample,
    zipcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    password: 'mpxUSER1!',
    role: "user"
  )

  user.save
  puts "User #{i + 1} created"
  puts '------------------'
end

60.times do |i|
  item = Item.new(
    name: Faker::Game.unique.title,
    summary: "Summary Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p><ul><li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.",
    body: "<p>Specs Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p><ul><li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.</li><li>Praesent dapibus, <a href=\"https://www.google.fr\">neque id cursus faucibus</a>, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</li><li>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</li><li>Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.</li></ul>",
    status: Item::STATUSES.sample,
    stock: (1..100).to_a.sample
  )

  item.thumbnail.attach(io: File.open(get_image("items").sample), filename: 'file.jpg')

  item.save
  puts "Item #{i + 1} created"
  puts '------------------'
end

50.times do |i|
  order = Order.new(
    user: User.all.sample,
    status: Order::STATUSES.sample,
  )

  order.save
  puts "Order #{i + 1} created"
  puts '------------------'
end

110.times do |i|
  item = Item.where(status: "published").sample
  purchase = Purchase.new(
    item: item,
    stock: (1..item.stock).to_a.sample,
    order: Order.all.sample
  )

  purchase.save
  puts "Purchase #{i + 1} created"
  puts '------------------'
end

30.times do |i|
  post = Post.new(
    user: User.where(status: "admin").sample,
    title: Faker::Game.title,
    summary: "Summary Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
    body: "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p><ul><li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.</li><li>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</li><li>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</li><li>Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.</li></ul>",
    status: Post::STATUSES.sample
  )

  post.thumbnail.attach(io: File.open(get_image("posts").sample), filename: 'file.jpg')

  post.save
  puts "Post #{i + 1} created"
  puts '------------------'
end
