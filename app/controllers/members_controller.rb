class MembersController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @members = Member.active
  end
end
