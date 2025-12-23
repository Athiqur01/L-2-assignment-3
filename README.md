Explanation of the project: 
This project focuses on designing and implementing a Vehicle Rental System database that models real-world rental operations. The system manages users, vehicles, and bookings, ensuring proper data organization, integrity, and relationships.

The database is designed using an Entity Relationship Diagram (ERD) that clearly defines primary keys, foreign keys, and relationship cardinality. A one-to-many relationship exists between users and bookings, and a many-to-one relationship exists between bookings and vehicles, where each booking connects exactly one user to one vehicle. drawSQL has been used in this project for drawing ERD diagram (Link: https://drawsql.app/teams/jannatul-afrin-ome/diagrams/vehicle-rental-system).

Business rules are enforced through constraints such as unique emails and vehicle registration numbers, status fields for vehicles and bookings, and date validations for rentals. The system supports essential operations like tracking vehicle availability, managing booking lifecycles, and calculating rental costs.

The project also includes SQL queries using JOIN, WHERE, EXISTS, GROUP BY, and HAVING to retrieve meaningful insights such as booking details, unbooked vehicles, available vehicles by type, and vehicles with multiple bookings.

Overall, this project demonstrates a solid understanding of database design principles, ERD modeling, and SQL querying, providing a reliable foundation for a real-world vehicle rental application.