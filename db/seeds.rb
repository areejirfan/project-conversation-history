# Create a test user
user = User.create!(
  username: "Test User",
  email: "testuser@example.com",
  password: "password",
  password_confirmation: "password"
)

# Create Projects with their descriptions and statuses
projects = [
  { 
    title: "Project 1", 
    description: "This project is designed to explore and tackle the challenges of innovation in the field of technology and software development. It aims to push the boundaries of what we can achieve with our current skill set, collaborating with teams to create cutting-edge solutions that impact real-world problems. Each task will be approached with a careful eye towards detail, ensuring every aspect of the project is thoroughly vetted and executed to the highest standards.", 
    status: "draft" 
  },
  { 
    title: "Project 2", 
    description: "The project will focus on sustainable technologies and explore different avenues for reducing environmental impact. With a strong emphasis on renewable energy sources and smart cities, the project aims to make a lasting impact on the future of urban living and energy consumption. Every step will be taken to ensure the viability and practicality of the concepts being proposed.", 
    status: "in_progress"
  },
  { 
    title: "Project 3", 
    description: "Aiming to revolutionize the world of healthcare, this project explores cutting-edge technologies in medical science, from AI-driven diagnostic tools to remote healthcare solutions. We aim to reduce healthcare disparities and improve outcomes by introducing smart, accessible solutions for people in remote areas or underserved communities.",
    status: "completed"
  },
  { 
    title: "Project 4", 
    description: "This project is dedicated to improving education through technology, making learning more interactive, engaging, and accessible for students around the world. We are leveraging AI to create personalized learning experiences and help students thrive, regardless of their geographic location or learning needs.",
    status: "draft"
  },
  { 
    title: "Project 5", 
    description: "The focus here is on exploring innovative solutions to transportation, reducing traffic congestion, and lowering carbon emissions. By incorporating electric vehicles and smart traffic management systems, the project aims to create more efficient, eco-friendly transportation networks in urban areas.",
    status: "in_progress"
  },
  { 
    title: "Project 6", 
    description: "The goal of this project is to enhance cybersecurity measures across industries. By developing cutting-edge tools and strategies, we aim to help businesses protect their data and operations from cyber threats, ensuring that privacy and security remain paramount in the digital age.",
    status: "completed"
  },
  { 
    title: "Project 7", 
    description: "Focusing on the future of agriculture, this project seeks to explore and implement advanced technologies to boost crop yield, reduce waste, and make farming more sustainable. By integrating AI, IoT, and machine learning, we aim to optimize farming processes and contribute to food security globally.",
    status: "draft"
  },
  { 
    title: "Project 8", 
    description: "Aiming to create safer and smarter cities, this project focuses on urban planning innovations that will enhance public safety and quality of life. From smart surveillance systems to efficient waste management solutions, the project seeks to transform urban living into a more sustainable and efficient experience.",
    status: "in_progress"
  },
  { 
    title: "Project 9", 
    description: "This project is designed to tackle the challenges of climate change through the development of renewable energy solutions. By focusing on solar, wind, and geothermal energy sources, we aim to reduce reliance on fossil fuels and create a cleaner, more sustainable future for generations to come.",
    status: "completed"
  },
  { 
    title: "Project 10", 
    description: "The objective of this project is to revolutionize financial services by leveraging blockchain technology to provide more transparent, secure, and efficient transactions. From decentralized finance to smart contracts, the project seeks to eliminate barriers and foster greater financial inclusion across the globe.",
    status: "draft"
  }
]

# Create the projects from the array
projects.each do |project_data|
  project = Project.create!(project_data)
  comment1 = project.comments.create!(user: user, content: "Comment 1 for #{project.title}. The progress of this project is amazing, and I believe it's going to bring significant impact to the industry.")
  comment2 = project.comments.create!(user: user, content: "Comment 2 for #{project.title}. The potential of this project to solve real-world problems is immense, and I'm excited to see its development.")
  comment3 = project.comments.create!(user: user, content: "Comment 3 for #{project.title}. I have high hopes for this project, especially the collaborative aspects and the way it leverages cutting-edge technology.")

end

puts "Seed data created: 1 user, 10 projects with 3 comments each."
