require 'pry'

class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        new = Freebie.create(dev_id: Dev.find_by(name: dev).id, company_id: self.id, value: value, item_name: item_name)
        new.save
    end

    def self.oldest_company
        year = Company.all.minimum(:founding_year)
        Company.find_by(founding_year: year)
    end

end
