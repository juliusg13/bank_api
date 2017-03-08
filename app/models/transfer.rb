class Transfer < ApplicationRecord
  belongs_to :user

  validates :account_number_from, presence: true, length: {minimum: 18, maximum: 18}
  validates :account_number_to, presence: true, length: {minimum: 18, maximum: 18}

  validates :amount_pennies, length: {minimum: 0}
  validates :country_code_from, presence: true, length: {minimum: 3, maximum: 3}
  validates :country_code_to, presence: true, length: {minimum: 3, maximum: 3}
end
