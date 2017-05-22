# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.new
admin.name = "admin"
admin.email = "admin@sciencecourses.rmit.edu.au"
admin.password = "password"
admin.role = "admin"
admin.save(validate: false)

joshua  = User.create( name: "Joshua Orozco", email: "joshua.orozco@rmit.edu.au", password: "123qweASD!@#", role: nil)
joshy   = User.create(name: "Joshy Borozky", email: "joshy.borozky@rmit.edu.au", password: "123qweASD!@#", role: nil)

java            = Category.create({ name: "Java" })
webprog         = Category.create({ name: "Web Programming" })
it              = Category.create({ name: "IT" })
softwareprog    = Category.create({ name: "Software Programming" })
iosdev          = Category.create({ name: "iOS Development" })

imacroom = Location.create(at: "14.09.23" )
farawayroom = Location.create(at: "96.01.02" )
building80 = Location.create(at: "80.07.02" )


buildingITSystems = Course.create(
    name: "Building IT Systems",
    description: "IT today is everywhere and is involved in many aspects of life, including mobile devices, electronic voting and robotic fish. Many advances have come from people passionately following an inspiration, and developing it into a concrete outcome. This course is an opportunity for you to pursue an idea in IT and to work with a team of like-minded people to develop it. You will be provided with assistance to choose an appropriate topic, find a project team, generate a project plan, and to implement your project. This course is designed to engage and inspire you with the wide world of IT, with a particular emphasis on finding appropriate tools, methodologies and techniques to meet your own personal challenge. This course will give you substantial hands-on, practical learning experiences and aims to motivate you through engagement in the creative, explorative and meaningful development of technological artefacts that operate in real world contexts.",
    prerequisite: "Basic computer literacy",
    users_id: joshua.id,
    created_at: 60.minutes.ago
)
buildingITSystems.locations << imacroom
buildingITSystems.categories << it
buildingITSystems.save

introductionToProgramming = Course.create(
    name: "Introduction to Programming",
    description: "Programming is acknowledged as a vital skill that enables problem solving through the use of computers across a range of varied disciplines. This course introduces you to basic concepts, syntax and control structures in programming. You will learn how to program in a step-wise problem solving fashion. ",
    prerequisite: "Basic computer literacy",
    users_id: joshua.id,
    created_at: 50.minutes.ago
)
introductionToProgramming.locations << farawayroom
introductionToProgramming.categories << java
introductionToProgramming.save

programming1 = Course.create(
    name: "Programming 1",
    description: "This course introduces Object-Oriented programming using the Java programming language. This course covers: algorithm development using standard control structures; design methods such as step-wise refinement and object oriented programming; the use of standard Java classes and interfaces; the use of standard APIs; I/O processing; programming style and code reuse, and basic strategies for software testing.",
    prerequisite: "Introduction to Programming",
    users_id: joshua.id,
    created_at: 40.minutes.ago
)
programming1.locations << building80
programming1.categories << java
programming1.save

webprogramming = Course.create(
    name: "Web Programming",
    description: "The course introduces you to the basic concepts of the World Wide Web (Web), and the principles and tools that are used to develop Web applications. The course will provide an overview of Internet technology and will introduce you to current Web protocols, client side and server side programming, communication and design.",
    prerequisite: "Introduction to Programming",
    users_id: admin.id,
    created_at: 30.minutes.ago
)
webprogramming.locations << imacroom
webprogramming.categories << webprog
webprogramming.save

softwareenginnering = Course.create(
    name: "Software Engineering Fundamentals",
    description: "This course is designed to provide you opportunity to gain knowledge and skills necessary to analyse, design and implement complex software engineering projects. You should learn to analyse and design fairly complex real-life systems, working as teams. The project based approach used requires you to review and refine your design iteratively based on regular feedback from staff. You are also made aware of current software engineering standards and processes. You are also taught to consider qualitative aspects including maintainability, extensibility, reusability and robustness in every stage of the software-engineering life-cycle. At the end of the course you should be able to combine top-down and bottom-up approaches to software design and choose the most appropriate process considering the underlying technology, project duration, the level of risks and the customer expectations.",
    prerequisite: "Programming 1",
    users_id: admin.id,
    created_at: 20.minutes.ago
)
softwareenginnering.locations << farawayroom
softwareenginnering.categories << softwareprog
softwareenginnering.save

securityinIT = Course.create(
    name: "Security in Computing and Information Technology",
    description: "Security has become a focal area in IT; it has grown and evolved significantly in recent years and different areas of specialisation have emerged.",
    prerequisite: "Data Communication and Net-centric Computing",
    users_id: admin.id,
    created_at: 10.minutes.ago
)
securityinIT.locations << farawayroom
securityinIT.categories << it
securityinIT.save

softwareenginerringprojmgmt = Course.create(
    name: "Software Engineering Project Management",
    description: "ISYS1108 (UG): This course serves to introduce the basic principles of Engineering Software Projects. Most, if not all, students complete projects as part of assignments in various courses undertaken. These projects range in size, subject and complexity but there are basic project essentials that need to be understood and practiced for successful team project outcomes.",
    prerequisite: "Software Engineering Fundamentals",
    users_id: joshy.id
)
softwareenginerringprojmgmt.locations << building80
softwareenginerringprojmgmt.categories << softwareprog
softwareenginerringprojmgmt.save