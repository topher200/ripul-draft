class DraftController < ApplicationController
  def index
    @next_pick = Pick.next_pick

    drafted_player_id = params[:player]
    if drafted_player_id
      logger.info "drafting player #{Player.find(drafted_player_id).name} " \
                   "for pick #{@next_pick.number} to team #{@next_pick.team.color}"
      flash[:notice] = "Drafted player #{Player.find(drafted_player_id).name} " \
                       "to #{@next_pick.team.color}"
      player = Player.find(drafted_player_id)
      self.draft_player(player)
      redirect_to draft_path
    end

    @next_pick = Pick.next_pick
    @information_string = "Drafting #{@next_pick.gender_to_string} " \
                          "##{@next_pick.number} " \
                          "to team #{@next_pick.team.color}"
    @players = Player.undrafted
  end

  def draft_player(player)
    @next_pick.player = player
    @next_pick.save
    player.team = @next_pick.team
    player.save
  end
end
