require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { expect(subject).to validate_presence_of :text }
  it { expect(subject).to belong_to(:task) }
end
