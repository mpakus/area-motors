# frozen_string_literal: true

# Make any model to act as .source with 2 options amdirect and cars_for_sale
module ActsAsSource
  extend ActiveSupport::Concern

  included do
    SOURCES = { amdirect: 'AMDirect', cars_for_sale: 'CarsForSale' }.freeze

    validates :source, inclusion: { in: SOURCES.keys.map(&:to_s) }

    SOURCES.keys.each do |type|
      define_method("#{type}?") { source == type.to_s }
      scope type, -> { where(source: type) }
    end
  end
end
