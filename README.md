# cmsc508-fa2023-hw7
# Company-Wide Resume Database

## Overview

This project involves the creation of a comprehensive company-wide resume database for our dynamic team of designers and developers, operating under the guidance of our renowned sensei with Kill Bill fame. The goal is to develop SQL tables and insert specific data into them, enabling the execution of targeted queries for effective team management.

## Database Structure

### Tables

1. **People Table:**
   - Attributes: `id`, `first_name`, `last_name`, `email`.
   - Represents team members with unique identifiers and essential personal information.

2. **Skills Table:**
   - Attributes: `id`, `name`, `tag`, `description`.
   - Captures details of various skills possessed by team members, showcasing our diverse talents.

3. **Roles Table:**
   - Attributes: `id`, `name`, `description`.
   - Defines roles within the team, providing clarity on responsibilities and functions.

4. **People_Skills Table:**
   - Attributes: `id` (of a person), `id` (of a skill).
   - Establishes a link between people and their respective skills, enabling a detailed understanding of individual capabilities.

5. **People_Roles Table:**
   - Attributes: `id` (of a person), `id` (of a role).
   - Manages the relationship between people and roles, outlining the diverse responsibilities of each team member.

### Integration with Specific Commands

## Instructions

### Database Setup:
1. Execute SQL scripts to create tables: `People`, `Skills`, `Roles`, `People_Skills`, `People_Roles`.

### Data Insertion:
2. Populate tables with specific data to represent team members, skills, and roles.

### Query Execution:
3. Use specific SQL commands to retrieve relevant information from the database.

### Customization:
4. Tailor the database structure and queries based on project requirements and evolving team needs.

## Conclusion

This assignment not only enhances SQL proficiency but also contributes to the development of a powerful tool for team management and growth. The company-wide resume database serves as a valuable resource for our sensei and the entire team, allowing for efficient skill mapping, role assignments, and identification of skill gaps. Go Team! 🚀
