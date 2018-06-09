class ReportController < ApplicationController

  def index
    # generate global report
    render "index"
  end

  def new
    # show form for report uploading
    render "new"
  end

  def create
    # insert time entries and redirect to report
  end

  def show
    # show individual report by id
    render "show"
  end

  private
    # strong parameters
    def time_entry_params
      params.require(:time_entries).permit(:csv)
    end
end
