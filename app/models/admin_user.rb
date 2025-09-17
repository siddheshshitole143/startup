class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#         :recoverable, :rememberable, :validatable

devise :database_authenticatable, :recoverable, :rememberable, :validatable
  # add other devise modules you use

  # Only expose safe fields to Ransack (for filters/search in ActiveAdmin)
  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at] # add more non-sensitive columns if needed
  end

  # If AdminUser has associations you want to filter by, list them here
  def self.ransackable_associations(auth_object = nil)
    [] # e.g., %w[roles organization]
  end

end
