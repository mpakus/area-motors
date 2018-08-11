# frozen_string_literal: true

# Make model act as State Machine with 3 states [pending, done, invalid]
module ActsAsStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status, no_direct_assignment: true do
      state :pending, initial: true
      state :done
      state :email_invalid

      event :done do
        transitions from: :pending, to: :done
      end

      event :email_invalid do
        transitions from: :pending, to: :email_invalid
      end
    end
  end
end
