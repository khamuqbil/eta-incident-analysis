#import "meta.typ" as meta
// #import "@preview/modern-whs-assignment:0.1.0": *
#import "@preview/modern-whs-assignment:0.2.1": *

#set heading(numbering: none)
// Language override
#set text(lang: "en")

// Override the logo image
#show image: it => {
  if "logo.png" in repr(it) {
    image("images/sita.png", width: it.width)
  } else {
    it
  }
}
#set heading(numbering: "1.1")

#show heading: it => {
    if (it.level >= 1){
        block(it.body)
    } else {
        block(counter(heading).display() + " " + it.body)
    }
}
#show "Literaturverzeichnis": ""
#show "Inhaltsverzeichnis": "Table of Contents"
#show "Abbildungsverzeichnis": ""
#show "Tabellenverzeichnis": ""
#show "Codeverzeichnis": ""
#show "Verzeichnisse": ""  // References
#show "Version vom": "Issued:"

// Override German bibliography terms:
#show "Verfügbar unter": "Available at"
#show "Zugriff am": "Accessed on"
#show "online": "Online"

#show: whs-assignment.with(
  meta.title,
  meta.author,
  meta.submission-date,
  meta.keywords,
  meta.course,
  meta.lecturer,
  meta.bibliography,
)
= Summary <summary>
As Field Engineer at SITA with 4+ years of direct aviation industry
experience, I am excited to transition into a customer-facing role that
leverages my deep technical expertise and proven stakeholder management skills.

== SITA Product Expertise & Technical Competence

My hands-on experience with SITA's core product portfolio including ServiceNow
for IT service management, Nexthink for digital experience monitoring and remote work support.

=== ServiceNow Platform Management

- *Incident Management:* Experienced in ServiceNow incident lifecycle management, ensuring rapid resolution of customer-impacting issues.
- *Problem Management:* Utilized ServiceNow problem management capabilities to identify root causes and implement preventive measures.
- *Service Catalog:* Managed service requests and catalog items, ensuring standardized service delivery across airport operations.

=== Nexthink Digital Experience Monitoring

- *End-User Experience Analytics:* Leveraged Nexthink insights to proactively identify and resolve performance impacting issues.
- *Digital Employee Experience:* Monitored and optimized workstation performance across diverse airport operational environments.
- *Predictive Analytics:* Used Nexthink data to anticipate and prevent system issues before they impact customer operations.

=== Operational Responsibility
- Ensuring 24/7 availability management of essential airport systems supporting airline operations, ground handling staff, and airport management with zero downtime requirements.

== Airport & Airline Operations Systems
Core SITA Solutions Experience:

- CUTE (Common Use Terminal Equipment): Managed shared-use terminal systems enabling multiple airlines to operate efficiently from common infrastructure.
- AMS & FIDS (Airport Management Systems): Administered comprehensive airport operations management, coordinating resources and optimizing operational workflows.
- BRS (Baggage Reconciliation Systems): Ensured accurate baggage tracking and reconciliation processes, maintaining compliance with security and operational requirements.
- PFM (Passenger Flow Management): Managed passenger processing systems ensuring smooth flow and security compliance.

= Business Model & Customer Environment

== Aviation Industry Business Dynamics
Operational Excellence Requirements:

- *24/7 Critical Operations:* Demonstrated an understanding of aviation industry's zero-tolerance approach to system downtime and service interruptions.
- *Regulatory Compliance:* Applied experience with aviation security, safety, and operational regulatory requirements impacting system design and implementation.
- *Multi-Stakeholder Complexity:* Coordinated within complex stakeholder environments involving airlines, airport authorities, ground handlers, and regulatory bodies.

== Customer Success Drivers

- *Operational Efficiency:* Understanding how SITA solutions directly impact customer operational metrics including turnaround times, passenger flow, and resource utilization.
- *Cost Optimization:* Experienced with how technology investments translate to operational cost savings and efficiency gains for aviation customers.
- *Digital Transformation:* First-hand knowledge of aviation industry's modernization challenges and opportunities for technology-driven improvement.

== Customer Relationship Management

- *Proactive Support:* Applied SITA's customer-first approach through proactive monitoring and preventive maintenance strategies.
- *Stakeholder Engagement:* Managed relationships with diverse customer stakeholders from technical staff to executive management.
- *Value Communication:* Ability to translate technical capabilities into business value propositions for customer decision-makers.

 // = Experience
//
// Al-Jouf Airport Field Engineer | JCCS SITA CUTE Project | (2021-Present).
//
//  #text(fill: olive)[@summary[Professional Summary]]
//
// With practical application of ITIL 4 practices in managing incident, problem,
// and change management processes has enabled me to deliver measurable
// improvements in service quality and operational efficiency. This foundation,
// combined with my stakeholder management experience across airport operations,
// airline, ground handlers staff, and vendor partnerships, positions me to drive customer
// success through technical excellence and proactive relationship management.

