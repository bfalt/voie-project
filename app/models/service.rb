class Service < ApplicationRecord

  def self.formatted_selection
    # [["TEXT", "ID"]]
    Service.all.map { |service| [service.category, service.id] }
  end
end
