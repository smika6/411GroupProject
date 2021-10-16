# 411GroupProject
SQL Project 2
Due: November 3, 2021
Points: 75
Purpose: The objective of this project is to gain additional experience with ER diagrams and SQL.
Requirements:
  For this assignment you are to model a digital library. Examples of digital libraries include the
  ACM digital library and the IEEE Computer Society digital library. Your model should include:
    • Adding new entities to the digital library. Your model must differentiate between
      different types of publications, such as: conference proceedings, transactions, journals,
      books and magazines. Normal elements in a bibliography entry are to be recorded along
      with the publication information.
    • You must represent the author(s) as a separate entity.
    • Adding / deleting new users of the digital library.
    • Validation of a user’s access to the library. A particular user may be granted access to all
      of the entities in the library, or some subset of publications, such as, the articles that the
      user has authored (or coauthored).
    • Searching the digital library.
    • Instead of having actual articles in the library, the content can be simulated with a one
      line text statement such as: “this is the content of publication xyz”.
    • Maintaining a history of all content retrieved.
    • For a given article, it should be possible to find out:
      o Which articles it references
      o Which articles reference it
    • Tracking of author email address and regular postal address.
      This list is not meant to be all-inclusive; rather view it as a starting point and add other potential features.
  1. ER diagram: Create an Entity-Relationship diagram of all of the entities and relationship
     sets.
  2. Create tables: Create a set of SQL tables based on your ER diagram. Explain any
     significant deviations between your ER diagram and the set of tables.
  3. Interactions: Identify a set of activities to be performed on the database. This should
     include adding tuples as well as relevant queries. Implement these interactions via SQL.
 Demonstrate that your SQL statements function as intended. Precise written description
  of interaction, SQL statement, result of each interaction and justification; these are to be
  displayed next to each other for each interaction. There must be 20 interactions. They
  must meet the following requirements:
    • At least 15 must be queries.
    • At least 10 of your database interactions/queries must be implemented as stored procedures.
CSCI 411 / 511 2 Fall 2021
Turn-in:
  One report per group is to be submitted on the due date that demonstrates successful completion of
  the project. The report must be in 12 point font. The report must include the ER-diagram; SQL
  statements to create the tables; listing of table contents; description of each database interaction,
  listing of SQL for database interaction, results of executing these on the database and justification of
  results – these are to be displayed next to each other for each interaction. For item 3: A total of 20
  interactions (excluding database creation / initial population of the database / initial display of
  content) are to be included in your report. Points for the SQL interactions may be based on degree of
  difficulty as well as correctness.
  The summary report is to be submitted as a single PDF file to the Project 2 Assignment folder.
  Clearly indicate the group members on the front page of the report. Only one submittal per
  group. Each person in a group is to individually turn in their peer review form to the Project 2
  Evaluation folder.
  You may be asked to demonstrate your database to the instructor.
Grading:
  Grading of this project will be divided into two parts:
    a. A group score (g) consisting of up to 80% of the available points (60 points).
    b. An individual (i) score.
  These two parts are added together to determine your total score for this project.
  The group score is based on the following items (with approximate percentage weight):
    • Report -- completeness (5%)
    • ER diagram (13%)
    • Table creation SQL and contents (15%)
    • Database interactions (67%)
    • Use of stored procedures (included within Database interactions)
