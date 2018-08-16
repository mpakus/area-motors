# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :customer
  scope :ordered, -> { order(created_at: :desc) }
end
# == Schema Information
#
# Table name: notes
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint(8)
#
# Indexes
#
#  index_notes_on_customer_id  (customer_id)
#
# rubocop:enable
