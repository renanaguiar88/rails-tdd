describe 'HTTParty' do
  it 'content-type', vcr: {cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body]} do     
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{[1, 2, 3, 4].sample}")
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)    
  end
end
