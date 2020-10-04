require_relative "../french_ssn"

describe "#french_ssn_info" do
  it "returns 'The number is invalid' when passed 123" do
    expected = 'The number is invalid'
    actual = french_ssn_info("123")
    expect(actual).to eq(expected)
  end
  it "returns 'a man, born in December, 1984 in Seine-Maritime.' when passed '1 84 12 76 451 089 46'" do
    expected = 'a man, born in December, 1984 in Seine-Maritime.'
    actual = french_ssn_info('1 84 12 76 451 089 46')
    expect(actual).to eq(expected)
  end
  it "returns 'The number is invalid' when passed '2 84 12 76 451 089 46'" do
    expected = 'The number is invalid'
    actual = french_ssn_info('2 84 12 76 451 089 46')
    expect(actual).to eq(expected)
  end
end
