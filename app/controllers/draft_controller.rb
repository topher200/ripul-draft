class DraftController < ApplicationController
  def index
    @next_pick = Pick.next_pick

    drafted_player_id = params[:player]
    if drafted_player_id
      logger.debug "drafting player #{Player.find(drafted_player_id).name}"
      @next_pick.player = Player.find(drafted_player_id)
      @next_pick.save
      redirect_to draft_path
    end

    @next_pick = Pick.next_pick
    @information_string = "Drafting #{@next_pick.gender_to_string} " \
                          "##{@next_pick.number} " \
                          "to team #{@next_pick.team.color}"
    @players = Player.undrafted
  end
end
