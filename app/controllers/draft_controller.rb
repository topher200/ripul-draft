class DraftController < ApplicationController
  def index
    if params[:player]
      redirect_to draft_path
    end

    @next_pick = Pick.next_pick
    @information_string = "Drafting #{@next_pick.gender_to_string} " \
                          "##{@next_pick.number} " \
                          "to team #{@next_pick.team.color}"
    @players = Player.undrafted
  end
end
