require('minitest/autorun')
require('minitest/rg')
require_relative('../owner')

class OwnerSpec < MiniTest::Test

def setup
  @test_owner = Owner.new({'name' => "Test"})
end

def test_get_name
  expected = "Test"
  actual = @test_owner.get_name
  assert_equal(expected,actual)
end



end