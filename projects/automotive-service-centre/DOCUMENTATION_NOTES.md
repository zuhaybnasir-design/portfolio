# APU Automotive Service Centre — Documentation highlights

This is a **public, privacy-conscious summary** of the project's 56-page academic group report, *CT038-3-2-OODJ: APU Automotive Service Centre*, completed 29 May 2026. It is not a replacement for the original submission.

The report describes a Java Swing desktop management system developed for the Object Oriented Development with Java module. A four-person group declared **equal 25% workload shares**. The report does **not** establish which individual authored each Java class.

## Where to find the evidence in the original report

| Report pages | Evidence |
| --- | --- |
| 5–11 | System introduction, four user roles, and functional use-case specifications |
| 12–16 | Use-case diagram, class diagram, and UML relationships |
| 17–20 | Application screenshots: animated splash, role selection, login and registration |
| 21–30 | Manager, counter-staff, and technician workflows, including report export and conflict warnings |
| 30–34 | Customer dashboards and service/feedback views |
| 35–45 | Code-level discussion of abstraction, encapsulation, inheritance, polymorphism, interfaces and enums |
| 46–48 | Technical improvements such as password hashing, collision prevention, Java2D icons and record validation |
| 49–50 | Limitations, conclusion and proposed improvements |
| 52–56 | Sample record formats in the five pipe-delimited data files (not reproduced here) |

## Key functional flows

- **Four role-specific interfaces:** manager, counter staff, technician and customer.
- **Appointment scheduling:** normal service (60 minutes) or major service (180 minutes), with technician conflicts rejected when appointment time intervals overlap.
- **Service lifecycle:** a scheduled appointment begins as `PENDING`; a technician may set it to `COMPLETED`; counter staff can then record payment and mark it `PAID`.
- **Payments and reporting:** service prices are read from a local file; a receipt is shown after payment; manager reports can be exported as text.
- **Feedback:** technicians record service notes and customers may submit comments for completed or paid appointments.
- **Object-oriented implementation:** an abstract `User` superclass with role subclasses, a `Reportable` interface, and enums such as `ServiceType`, `UserRole` and `AppointmentStatus`.
- **Data storage:** text files for users, appointments, payments, prices and feedback, accessed through `FileHandler`.

## Limitations acknowledged in the report (page 49)

The coursework system is **not a production application**. The report notes: no concurrent multi-instance writes, no appointment rescheduling workflow, no referential-integrity enforcement when referenced users are deleted, limited filtering, no automated email notifications, and in-memory-only sessions. Password hashing uses unsalted SHA-256, which is inappropriate for a production authentication system even though it illustrates cryptographic APIs.

## Source and documentation access

- [Portfolio case study](./)
- [Java source repository](https://github.com/zuhaybnasir-design/APU_ASC) — **private; account access required**
- The original report contains group-member student identifiers and screenshots or appendices with sample account records. For privacy, the **original PDF is not published on this website**.

This summary reflects what the submitted documentation states; it is not an independent test of the running application.
