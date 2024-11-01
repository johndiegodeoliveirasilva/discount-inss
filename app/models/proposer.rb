# frozen_string_literal: true

class Proposer < ApplicationRecord
  belongs_to :user
  has_one :address
  has_many :phones

  validates :full_name, :document, :birth_date, :income, presence: true
end
