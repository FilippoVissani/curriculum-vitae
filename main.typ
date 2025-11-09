#import "@preview/basic-resume:0.2.9": *

// Personal information
#let name = "Filippo Vissani"
#let birth-date = "21/03/1999"
#let location = "Via Dante Alighieri 18, Montemarciano (AN), Italy"
#let email = "filippo.vissani.99@gmail.com"
#let github = "github.com/FilippoVissani"
#let linkedin = "linkedin.com/in/filippo-vissani-ba8088244"
#let phone = "+39 3284686368"
#let personal-site = "https://filippovissani.github.io/"

// Custom photo function to override the basic-resume header
#let resume-with-photo(
  author: "",
  author-position: left,
  personal-info-position: left,
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "a4",
  author-font-size: 20pt,
  font-size: 10pt,
  lang: "en",
  photo-path: "",
  photo-width: 3cm,
  body,
) = {
  // Sets document metadata
  set document(author: "Filippo Vissani", title: "Resume")

  // Document-wide formatting, including font and margins
  set text(
    font: font,
    size: font-size,
    lang: lang,
    ligatures: false
  )

  // Recommended to have 0.5in margin on all sides
  set page(
    margin: (0.5in),
    paper: paper,
  )

  // Link styles
  show link: underline

  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Accent Color Styling
  show heading: set text(
    fill: rgb(accent-color),
  )

  show link: set text(
    fill: rgb(accent-color),
  )

  // Header with photo
  grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      // Left side: Name and contact info
      #align(author-position)[
        #text(
          weight: 700,
          size: author-font-size,
          fill: rgb(accent-color),
        )[#author]
      ]
      
      #pad(
        top: 0.25em,
        align(personal-info-position)[
          #{
            let contact-item(value, prefix: "", link-type: "") = {
              if value != "" {
                if link-type != "" {
                  link(link-type + value)[#(prefix + value)]
                } else {
                  value
                }
              }
            }
            
            let items = (
              contact-item(location),
              contact-item(birth-date),
              contact-item(phone),
              contact-item(email, link-type: "mailto:"),
              contact-item(github, link-type: "https://"),
              contact-item(linkedin, link-type: "https://"),
              contact-item(personal-site, link-type: "https://"),
            )
            items.filter(x => x != none).join("  |  ")
          }
        ],
      )
    ],
    [
      // Right side: Photo
      #if photo-path != "" {
        align(right)[
          #image(photo-path, width: photo-width)
        ]
      }
    ]
  )

  // Main body
  set par(justify: true)
  v(1em)
  body
}

#show: resume-with-photo.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "a4",
  author-position: left,
  personal-info-position: left,
  photo-path: "picture.jpg",
  photo-width: 2.5cm,
)

== Employment History

#work(
  title: "Consultant",
  company: "Connect Reply",
  location: "Turin (TO), Italy",
  dates: dates-helper(start-date: "2024", end-date: "Present"),
)

#work(
  title: "Intern",
  company: "University of Bologna",
  location: "Cesena (FC), Italy",
  dates: "2021",
)

#work(
  title: "Intern",
  company: "Bit Service",
  location: "Camerano (AN), Italy",
  dates: "2017",
)

#work(
  title: "Intern",
  company: "Gruppo Editoriale Raffaello",
  location: "Monte San Vito (AN), Italy",
  dates: "2017",
)

#work(
  title: "Intern",
  company: "Iride Progetti",
  location: "Senigallia (AN), Italy",
  dates: "2016",
)

== Education

#edu(
  institution: "University of Bologna",
  location: "Cesena (FC), Italy",
  dates: dates-helper(start-date: "2021", end-date: "2024"),
  degree: "Master of Science in Computer Science and Engineering",
)
- Thesis title: _Feasibility of Reactive Aggregate Programming via Kotlin Flows_
- Supervisor: Prof. Danilo Pianini
- Area of Study: Laboratory of Software Systems
- Final grade: 110L/110

#edu(
  institution: "University of Bologna",
  location: "Cesena (FC), Italy",
  dates: dates-helper(start-date: "2018", end-date: "2021"),
  degree: "Bachelor of Science in Computer Science and Engineering",
)
- Thesis title: _Study And Analysis Of The Architecture Of Mixed Reality Applications In Hololens 2: A Case Study_
- Supervisor: Prof. Alessandro Ricci
- Area of Study: Embedded Systems And Internet Of Things
- Final grade: 95/110

#edu(
  institution: "IIS Volterra Elia",
  location: "Ancona (AN), Italy",
  dates: dates-helper(start-date: "2013", end-date: "2018"),
  degree: "High school diploma",
)
- Final grade: 97/100

== Technical Skills

*Programming Languages:* Java, Scala, Rust, C\#, Kotlin, C, C++, JavaScript, Ruby, PHP, Haskell, Prolog, Golang, Python

*Developer Tools:* Git, UML, Docker, Gradle, SBT, Maven, .NET, GitHub Actions, GitLab CI/CD, Atlassian Suite, CircleCI, Unity

*Technologies/Frameworks:* Akka, Vert.x, Unity3D, JUnit, RxJava, Gson, ExpressJS, NodeJS, AngularJS, Vue.js, React, ASP.NET, Entity Framework, ASP.NET Core, LINQ, Spring Boot, Project Reactor, Terraform, Kubernetes, Kafka, MongoDB, MySQL

*Development Methodologies:* Domain-Driven Design, Test-Driven Development, Agile, Scrum

*Cloud Platforms:* AWS, Azure

== Personal Skills

*Mother tongue:* Italian

*English:*
- Listening: B2
- Reading: B2  
- Writing: B2
- Speaking: B2

*Driving License:* AM, A2, A3, B

== Personal Projects

#project(
  name: "CityTwin",
  dates: "2023",
  url: "github.com/FilippoVissani/CityTwin",
)
- Description: Digital twin in the context of the smart city

#project(
  name: "RustFields",
  dates: "2023",
  url: "github.com/RustFields",
)
- Description: The goal of this project is to explore different solutions to make the field calculus available on thin devices

#project(
  name: "galaxy-sim",
  dates: "2022",
  url: "github.com/FilippoVissani/PPS-22-galaxy-sim",
)
- Description: A simulator of the motion of bodies within a galaxy