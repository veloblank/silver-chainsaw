class PropsController < ApplicationController
  before_action :require_login, only: [:new, :add_prop_to_user_entry]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  layout :choose_layout
  include PropsHelper

  def new
    @prop = Prop.new
  end

  def show
    set_prop
  end

  def create
    board = Board.find_by(name: params[:prop][:board]) || Board.new
    @prop = board.props.new(prop_params) #use belongs_to/has_many association
    sanitize_time(@prop) #work-around for start_time not being the correct day from form
    if @prop.valid?
      @prop.save
      redirect_to prop_path(@prop)
    else
      render :new
    end
  end

  def add_prop_to_user_entry
    if user_selection && user_selection.prop.lock_prop? #must have this conditional to check if a prop is locked if the browser is not refreshed (which locks props)
      flash.now[:danger] = "You cannot make a new pick. Your last pick is still pending."
      redirect_to root_path
    else
      make_selection(pick_params)
      redirect_to root_path
    end
  end

  def index
    if params[:board_id]
      @board = Board.find_by(id: params[:board_id])
      @props = Prop.filter_and_sort_by_date(@board)
    else
      @props = Prop.todays_sorted_props
      if @props.empty?
        flash.now[:danger] = "You must create a new board."
        redirect_to new_board_path
      end
      @board = Board.find_by(id: @props.first.board_id)
    end

    def edit
      set_prop
    end

    def update
      set_prop
      if @prop.update(prop_params)
        redirect_to prop_path(@prop)
      else
        render :edit
      end
    end

    def destroy
      set_prop
      @prop.delete
      redirect_to root_path
    end
  end

  private

  def set_prop
    @prop = Prop.find_by(id: params[:id])
  end

  def prop_params
    params.require(:prop).permit(
      :title, :start_time, :sport, :date, :home_team, :away_team,
      :espn_game_identifier, :board_id, :home_team_won, :away_team_won,
      :scored_by_admin
    )
  end

  def sanitize_time(prop)
    d = prop.date
    t = prop.start_time
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
    prop.date = dt.to_date
    prop.start_time = dt.to_time
  end

  def pick_params
    params.permit(:prop_id, :side)
  end

end
