# frozen_string_literal: true

module EmailsHelpers
  def amdirect_email_helper
    read_email 'amdirect'
  end

  def amdirect_email_wrong_helper
    read_email 'amdirect-email-wrong'
  end

  def cars_for_sale_email_helper
    read_email 'carsforsale'
  end

  def cars_for_sale_email_wrong_helper
    read_email 'carsforsale-email-wrong'
  end

  def email_import_helper
    Email::Import.perform(Rails.root.join('spec', 'fixtures'), false)
  end

  private

  def read_email(file_name)
    File.read(Rails.root.join('spec', 'fixtures', file_name + '.html'))
  end
end
