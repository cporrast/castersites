class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    @user = User.new
    # @organization = Organization.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @organization = Organization.create(organization_params)
      Membership.create(user: @user, organization: @organization)

      start_new_session_for @user
      redirect_to after_authentication_url
    else
      redirect_to new_user_path, alert: "Error creating your user"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
