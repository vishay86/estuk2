class Book < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, use: :slugged

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/, message: 'Only images allowed'

  has_attached_file :resource
  validates_attachment_content_type :resource, content_type: ['application/pdf'], message: 'Only PDF allowed'

  validates_presence_of :name, :author, :description, :price

  validates_numericality_of :price,
  greater_than: 49, message: 'Must be greater than 50 cents' 


	belongs_to :user
	has_many :sales
end
