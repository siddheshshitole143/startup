class About < ApplicationRecord
validates :title, presence: true, length: { maximum: 200 }
  validates :description, :content, presence: true

  # Ransack (required by ActiveAdmin >=/around Ransack 4)
  def self.ransackable_attributes(_ = nil)
    %w[id title description content created_at updated_at]
  end

  def self.ransackable_associations(_ = nil)
    []
  end
end
