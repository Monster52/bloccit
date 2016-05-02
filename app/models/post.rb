class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :topic
  belongs_to :user

  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { order(title: :asc).unscope(:order) }
  scope :ordered_by_reverse_created_at, -> { order('ceated_at ASC').unscope(:order) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
