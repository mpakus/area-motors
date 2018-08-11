# frozen_string_literal: true

# CarFarSale Emails parser
# @see ./specs/fixtures/carsforsale.html
class Email::Parser::CarsForSale
  extend Comandor

  # @return [Email::Parser::CarsForSale]
  def perform(doc)
    @doc = doc
    name, email = parse_name_email
    {
      name: name,
      email: email,
      message: parse_text,
      source: :cars_for_sale,
      addon: parse_addon
    }
  end

  private

  attr_reader :doc

  # @return [Array<String>]
  def text
    @text ||= doc.at_css('div').text_nodes.map(&:text).map(&:strip).reject(&:blank?)
  end

  # @return [Array<String>]
  def parse_name_email
    match = /([[[:alnum:]]|\s]+)\((.+)\).+/.match(text.first)
    return ['', ''] if match.blank?
    [match[1]&.strip, match[2]&.strip]
  end

  # @return [String]
  def parse_text
    text[text.find_index('He asked:') + 1..-1].join("\n")
  end

  # @return [String]
  def parse_addon
    doc.at_css('table').to_xml
  end
end
