class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.
  end

  private

  def invite_params
    params.require(:invite).permit(:message)
  end
end
