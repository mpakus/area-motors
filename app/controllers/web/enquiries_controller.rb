# frozen_string_literal: true

class Web::EnquiriesController < Web::ApplicationController
  before_action :enquiry, only: %i[update show]

  # List of Enquiries
  def index
    Feature.load(Rails.root.join('config', 'features.yml'), Rails.env)
    @enquiries = Enquiries::Filter.perform(params).result
  end

  # Fetch new Enquiries from ./emails folder
  def create
    import = Email::Import.perform('emails', false)
    if import.success?
      flash[:notice] = 'E-mails successfully Imported'
    else
      flash[:alert] = 'E-mails successfully Imported with few Errors'
    end
    redirect_to enquiries_path
  end

  # Update status of Enquiry to -> done
  def update
    @enquiry.done!
  end

  # Show full information about Enquiry
  def show; end

  private

  def enquiry
    @enquiry = Enquiry.find(params[:id])
  end
end
