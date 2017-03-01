class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @pool = Pool.new
    @selection = Selection.new
    @invte = Invite.new
    @pools = Pool.all
  end

  def invite
    @invite = Invite.new
    # @invite.users = "users in checkbox"
    invite.message = "This is an invitation"
    @invite.save
    redirect_to root_path
  end


end
