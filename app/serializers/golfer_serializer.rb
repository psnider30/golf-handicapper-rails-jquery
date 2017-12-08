class GolferSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :golfer_index, :course_most_played

  has_many :rounds
end
