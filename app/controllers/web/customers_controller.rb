# frozen_string_literal: true

class Web::CustomersController < Web::ApplicationController
  # Show list of Customers
  def index
    @customers = Customer.page(params[:page]).per(15)
  end

  # Show specific customer
  def show
    @customer = Customer.find params[:id]
    @note = Note.new
  end
end
