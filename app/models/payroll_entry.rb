class PayrollEntry < ApplicationRecord
  default_scope { order(employee_id: :asc, pay_period_start: :asc) }
end
