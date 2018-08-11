# frozen_string_literal: true

RSpec.describe Email::Parse do
  let(:result) { subject.result }

  context 'with AMDirect' do
    describe 'correct email parsing' do
      subject { described_class.perform(amdirect_email_helper) }

      it { expect(subject.success?).to be_truthy }
      it { expect(subject.result[:source]).to eq :amdirect }
      it { expect(result).to be_a_mail_representation }
    end

    # This will works for Empty and WRONG E-mails
    describe 'email is invalid' do
      subject { described_class.perform(amdirect_email_wrong_helper) }

      it { expect(subject.success?).to be_falsey }
      it { expect(result).to be_a_mail_representation }
      it { expect(subject.errors[:email].count).to eq 1 }
      it { expect(subject.errors[:email]).to include :invalid }
    end
  end

  context 'with CarsForSale' do
    describe 'correct email parsing' do
      subject { described_class.perform(cars_for_sale_email_helper) }

      it { expect(subject.success?).to be_truthy }
      it { expect(subject.result[:source]).to eq :cars_for_sale }
      it { expect(result).to be_a_mail_representation }
    end

    # This will works for Empty and WRONG E-mails
    describe 'email is invalid' do
      subject { described_class.perform(cars_for_sale_email_wrong_helper) }

      it { expect(subject.success?).to be_falsey }
      it { expect(result).to be_a_mail_representation }
      it { expect(subject.errors[:email].count).to eq 1 }
      it { expect(subject.errors[:email]).to include :invalid }
    end
  end
end
