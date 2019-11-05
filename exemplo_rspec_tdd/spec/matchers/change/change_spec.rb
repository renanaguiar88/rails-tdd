require 'contador'

describe 'Matcher change' do
  it {expect{Counter.inc}.to change{Counter.count}}
  it {expect{Counter.inc}.to change{Counter.count}.by(1)}
  it {expect{Counter.inc}.to change{Counter.count}.from(2).to(3)}
end