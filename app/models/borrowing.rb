class Borrowing < ApplicationRecord
  belongs_to :book
  belongs_to :borrower

  validates :return_date, presence: true, if: :returned?
  validates_associated :book, :borrower  

  after_create :insert_borrowing

    private

    def insert_borrowing
     puts "Borrowing Added Successfully!!"     
    end
  
end
