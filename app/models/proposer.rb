# frozen_string_literal: true

class Proposer < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy
  has_many :phones, dependent: :destroy

  scope :by_user, ->(user) { where(user: user) }

  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  validates :full_name, :document, :birth_date, presence: true
end
