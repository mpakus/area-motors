# frozen_string_literal: true

RSpec.describe Web::EnquiriesController do
  let(:enquiry_first) { Enquiry.first }
  let(:enquiry_last) { Enquiry.last }
  let(:enquiry_pending) { Enquiry.pending.first }

  describe 'GET index' do
    before do
      email_import_helper
      get :index
    end

    it { expect(assigns(:enquiries).count).to eq 4 }
    it { expect(assigns(:enquiries)).to include enquiry_first }
    it { expect(assigns(:enquiries)).to include enquiry_last }

    it { expect(response).to render_template :index }
  end

  describe 'GET show' do
    before do
      email_import_helper
      get :show, params: { id: enquiry_first.id }, xhr: true
    end

    it { expect(assigns(:enquiry)).to eq enquiry_first }

    it { expect(response).to render_template :show }
  end

  describe 'GET create' do
    before { post :create }

    it { expect(Enquiry.count).to eq 5 }

    it { expect(response).to redirect_to action: :index }
  end

  describe 'GET update' do
    before do
      email_import_helper
      get :update, params: { id: enquiry_pending.id }, xhr: true
      enquiry_pending.reload
    end

    it { expect(enquiry_pending.done?).to be_truthy }

    it { expect(response).to render_template :update }
  end
end
