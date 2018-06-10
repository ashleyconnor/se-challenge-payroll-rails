require 'csv'

module ReportHelper

  def self.get_report_id(params)
    raw_report_id = `tail -n 1 "#{params[:csv].path}"`
    CSV.parse(raw_report_id)[0][1]
  end

  def self.process_csv(params)
    job_groups = {}
    employees = {}
    report_id = get_report_id(params)

    CSV.foreach(params[:csv].path, headers: true, header_converters: :symbol) do |row|
      job_group = job_groups[row[:job_group]] \
      || job_groups[row[:job_group]] = JobGroup.find_by(code: row[:job_group])

      employee = employees[row[:employee_id]] \
        || employees[row[:employee_id]] = Employee.find_or_create_by(employee_id: row[:employee_id])

      unless row[:date] == "report id"
        ActiveRecord::Base.transaction do
          time_entry = TimeEntry.create!(workday: row[:date], hours_worked: row[:hours_worked],
            employee: employee, job_group: job_group, report_id: report_id)

          period_start, period_end = calculate_pay_period(time_entry.workday)

          payroll_entry = PayrollEntry.find_or_create_by!(employee_id: employee.employee_id,
            pay_period_start: period_start, pay_period_end: period_end)

          payroll_entry.update!(wages: payroll_entry.wages + (time_entry.hours_worked * time_entry.job_group.hourly_wage))
        end
      end
    end
  end

  def self.calculate_pay_period(date)
    if (1..15).include?(date.day)
      [date.beginning_of_month, date.change(day: 15)]
    else
      [date.change(day: 16), date.end_of_month]
    end
  end
end
