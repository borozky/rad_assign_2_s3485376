module CoursesHelper
	def course_editable?(course)
		if current_user && course.created_by.presence
			course.created_by.id == current_user.id if current_user
		end
	end
end
