class Classroom < ActiveRecord::Base
  has_many :students

  def best_student_name
    student = Student.best_student_in_class(self)
    student.name if student.present?
  end

  def size
    number_of_students = self.students.count

    case number_of_students
    when 0..25
      "small"
    when 26..50
      "medium"
    else
      "large"
    end
  end
end
