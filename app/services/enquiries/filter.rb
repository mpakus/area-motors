# frozen_string_literal: true

# Collect Enquiries from repository: pagination, filter, search, order etc...
class Enquiries::Filter
  extend Comandor

  def perform(params)
    @params = params
    rep = Enquiry
    rep = rep.select(:id, :name, :email, :message, :created_at, :status, :source)
    rep = rep.order(id: :desc)
    rep = rep.page(params[:page]).per(15)
    rep = rep.where(name: params[:name]) if params[:name].present?
    rep = rep.where(email: params[:email]) if params[:email].present?
    rep
  end

  private

  attr_reader :params
end
