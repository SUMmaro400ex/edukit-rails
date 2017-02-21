class UsersController < ApplicationController

  def create
    #TODO: Move this out of the controller and into the User model
    # user = User.new(user_params)
    # if user.save
    #   role_hash = params[:role]
    #   user_profile = UserProfile.new(user_id: user.id, business_entity_id: @user_profile.business_entity_id)
    #   if user_profile.save
    #     UserProfileRoleLink.new(user_profile_id: user_profile.id, role_id: Role.find_by_code(role_hash[:code]).id).save
    #   end
    #   if role_hash[:code] == 'TA'
    #     Contract.create(contract_type_id: ContractType.find_by_code('CR').id, user_profile_id: user_profile.id, rate: params[:rate].gsub('.', '').to_i)
    #   end
    # end
  end

private

  def set_user_profile
    @user_profile = UserProfile.find(params[:user_profile_id])
  end

end
