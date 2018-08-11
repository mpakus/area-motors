# frozen_string_literal: true

# Read Emails from directory and create customers Enquiries
class Email::Import
  extend Comandor

  def perform(dir = 'emails', delete_files = false)
    @delete_files = delete_files
    Dir[Rails.root.join(dir, '*.html')].each { |file_name| read_parse_create(file_name) }
  end

  private

  attr_reader :delete_files

  # Read, Parse and create customers Enquiry
  def read_parse_create(file_name)
    enquiry = create_enquiry(parse_file(file_name))
    delete_file(file_name)
    enquiry
  rescue Email::Parse::NotFound => _e
    msg = "Email::Import can't find parser for #{file_name}"
    Rails.logger.error(msg) # and|or use Rollbar, Airbrake etc
    error(:parser, msg)
  rescue StandardError => e
    Rails.logger.error(e.message)
    error(:import, e.message)
  end

  # @return [Email::Parse]
  def parse_file(file_name)
    Email::Parse.perform(File.read(file_name))
  end

  # Create customers Enquiry record with correct status
  #
  # @param parse [Email::Parse]
  # @return [Enquiry]
  def create_enquiry(parse)
    email = parse.result
    enquiry = Enquiry.create!(email.merge(error: parse.errors))
    enquiry.email_invalid! if parse.errors[:email]&.include?(:invalid)
    enquiry
  end

  # Delete imported file
  #
  # @param file_name [String]
  def delete_file(file_name)
    File.delete(file_name) if delete_files
  end
end
