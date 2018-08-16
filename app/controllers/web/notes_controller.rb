# frozen_string_literal: true

class Web::NotesController < Web::ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @customer.notes.create(description: params[:note][:description])
    redirect_to customer_path(@customer), notice: 'Note added'
  end
end
