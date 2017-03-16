class Transfer < ApplicationRecord
  belongs_to :user

  validates :account_number_from, presence: true, length: {minimum: 18, maximum: 18}
  validates :account_number_to, presence: true, length: {minimum: 18, maximum: 18}

  validates :amount_pennies, length: {minimum: 0}, allow_nil: true
  validates :country_code_from, presence: true, length: {minimum: 3, maximum: 3}, if: :is_sending_country_valid?
  validates :country_code_to, presence: true, length: {minimum: 3, maximum: 3}, if: :is_receiver_country_valid?
end

def is_sending_country_valid?
  begin
    if IsoCountryCodes.find(self.country_code_from)
      return true
    end
  rescue
    return false
  end
end

def is_receiver_country_valid?

  begin
    if IsoCountryCodes.find(self.country_code_to)
      return true
    end
  rescue
    return false
  end

end
