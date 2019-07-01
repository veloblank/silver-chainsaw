module PropsHelper

  def make_selection(params)
    prop = Prop.find_by(params[:q])
    side = params[:side]
    user = current_user
    pick = UserPick.create(prop_id: prop.id, side: side, user_id: current_user.id)
    binding.pry
  end
end
