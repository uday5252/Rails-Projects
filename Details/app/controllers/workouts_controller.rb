class WorkoutsController < ApplicationController
before_action :decide_entry_detail, only: :create

def index
  @workouts=Workout.all.order("created_at DESC")
end

def show
  @workout=Workout.find(params[:id])
end

def new
  @workout=Workout.new
end

def create
  @workout=Workout.new(workout_params)
  @workout.date=Date.new(params[:workout]['date(1i)'].to_i, params[:workout]['date(2i)'].to_i, params[:workout]['date(3i)'].to_i)
  if @workout.save
    redirect_to @workout#article show page
  else
    render 'new'#if the form saving fails display the same form again
  end
end

def edit
  @workout = Workout.find(params[:id])
end

def update
  @workout = Workout.find(params[:id])
  if @workout.update(params.require(:workout).permit(:date, :workout, :mood, :length))
    redirect_to @workout#article show page
  else
    render 'edit'
  end
end

def destroy
  @workout = Workout.find(params[:id])
  @workout.destroy
  redirect_to root_path
end

private

def workout_params
  params.require(:workout).permit(:date, :workout, :mood, :length, :entry_details)
end

def decide_entry_detail
  current_date=Date.today
  entered_date=Date.new(params[:workout]['date(1i)'].to_i, params[:workout]['date(2i)'].to_i, params[:workout]['date(3i)'].to_i)

  if entered_date < current_date
    params[:workout][:entry_details]='Late Entry'
  elsif entered_date > current_date
    params[:workout][:entry_details]='Early Entry'
  else
    params[:workout][:entry_details]='On Time'
  end
end
end
