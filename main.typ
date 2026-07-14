#import "@preview/basic-resume:0.2.9": *

// Personal information
#let name = "Filippo Vissani"
#let location = "Montemarciano (AN), Italy"
#let email = "filippo.vissani.99@gmail.com"
#let github = "github.com/FilippoVissani"
#let linkedin = "linkedin.com/in/filippo-vissani-ba8088244"
#let personal-site = "https://filippovissani.github.io/"

// Custom photo function to override the basic-resume header
// Added show-photo toggle to allow generating photo/no-photo variants
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
  show-photo: true,
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
      #if show-photo and photo-path != "" {
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
  phone: "",
  personal-site: personal-site,
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "a4",
  author-position: left,
  personal-info-position: left,
  photo-path: "picture.jpg",
  photo-width: 2.5cm,
  show-photo: true,
)

== Profile

Backend & infrastructure engineer specializing in cloud-native microservices on Azure and AWS. 
Build event-driven and distributed systems using C\#, Go, and Java with a focus on resiliency, observability,  and  performance.  
 
Master's Thesis (Feasibility of Reactive Aggregate Programming via Kotlin Flows): Prototyped a 
Kotlin  Flows–based  reactive  execution  model  and  DSL  (Domain  Specific  Language)  for  self-
organizing  multi-agent  systems,  comparing  scheduling  flexibility  and  developer  ergonomics 
against traditional round-based (proactive) approaches (FRASP-inspired).

== Employment History

#work(
  title: "Consultant",
  company: "Connect Reply",
  location: "Turin (TO), Italy",
  dates: dates-helper(start-date: "2024", end-date: "Present"),
)
- Designed and delivered microservices (C\#, Entity Framework, Java, Spring Boot, Golang, Fiber) to expose APIs.
- Designed and delivered event-driven microservices (Golang, C\#, Kafka, Event Hub, Service Bus) to manage appliance telemetry.
- Introduced reusable Terraform modules reducing IaC duplication and provisioning time.
- Designed and delivered CI/CD pipelines (CircleCI, GitHub Actions) automating build, test, release and deployment processes.
- Key projects included a real-time telemetry platform for 450K+ globally deployed appliances and microservices for map data ingestion/processing/distribution in robot vacuum cleaners.
- Reengineered Terraform infrastructure into modular multi-environment, multi-region architecture to improve scalability and portability.
- Engineered CI/CD pipelines to automate semantic versioning, packaging, release, and multi-environment deployments.

== Internships (Summary)
- University of Bologna (2021, Cesena (FC), Italy)
- Bit Service (2017)
- Gruppo Editoriale Raffaello (2017)
- Iride Progetti (2016)

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

*Primary Languages/Frameworks:* Java, Kotlin, Scala, C\#/.NET, Go, Spring Boot, Entity Framework

*Cloud:* AWS (Lambda, API Gateway, Elastic Kubernetes Service, Managed Streaming for Kafka, DynamoDB, S3, Secrets Manager, Parameter Store), Azure (Functions, Container Apps, Event Hub, Service Bus, IoT Hub, App Service, Azure SQL Database, Blob Storage, Table Storage)

*Infra & DevOps:* Terraform, Docker, Kubernetes, GitHub Actions, Azure DevOps, CircleCI

*Data & Messaging:* SQL Server, MongoDB, Redis, DynamoDB, Kafka

*Observability & Quality:* Datadog, SonarCloud, Checkmarx, GitHub Vulnerability Scanner (Dependabot/Security Insights), Vault (HashiCorp)

*Go Tooling & Practices:* goroutines/channels, interface-oriented design, context-aware cancellation, structured error handling, table-driven tests, race detection, golangci-lint, go-critic, gosec

*Secondary Languages/Frameworks:* Rust, JavaScript/Node, RxJava, Project Reactor, Akka, Vert.x, Python

*Web & Frontend:* ExpressJS, React, Vue.js, AngularJS

*Methodologies:* Domain-Driven Design, Test-Driven Development, Agile/Scrum

*Delivery & Collaboration:* Jira, Confluence, GitHub Issues/Projects, Bitbucket

== Personal Skills

*Languages:* Italian (Native), English (B2)

*Soft Skills:* Collaborative, proactive ownership, clear written communication.

*Other:* Driving License (AM, A2, A3, B)

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