# frozen_string_literal: true

RSpec.describe Enquiry, type: :model do
  let(:amdirect) { Enquiry.amdirect.last }
  let(:cars_for_sale) { Enquiry.cars_for_sale.first }
  let(:wrong_enquiry) { Enquiry.new(source: :something_wrong) }

  before { Enquiry.create! [{ source: :amdirect }, { source: :amdirect }, { source: :cars_for_sale }] }

  context 'with ActsAsSource concern' do
    describe '.amdirect' do
      it { expect(Enquiry.amdirect.count).to eq 2 }
    end

    describe '.cars_for_sale' do
      it { expect(Enquiry.cars_for_sale.count).to eq 1 }
    end

    describe '#amdirect?' do
      it { expect(amdirect.amdirect?).to be_truthy }
      it { expect(cars_for_sale.amdirect?).to be_falsey }
    end

    describe '#cars_for_sale?' do
      it { expect(amdirect.cars_for_sale?).to be_falsey }
      it { expect(cars_for_sale.cars_for_sale?).to be_truthy }
    end

    describe '#valid?' do
      it { expect(amdirect.valid?).to be_truthy }
      it { expect(cars_for_sale.valid?).to be_truthy }
      it { expect(wrong_enquiry.valid?).to be_falsey }
    end
  end
end
