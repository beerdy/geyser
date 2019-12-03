class Image < ApplicationRecord
  belongs_to :product
  has_attached_file :image
  
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end