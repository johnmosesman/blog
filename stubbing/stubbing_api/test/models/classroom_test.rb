require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  def test_best_student
    populated_classroom = classrooms(:one)
    empty_classroom = classrooms(:two)

    Student.stubs(:best_student_in_class).with(populated_classroom).returns(stub(name: "jimmy"))
    Student.stubs(:best_student_in_class).with(empty_classroom).returns(nil)

    assert_equal "jimmy", populated_classroom.best_student_name
    assert_equal nil, empty_classroom.best_student_name
  end

  def test_size
    classroom = classrooms(:one)

    classroom.stubs(:students).returns([1,2])
    assert_equal "small", classroom.size

    classroom.stubs(:students).returns(stub(count: 40))
    assert_equal "medium", classroom.size

    classroom.stubs(:students).returns(stub(count: 100))
    assert_equal "large", classroom.size
  end
end
