require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  test "it sets identify attribute with the proper format when a new Company is created" do
    new_company = Company.create(name: "New Company")

    assert new_company.identify
    assert_match /[A-Z]{4}:[A-Z]{4}/, new_company.identify
  end

  test "cannot create a Company with the same identify field as an existing one" do
    first_company = Company.create(name: "First")
    existing_token = first_company.identify

    new_company = Company.new(name: "First", identify: existing_token)
    assert_equal false, new_company.save
  end
end
