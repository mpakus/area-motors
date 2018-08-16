# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :notes
end
# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_customers_on_email  (email)
#  index_customers_on_name   (name)
#
# rubocop:enable
