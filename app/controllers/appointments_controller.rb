class AppointmentsController < ApplicationController
  before_action :find_coach, only: [:new, :create, :slots]

  def slots
    @target = params[:target]
    @available_slots = @coach.available_slots(params[:day])
    respond_to do |format|
      format.turbo_stream
    end
  end

  def new
    @available_days = @coach.available_days
    @available_slots = @coach.available_slots(params[:day])
    @appointment = Appointment.new
  end

  def create
    @appointment = @coach.appointments.build(appointment_params)
    @appointment.end_time = @appointment.start_time + 30.minutes
    if @appointment.save
      redirect_to @coach, notice: 'Appointment reserved successfully.'
    else
      @available_slots = @coach.available_slots(params[:appointment][:day])
      render :new
    end
  end

  private

  def find_coach
    @coach = Coach.find(params[:coach_id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :day)
  end
end
