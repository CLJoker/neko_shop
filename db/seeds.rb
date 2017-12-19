User.destroy_all
Account.destroy_all

user = User.new(email: 'user@user.com', password: '111111')
user.save
Account.create(:user_id => user.id)

user = User.new(email: 'admin@admin.com', password: '111111', admin: true)
user.save
Account.create(:user_id => user.id)

# Product.create({
#   :id => 52,
#   :product_image => Product.new("#{Rails.root}/path/to/somefile.jpg"),
#   :product_id => 52
# })
