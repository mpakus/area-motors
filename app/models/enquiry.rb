# frozen_string_literal: true

class Enquiry < ApplicationRecord
  before_save :find_customer_or_create

  include ActsAsStateMachine
  include ActsAsSource

  belongs_to :customer

  private

  def find_customer_or_create
    new_customer = Customer.find_or_create_by(email: enq.email) do |customer|
      customer.name = enq.name
    end
    self.customer_id = new_customer.id
  end
end

# == Schema Information
#
# Table name: enquiries
#
#  id          :bigint(8)        not null, primary key
#  addon       :text
#  email       :string
#  error       :jsonb
#  message     :text
#  name        :string
#  source      :string(64)
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint(8)
#
# Indexes
#
#  index_enquiries_on_customer_id  (customer_id)
#  index_enquiries_on_email        (email)
#  index_enquiries_on_name         (name)
#  index_enquiries_on_source       (source)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
