class PublicationYearValidator < ActiveModel::Validator
    def validate(record)
      if record.publication_year.present? &&
         (record.publication_year < 1800 || record.publication_year > Date.today.year)
        record.errors.add(:publication_year, "it is not within a valid range")
      end
    end
  end
  