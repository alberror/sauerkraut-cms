puts "Destroy Users"
User.destroy_all

@admin = User.new(
  email: "antoine@hellomother.io",
  first_name: "Antoine",
  last_name: "Duvauchelle",
  password: "Mc:Fenl3a84",
  role: "admin"
)

@admin.save
puts "Admin created"