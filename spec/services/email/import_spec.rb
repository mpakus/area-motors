# frozen_string_literal: true

RSpec.describe Email::Import do
  # Run with spec/fixtures path and without deleting of files
  subject { described_class.perform(Rails.root.join('spec', 'fixtures'), false) }

  describe 'correct email imports' do
    it { expect(subject.success?).to be_truthy }
    it { expect(subject.errors.count).to eq 0 }
  end

  describe 'correct enquiries data' do
    before { subject }

    it { expect(Enquiry.all.count).to eq 4 }
    # scopes
    it { expect(Enquiry.amdirect.count).to eq 2 }
    it { expect(Enquiry.amdirect).to include Enquiry.amdirect.find_by(status: :email_invalid) }
    it { expect(Enquiry.cars_for_sale.count).to eq 2 }
    it { expect(Enquiry.cars_for_sale).to include Enquiry.cars_for_sale.find_by(status: :email_invalid) }
  end
end
