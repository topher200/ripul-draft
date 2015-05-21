class DraftController < ApplicationController
  def index
    # We take "M" and "F" as possible genders
    @gender = params[:gender]
    if not @gender
      logger.error "No gender set!"
      @gender = "F"
    end

    user_set_pick_number = NextPickNumber.find_by_gender(@gender)
    if user_set_pick_number != nil
      @next_pick = Pick.get_pick(@gender, user_set_pick_number.number)
    else
      @next_pick = Pick.next_undrafted(@gender)
    end
    logger.error "next pick: #{@next_pick.number}"

    # Did we draft someone? If yes, display that draft pick
    drafted_player_id = params[:player]
    if drafted_player_id
      logger.info "drafting player #{Player.find(drafted_player_id).name} " \
                   "for pick #{@next_pick.number} to team #{@next_pick.team.color}"
      flash[:notice] = "Drafted player #{Player.find(drafted_player_id).name} " \
                       "to #{@next_pick.team.color}"
      player = Player.find(drafted_player_id)
      if player.team == nil
        # Player must not already be on a team
        self.draft_player(player)
      else
        flash[:notice] = "Can't draft #{player.name}; already drafted"
      end
      redirect_to draft_path(:gender => @gender)
    end

    # Which team is draft next?
    if @next_pick != nil
      @information_string = "Drafting #{@next_pick.gender_to_string} " \
                            "##{@next_pick.number} " \
                            "to team #{@next_pick.team.color}"
      @players = Player.undrafted(@next_pick.gender)
    else
      @information_string = "Done drafting!"
      @players = []
    end

    # Are we in admin mode?
    @admin = cookies[:admin]
  end

  def draft_player(player)
    @next_pick.player = player
    @next_pick.save
    player.team = @next_pick.team
    player.save
  end
end
