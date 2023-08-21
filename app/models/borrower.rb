class Borrower < ApplicationRecord
    has_many :borrowings
    validates :name, presence: true
    validate :valid_contact_info_format
    after_create :insert_borrower

    private

    def insert_borrower
     puts "Borrower Added Successfully!!"     
    end

    def valid_contact_info_format
        return if contact_info.blank?
    
        unless contact_info.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
          errors.add(:contact_info, "is not a valid email format")
        end
    end
end

