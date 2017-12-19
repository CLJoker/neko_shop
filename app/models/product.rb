class Product < ActiveRecord::Base
  has_many :order_items
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :presence => true
  validates :description, :presence => true
  validates :producer, :presence => true
  validates :image, :presence => true
  validates :price, :presence => true

  def self.search(product)
    where("title ILIKE ? OR producer ILIKE ? ", "%#{product}%", "%#{product}%")
  end
end
