# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :user

  enum phone_type: { personal: 'personal', reference: 'reference' }

  validates :number, presence: true
  validates :phone_type, presence: true, inclusion: { in: phone_types.keys }
end
