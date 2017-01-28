require 'rails_helper'

describe Comment do
  describe 'association' do
    it 'is associated with a prototype' do
      prototype = create(:prototype)
      comment = create(:comment, prototype: prototype)
      expect(comment.prototype).to eq prototype
    end

    it 'is associated with a user' do
    end
  end
end
