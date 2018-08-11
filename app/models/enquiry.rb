# frozen_string_literal: true

class Enquiry < ApplicationRecord
  include ActsAsStateMachine
  include ActsAsSource
end

# == Schema Information
#
# Table name: enquiries
#
#  id         :bigint(8)        not null, primary key
#  addon      :text
#  email      :string
#  error      :jsonb
#  message    :text
#  name       :string
#  source     :string(64)
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_enquiries_on_email   (email)
#  index_enquiries_on_name    (name)
#  index_enquiries_on_source  (source)
#
