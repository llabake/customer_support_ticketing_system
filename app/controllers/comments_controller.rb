# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    ticket = Ticket.find(params[:ticket_id])

    if (current_user.role.name != 'agent') &&
       !Comment.is_first_commenter_agent?(params[:ticket_id])
      return json_response({ message: 'Please wait for an agent to comment' })
    end

    comment = ticket.comments.create(comment_params
                                         .merge(user_id: current_user.id))
    json_response(comment, :created)
  end

  def comment_params
    params.permit(:content)
  end
end
