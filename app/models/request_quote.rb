class RequestQuote < ApplicationRecord
 validates :name, :email, :service_name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :name, length: { maximum: 120 }
  validates :service_name, length: { maximum: 120 }

  # Ransack allow-list for ActiveAdmin
  def self.ransackable_attributes(_auth_object = nil)
    %w[id name email service_name message created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    [] # none
  end
end
