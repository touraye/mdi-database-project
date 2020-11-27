# MDI DRAFT BUSINESS RULES

1. Management Development Institute (MDI) is divided into several departments: gender and development, financial management and accounting, banking and finance, management and policy analysis, diplomacy and international relations, information and communication technology, business studies. Each department is administered by a head of department (HOD) who is a lecturer.
   Each lecturer can be the HOD of only one department, and a lecturer is not required to be
   the HOD of any department. Therefore, a 1:1 relationship exists between LECTURER and
   DEPARTMENT. Note that the cardinality can be expressed by writing (1,1) next to the entity
   LECTURER and (0,1) next to the entity DEPARTMENT. 

2. Each department runs several programs. For example, the department of information and communication technology offers programs like national diploma in computer science, cyber security.., a management/policy analysis department offer national diploma in management studies. Note again the cardinality rules: The smallest number of programs operated by a department is one, and the largest number of departments is indeterminate (N). On the other hand, each program
   belongs to only a single department; thus, the cardinality is expressed by (1,1). That is, the
   minimum number of department to which a program belongs is one, as is the maximum
   number. 

3. Each department offer several courses. For example, the management/marketing department offers courses such as Introduction to Management, Principles of Marketing, and Production Management. Note that this relationship is based on the way MDI operates. For example, In MDI their are some courses which are required of every student to take and this are called general course (GRs) irrespective of their departments.
4. A course may offer several classes. a CLASS is a section/group of COURSE. That's, a program may offer several sections/groups (classes) of the same course. Each of those class is taught by a lecturer at a given time in a given place. In short, a 1:M relationship exists between COURSE and CLASS. Additionally, each class is offered during a given semester. SEMESTER defines the year and the term that class will be offered. Note that this different from the day when the student actually register in a class. It is possible that MDI calendar is set with semester beginning and ending date prior  to the creation of the semester class schedule so CLASS is optional to SEMESTER. This design will also help for reporting purpose, for example you could answer questions such as: what classes were offered at semester X? or what classes did student Y take on semester X?  Because a course may exist in the MDI catalog even when is not offered as a class in a given semester, CLASS is optional to COURSE.
5. Each lecturer may teach up to four classes; each class is a section of a course. A lecturer may also be on a research contract and teach no classes at all. The ERD segment in Figure 4.30 depicts those conditions.
6. A student may enroll in several classes but take each class only once during any given enrollment period. For example, during the current enrollment period, a student may decide to take five classes—Statistics, Accounting, English, Data-base, and Marketing—but that student would not be enrolled in the same Statistics class five times during the enrollment period! Each student may enroll in up to six classes, and each class may have up to 35 students, thus creating an M:N relationship between STUDENT and CLASS. Because a CLASS can initially exist at the start of the enrollment period even though no students have enrolled in it, STUDENT is optional to CLASS in the M:N relationship. This M:N relationship must be divided into two 1:M relationships through the use of the ENROLL entity,
   shown in the ERD segment in Figure 4.31. However, note that the optional symbol is shown next to ENROLL. If a class exists but has no students enrolled in it, that class does not occur in the ENROLL table. Note also that the ENROLL entity is weak: it is existence-dependent, and its (composite) PK is composed of the PKs of the STUDENT and CLASS entities. You can add the cardinalities (0,6)
   and (0,35) next to the ENROLL entity to reflect the business rule constraints, as shown in Figure 4.31. (Visio Professional does not automatically generate such cardinalities, but you can use a text box to accomplish that task.)
7. Each program has several (or many) students whose program is offered by that department. However, each student has only a single program and is therefore associated with a single department.
8. Class is taught in a room, in turn, each room is located in a building. So, a BUILDING can contain many ROOM, but each ROOM is found in a single BUILDING. it is also clear that some buildings do not contain (class) rooms. for example a storage building might not contain any named room at all.



#### using the preceding summary, you can identify the following entities:

1. DEPARTMENT
2. LECTURER
3. STUDENT
4. PROGRAM
5. COURSE
6. CLASS
7. ENROLL (the associated entity between STUDENT and CLASS)
8. SEMESTER
9. ROOM
10. BUILDING
