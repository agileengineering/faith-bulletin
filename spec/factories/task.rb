FactoryGirl.define do
  factory :task do
    sequence :title do |n| "Task #{n}" end
  end
end

