# frozen_string_literal: true

# AMDirect E-mails parser
# @see ./specs/fixtures/amdirect.html
class Email::Parser::AMDirect
  extend Comandor

  # @param doc [Oga::XML::Document]
  # @return [Email::Parser::AMDirect]
  def perform(doc)
    {
      name: doc.at_css('span#name').text&.strip,
      email: doc.at_css('span#email').text&.strip,
      message: format_text_nodes(doc.at_css('div.customer-details').text_nodes),
      source: :amdirect,
      addon: doc.at_css('div.vehicle-details').to_xml
    }
  end

  private

  # @return [String]
  def format_text_nodes(nodes)
    nodes.map(&:text).map(&:strip).reject(&:blank?).join("\n")
  end
end
