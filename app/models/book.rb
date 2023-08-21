require_relative 'validates'
class Book < ApplicationRecord

  has_many :borrowings

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true, greater_than: 0000 }
  validates_with PublicationYearValidator 
  after_create :insert_book
  around_create :insert_book2

     private

     def insert_book
      puts "Book Added Successfully!!"     
     end
     def insert_book2
      yield
      puts "Around create Added Successfully!!"     
     end
end
