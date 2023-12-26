# frozen_string_literal: true

class Category < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Associations
  has_many :products, dependent: :nullify

  # Callbacks
  before_save :normalize_name

  # Scopes
  scope :with_most_products, lambda {
    joins(:products).group('categories.id').order('count(products.id) DESC')
  }

  # Instance Methods
  def formatted_name
    name.titleize
  end

  # Class Methods
  def self.search_by_name(search_term)
    where('name ILIKE ?', "%#{search_term}%")
  end

  private

  def normalize_name
    self.name = name.downcase.strip
  end
end
