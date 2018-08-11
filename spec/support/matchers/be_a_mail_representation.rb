# frozen_string_literal: true

RSpec::Matchers.define :be_a_mail_representation do
  match do |entry|
    attrs = %i[name email source message addon]

    expect(entry).to be
    expect(entry.keys).to match_array(attrs)
  end
end
