# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments' do
  let!(:user) { create(:user) }
  # let!(:agent) { create(:user, :agent)}
  let!(:ticket) { create(:ticket, user: user) }
  let!(:comment) { attributes_for(:comment, ticket: ticket, user: user) }
  # let!(:agent_comment) { attributes_for(:comment, ticket: ticket, user: agent )}
  let(:headers) { valid_headers }

  describe 'POST /comments' do
    context 'when the request is valid' do
      before do
        post ticket_comments_path(ticket),
             params: comment.to_json,
             headers: headers
      end
      context 'but an agent is yet to comment on the ticket' do
        it 'return a message that the user should wait' do
          expect(response).to have_http_status(200)
          expect(response.body).to match('Please wait for an agent to comment')
        end
      end

      context 'and an agent has commented comment on the ticket' do
        # before do
        #   post ticket_comments_path(ticket),
        #        params: agent_comment.to_json,
        #        headers: headers
        # end
        # it 'successfully creates the comment' do
        #   post ticket_comments_path(ticket), params: comment.to_json, headers: headers
        #   expect(response).to have_http_status(201)
        #   binding.pry
        #   expect(response.body).to match("Please wait for an agent to comment")
        # end
      end

      # xit 'succeeds in creating  a comment for an agent' do
      #   expect(response).to have_http_status(200)
      #   expect(response.body).to match("Please wait for an agent to comment")
      # end
    end
  end
end