== SITA's Value Proposition Delivery

- *Seamless Implementation:* Proved record of maintaining and deploying complex SITA solutions with minimal operational disruption.
- *Cross-Platform Optimization:* Experience integrating multiple SITA products to create comprehensive operational solutions.
- *Performance Optimization:* Demonstrated ability to tune and optimize SITA solutions for maximum customer value realization.

== Large-Scale IT Operations

- *Environment Type:* Mission-critical airport infrastructure combining traditional data-center operations and hybrid cloud architecture.
- *Responsibilities:* 24/7 system availability, proactive maintenance, infrastructure upgrades, multi-vendor coordination, regulatory compliance.
- *Scale Indicators:* Airport-wide infrastructure serving airline operations, ground handling, airport services, and management systems with zero-downtime requirements.
- *Key Achievements:* 98% success rate in infrastructure deployments, 20% network performance improvement, zero operational disruption during major system upgrades.

=== Project Leadership <project>

- *Infrastructure Migration & Upgrades:* Managed critical infrastructure upgrades including server switches, routers, and connectivity systems ensuring seamless service continuity and minimal operational risk. Successfully coordinated cross-functional teams, stakeholders, and suppliers throughout the project lifecycle. The result was enhanced system reliability, performance, and efficiency. All delivered within tight deadlines and without disrupting ongoing airport operations.

- *Airport Management System (AMS & FIDS):* Led the installation and configuration of AMS workstations and system infrastructure. Oversaw the cabling and setup process in close coordination with airport teams, suppliers, and contractors to ensure seamless system integration with existing operations all delivered without disrupting airport activities.

- *Proactive System Maintenance:* Monitored, troubleshot, and maintained IT systems to prevent downtime and ensure continuous operation of critical airport systems. This proactive approach ensured uninterrupted operations, contributing to higher operational efficiency.

- *Technical Support & Troubleshooting:* Provided both on-site and remote technical support for various IT systems, ensuring immediate issue resolution and maintaining high service standards.

== Team Diversity & Collaboration

- *Cross-Functional Coordination:*
Worked with airport operations, airline representatives, passenger services, and management teams.

- *Stakeholder Communication:*
Interfaced with airport authority, airline partners, and SITA regional and global teams.

- *Knowledge Transfer:*
Mentored local airport IT staff on new systems and maintenance procedures.

- *Vendor Management:*
Coordinated with multiple technology vendors and contractors for system integration.

== Customer-Facing
I worked closely with a wide range of stakeholders in a live airport operations environment,
including the deployment and support of mission-critical IT systems.
Designed and build inclusive digital #text(fill:blue )[@jouf-app[platforms]] that provided aviation staff, passengers, and the local community with accessible operational insights and learning resources across the Al-Jouf region.

- *Airport Operations Staff:*
Worked with ground handling crews, terminal managers, and security teams to ensure consistent uptime and optimal performance of critical passenger processing and airport operational system.

- *Airline Representatives:*
Supported airline staff with varying degrees of technical expertise, providing both technical integration (e.g., shared systems) and user training/support.

- *Vendors and Contractors:*
Acted as the liaison between technical service providers and on-site teams—defining technical requirements, coordinating installation, and validating service outcomes.

- *Airport Management:*
Delivered system usage reports, technical insights, and operational data summaries to decision-makers for planning and resource optimization.

- *International Stakeholders (SITA / Airline Regional & IT Teams):*
Collaborated with international teams and airline partners from various cultural and professional backgrounds. This required clear, respectful communication and adaptability to global workflows and expectations.

= Skills & Knowledge

== Aviation Data Standards & Messaging Protocols
Through my field engineering role with practical experience, I have gained practical experience with critical airline industry messaging standards and data formats:

- *SSIM (Standard Schedules Information Manual):* Flight schedule data processing and distribution
- *IATA messaging standards:* Practical understanding with core IATA formats such as PNL/ADL, BSM, LDM, and BRS messages, covering passenger lists, baggage handling, load data, and reconciliation processes critical to airline and airport operations.

- *SITA messaging formats:* Understanding of SITA’s messaging services, supporting operational data exchange such as.
    - Type B: Standard operational message exchange between aviation stakeholders.
    - Type X: Secure XML-based data communication for airline systems.

- *ICAO Messages:* Exposure to key ICAO message types (e.g., FPL, CHG, CNL) used in flight planning and air traffic control coordination.
== Documentation and Reporting
I have extensive experience producing and maintaining a wide range of technical
and non-technical documentation across both internal systems and public platforms.
My work spans system architecture, end-user support, project oversight, and content publication.

- *User Guides:* Created clear and accessible guides tailored to airport manual operations guide, designed to support concerned users. These focused on aligning documentation with real-world workflows and minimizing training time.

