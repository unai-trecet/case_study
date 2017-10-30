require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "it sets identify attribute with the proper format when a new Employee is created" do
    new_employee = Employee.create(first_name: "Otto", last_name: "Kellerer", company_id: 1)

    assert new_employee.identify
    assert_match /[A-Z]{4}-[A-Z]{4}-[A-Z]{4}/, new_employee.identify
  end

  test "cannot create a Company with the same identify field as an existing one" do
    first_employee = Employee.create(first_name: "First", last_name: "Employee", company_id: 1)
    existing_token = first_employee.identify

    new_employee = Employee.create(first_name: "Second", last_name: "Employee", company_id: 1, identify: existing_token)
    assert_equal false, new_employee.save
  end
end
