class Service < ApplicationRecord
 validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true
  validates :icon_style, inclusion: { in: %w[fas far fab], message: "must be fas, far, or fab" }
  validates :icon_name, presence: true

  # Ransack allowlist for ActiveAdmin filters
  def self.ransackable_attributes(_ = nil)
    %w[id title description icon_style icon_name created_at updated_at]
  end

  def self.ransackable_associations(_ = nil)
    []
  end
end
