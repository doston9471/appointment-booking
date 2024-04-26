class CoachesController < ApplicationController
  before_action :set_coach, only: [:show]

  def index
    @coaches = Coach.all
  end

  def show
    @appointments = @coach.appointments.order(start_time: :asc)
  end

  private

  def set_coach
    @coach = Coach.find(params[:id])
  end
end
