class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @pool = Pool.new
    @selection = Selection.new
    @invte = Invite.new
    @pools = Pool.all
    @bets = Bet.where(pool_id: @pool.id).count
  end

  def invite
    @invite = Invite.new
    # @invite.users = "users in checkbox"
    invite.message = "This is an invitation"
    @invite.save
    redirect_to root_path
  end

   #def action_name
    #  render :partial => "participants/dynamic"
   #end

  private

  def invite_params
    params.require(:invite).permit(:message)
  end

end
