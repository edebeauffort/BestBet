class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @pool = Pool.new
    @selection = Selection.new
  end
end
