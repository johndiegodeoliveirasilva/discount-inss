# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :proposer

  validates :zip_code, :state, :city, :neighborhood, :number, :complement, presence: true
end
