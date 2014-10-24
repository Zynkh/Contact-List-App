class Contact < ActiveRecord::Base
  validates :first_name, presence: true, length: { minimum: 1 }
end