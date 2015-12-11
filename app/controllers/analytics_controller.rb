class AnalyticsController < ApplicationController

def show
  @startdate = Game.first.date
  # @startdate = Date.today - 10.days
  @enddate = Game.last.date
  # @enddate = Date.today - 2.days

end

def update
  @startdate = params[:startdate]
  @enddate   = params[:enddate]
  @theme     = params[:theme]

  redirect_to :back
end

end
