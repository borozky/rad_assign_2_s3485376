module CoursesHelper
	def course_editable?(course)
		if current_user && course.user.presence
			course.user.id == current_user.id if current_user
		end
	end
end
