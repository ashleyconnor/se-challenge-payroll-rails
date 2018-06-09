class TimeEntry < ApplicationRecord
  belongs_to :employee
  belongs_to :job_group
end
