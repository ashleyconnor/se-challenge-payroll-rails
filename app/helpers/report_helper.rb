module ReportHelper
  def self.calculate_pay_period(date)
    if (1..15).include?(date.day)
      [date.beginning_of_month, date.change(day: 15)]
    else
      [date.change(day: 16), date.end_of_month]
    end
  end
end
