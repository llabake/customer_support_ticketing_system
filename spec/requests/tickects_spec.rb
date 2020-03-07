# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  # let!(:tickets) { create_list(:ticket, 10) }
  let!(:ticket) { create(:ticket) }
  # let(:ticket_id) { tickets.first.id }

  describe 'POST /tickets' do
    let(:ticket_attributes) do
      { title: 'Unable to print',
        description: 'I am unable to use the printer on the third floor' }
    end

    context 'when the request is valid' do
      before { post tickets_path, params: ticket_attributes }

      it 'creates a ticket' do
        expect(json['title']).to eq('Unable to print')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post tickets_path, params: { title: 'No internet' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("Validation failed: Description can't be blank")
      end
    end
  end
end
