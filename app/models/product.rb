# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  pricing            :decimal(10, 2)
#  description        :text
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :user, :pricing
  validates  :pricing, numericality: { greater_than: 0 } #precio debe ser mayor a 0

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100"}, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
