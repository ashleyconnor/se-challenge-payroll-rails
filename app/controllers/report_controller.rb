class ReportController < ApplicationController

  def index
    @payroll_entries = PayrollEntry.all
    render "index"
  end

  def new
    render "new"
  end

  def create
    report_id = ReportHelper.get_report_id(time_entry_params)

    if TimeEntry.where(report_id: report_id).exists?
      flash.now[:danger] = "Failed to process Timesheet (duplicate report id)"
      render "new"
    else
      ReportHelper.process_csv(time_entry_params)
      redirect_to report_path
    end
  end

  private
    # strong parameters
    def time_entry_params
      params.require(:time_entries).permit(:csv)
    end
end
