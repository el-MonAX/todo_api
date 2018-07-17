describe SessionsController, type: :request do
  let!(:user) { create(:user) }

  context 'successful sign in' do
    before { post user_session_path, params: { user: { email: user.email, password: '123456' } } }

    it 'sends user id' do
      expect(json['user_id']).not_to be_nil
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
