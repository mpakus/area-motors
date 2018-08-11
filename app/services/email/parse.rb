# frozen_string_literal: true

# Parse, transform and validate given E-mail text
class Email::Parse
  extend Comandor

  # Standard Error for incorrect E-mail Parser
  class NotFound < StandardError; end

  # Parse E-mail text, transform to Hash structure and soft validate it
  def perform(text)
    @text = text
    validate!(parser.result)
  end

  private

  PARSERS = %i[am_direct cars_for_sale].freeze
  attr_reader :text

  # Parse E-mail text with specific Parser
  def parser
    PARSERS.each do |parser_method|
      parser = send(parser_method)
      return parser.perform(doc) if parser.present?
    end
    raise NotFound
  end

  # @return [Email::Parser::AMDirect, nil]
  def am_direct
    text =~ /AM\-Direct/i ? Email::Parser::AMDirect : nil
  end

  # @return [Email::Parser::CarsForSale, nil]
  def cars_for_sale
    text =~ /CarsForSale/i ? Email::Parser::CarsForSale : nil
  end

  # @return [Oga::XML::Document]
  def doc
    @doc ||= ::Oga.parse_html(text)
  end

  # Soft Validatation for E-mail structure
  #
  # @param  data [Hash] E-mail parsed structure
  # @return [Hash]
  def validate!(data)
    error(:name, :not_found) if data[:name].blank?
    error(:email, :invalid) unless EmailAddress.valid? data[:email]
    error(:message, :not_found) if data[:message].blank?
    data
  end
end
