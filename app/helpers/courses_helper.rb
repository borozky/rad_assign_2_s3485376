module CoursesHelper
	def course_editable?(course)
		course.created_by.id == current_user.id
	end
end
