# frozen_string_literal: true

class Proposer < ApplicationRecord
  belongs_to :user
  has_one :address
  has_many :phones

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  validates :full_name, :document, :birth_date, presence: true
end
