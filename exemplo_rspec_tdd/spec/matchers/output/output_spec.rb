describe 'Matcher output' do
  it {expect{puts "Ruby"}.to output.to_stdout}
  it {expect{print "Ruby"}.to output("Ruby").to_stdout}
  it {expect{puts "Ruby on Rails"}.to output(/Ruby/).to_stdout}

  it {expect{warn "Ruby"}.to output.to_stderr}
  it {expect{warn "Ruby"}.to output("Ruby\n").to_stderr}
  it {expect{warn "Ruby on Rails"}.to output(/Ruby/).to_stderr}
end