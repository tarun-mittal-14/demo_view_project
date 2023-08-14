class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :user_id, uniqueness: {scope: :job_id}
  validates :status, presence: true

  enum status: { approved: 'approved', rejected: 'REJECTED', applied: 'APPLIED'}
end