- *Project Documentation:* Maintained well-structured project documentation throughout development cycles, emphasizing clarity, version control, maintainability, and ease of knowledge transfer across teams.

- *Blog Content:* Managed an active aviation-focused blog hosted on the #text(fill: rgb("#0563c1"))[@jouf-app[*Al-Jouf Platform*]], contributing articles on airport world, technology adoption, and travel experiences bridging communication between industry professionals and the general public.

    This documentation work has reinforced my ability to communicate complex technical
    topics to diverse audiences and to maintain high standards of clarity, accuracy,
    and consistency across all formats.

#show link: underline
#text(fill: rgb("#0563c1"))[
#link("https://www.jouf.app/blog")[
-  Link to Al-Jouf Blog
]]

#show link: underline
#text(fill: rgb("#2b3e2b"))[
#link("https://www.jouf.app/blog/2024/6/21/sita/")[
-  *SITA's Article*
]]

= Key Role & Relevant Project

== Al-Jouf Platform - Public <jouf-app>
December 2023 - Ongoing

*Personal Project:* Aviation Operations & Customer Success | Digital Platform.

Designed and developed a comprehensive aviation web-based-application platform serving Al-Jouf region.
Addressing the needs of quick access to real-time flight data and long term flight
schedules, and operational updates, providing the essential tools and information
to enhance daily operations, for planed maintenance or activity.
The platform serves both airport staff and traveler. Demonstrating a practical
understanding of both aviation operational challenges and end-user needs. This
initiative highlights my ability to translate customer requirements into scalable
digital solutions that improve service delivery and customers satisfaction.

@jouf-app[Platform] available at:
#show link: underline
#text(fill: rgb("#0563c1"))[
#link("https://www.jouf.app")[
-  www.jouf.app
]]

Honestly, building the @jouf-app[Al-Jouf Platform] opened my eyes to something I hadn’t
fully appreciated before: the power of customer-impact solutions to truly impact people’s lives.
What began as a solution for a local airport challenge evolved into something
much larger we now serve over 1,700 daily users, have integrated *partnerships
with GDS systems*, and offer rich educational resources, including an aviation
blog and dedicated pages for practical information. By prioritizing user needs,
we’ve driven adoption, built trust, and delivered measurable value to our community.

#show link: underline
#text(fill: rgb("#0563c1"))[
#link("https://www.jouf.app/services")[
-  To Our Services
]]

What excites me most is how @jouf-app[this project] has helped fill a real gap in the
aviation industry. There are very few accessible platforms where people can
learn and practice aviation technology hands-on.

We created these services to be publicly available, to inspire curiosity and make aviation tech more
approachable to a wider audience.

#show link: underline
#text(fill: rgb("#0563c1"))[
#link("https://www.jouf.app/blog/2024/7/20/Self-Service/")[
-  Services Guide
]]

Seeing how open access to knowledge can democratize learning has been deeply
motivating for me. And that’s exactly what #text(fill: rgb("#2b3e2b"))[*SITA*] does with its services and solutions on a
global scale. I want to contribute to that mission, stretching my skills helping to
expand access to powerful technology in meaningful, transformative ways.

*NOTE:* This project was done as volunteer initiative for my airport, city and community.

=== Partnership
Integrating multiple aviation APIs for comprehensive flight information.
- *GDS Portal:* Through official Amadeus SDK, self-service API.
- *Flight Tracking:* Using FlightAware RepoAPI, providing live and real-time flight status.

= Excitement About Customer Operations Role

What excites me most is the opportunity to collaborate with SITA’s customer success team professionals dedicated to guiding aviation clients through their digital transformation goals. I greatly respect this customer-first approach and look forward to contributing my aviation expertise to support and enhance these efforts.

At the same time, my unique path combining hands-on technical expertise, airport operations, and disciplined ITIL 4 application gives me a practical understanding of both technical implementation and the business outcomes our customers expect.

This role feels like a natural evolution of my journey at SITA. It allows me to leverage my deep familiarity with our product and service portfolio (ServiceNow, Nexthink, CUTE, AMS, BRS, PFC, HIVE) to help customers unlock the full value of their technology investments.

Overall, this role will allow me to blend SITA’s customer-centric culture with service management discipline in a meaningful way.

= Education

== University
Computer Science and Information technology at Al-Jouf University.

#show link: underline
#text(fill: blue)[
#link("https://khamuqbil.github.io/about/")[
-  Personal page
]]

= Course & Certificate
== McKinsey Forward Programs | 2023
// - Problem Solving
// - Design Thinking

#figure(box(grid(
    columns: (auto, 1fr, auto),
    align: horizon + center,
    image("images/blob.png", width: 33%),
    image("images/leadership.png", width: 33%),
    image("images/customer-success.png", width: 33%),

)),

)
