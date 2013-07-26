module TeamsHelper
  def join_team?
    team_id = params[:team_id]?params[:team_id]:params[:id]
    if TeamRelationship.where(:user_id=>current_user.id, :team_id=>team_id).count > 0
       return true
    else
       return false
    end
  end

  def get_user_by_team(team_id)
    @user_ids = TeamRelationship.where(:team_id=>params[:id])
    @users = Array.new
    @user_ids.each do |u|
      @users.push(User.find(u.user_id))
    end
  end

end
