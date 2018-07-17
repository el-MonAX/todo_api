describe User, type: :model do
  context 'check validate' do
    %i[email encrypted_password].each do |field|
      it "validate presense of #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context 'check realations' do
    it 'has many projects' do
      is_expected.to have_many(:projects)
    end
  end
end
