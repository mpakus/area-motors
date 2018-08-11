# frozen_string_literal: true

class Web::EnquiriesController < Web::ApplicationController
  # List of Enquiries
  def index
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
    @enquiry = Enquiry.find(params[:id])
    @enquiry.done!
  end

  # Show full information about Enquiry
  def show; end
end
