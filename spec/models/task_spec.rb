require 'rails_helper'

RSpec.describe Task, type: :model do

  describe '#validations' do
    it 'is valid if required fields are present' do
      task = build(:task)
      expect(task).to be_valid
      expect(task.errors).to be_empty
    end

    [
      :title,
    ].each do |field|
      it "is invalid if #{field} is not present" do
        task = build(:task)
        task.send("#{field}=", '')
        expect(task).not_to be_valid
        expect(task.errors).to have_key(field)
      end
    end
  end
end

