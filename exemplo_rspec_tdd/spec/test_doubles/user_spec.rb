describe 'Test Double' do
  it '--' do
    user = double('User')
  #  allow(user).to receive_messages(name: 'Ruby', password: 'secret')    
    allow(user).to receive(:name).and_return('Ruby')
    allow(user).to receive(:password).and_return('secret')    
    puts user.name
    puts user.password
  end
end