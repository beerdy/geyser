class Content < ApplicationRecord
  has_attached_file :asset
  
  has_attached_file :asset, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset, :content_type => [/\Aimage\/.*\z/,"application/pdf","application/vnd.ms-excel",     
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
    "text/plain"]
end
