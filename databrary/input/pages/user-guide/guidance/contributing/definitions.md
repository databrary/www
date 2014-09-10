Title: Definitions of Suggested Fields
Brief: Definitions
<<<<<<< HEAD:databrary/input/pages/user-guide/guidance/contributing/definitions.md
Slug: user-guide/contributing/definitions
Order: 3550
=======
Order: 3450
>>>>>>> staging:databrary/input/pages/user-guide/contributing/definitions.md

This section describes the session-level and participant information that is helpful to include with the video files you plan to share in Databrary.
Any fields may be left blank to mean the information is unknown, not reported, or unavailable.

# **Session-level information**

*A session refers to a single visit or observation period.*
Participants may be observed at multiple sessions (e.g., longitudinal studies) and you should provide information for each session.
Multiple participants may be observed at a single session (e.g., two siblings observed playing together) and you should provide information for each participant.

## Required or strongly recommended fields

### Test date

The date on which the session occurred.
You should try to use unambiguous formats such as "2014-Feb-28".
This is considered a "restricted" (identifying) field, and is not available to the public.
However, along with birth date, it is used to compute age, which is public information.

### Release level

The release level is the level of sharing that the participant(s) agreed to and that the PI (or data contributor) has warranted. 
For the definition of the levels, see [Databrary Release Levels](|filename|../releasing-data/release-levels.md)
Every session must be tagged with a release level. 
If there is no release level marked, it will not be shared. 
If you have more than one release level for multiple participants or for multiple people visible on the videos, you should use the lowest level of release (e.g., if one person says private and another says shared, use private).

## Suggested fields

### Subject ID

If you identify participants as distinct entities, then you should include their subject ID.
List each participant in a single session with a non-identifying subject ID (does not contain participant’s name, initials, birth date, or test date) that is unique from all other subject IDs for that dataset.

### Pilot

If this session or entire dataset was part of a preliminary data collection that did not use standardized procedures, was not appropriate for use, or was never completed, you can indicate that it is pilot data.

### Excluded session

If this session was excluded from a final study or analysis, you can indicate that:

  * inclusion criteria: participant did not meet the criteria for inclusion in the study but some data were collected nonetheless
  * procedural: experimenter error/equipment failure
  * withdrew: participant became fussy, tired, or withdrew from session for other participant-related reasons
  * outlier: participant's session was unusual compared to the rest of the sessions
  * other: please define
	
### Setting

In what kind of environment did the session take place?

  * lab
  * home
  * museum
  * classroom
  * outdoor
  * clinic
  * other: please define

### Country

In what country did the session take place?

### State

In what state did the session take place?

### Conditions

Conditions are levels, tasks, or interventions manipulated or designed by the researcher.
Both between- and within-subject conditions may be specified, but only between-subject conditions will be associated with an entire session.

### Group

Groups reflect inherent characteristics of the participant.
If the dataset has between-subject groups that hold for the entire dataset (e.g., crawler/walker, no-words/1st-words, longitudinal visits) these should be specified unless the relevant distinction is captured by other fields (e.g., boy/girl, typical-development/autism, high-SES/low-SES).
	
### Study Language

In what language was the study conducted?


# **Information about the participant**

*A participant refers to a single person contributing data to a single dataset.*
Participants can be associated with multiple sessions (longitudinal datasets).

## Required or strongly recommended fields

### Birthdate

Should preferably be specified in the same format as test date.
This is considered a "restricted" (identifying) field, and is not available to the public.
However, it is used to compute age, which is public information.

### Gender

 * Male
 * Female

## Suggested fields

### Race

 * American Indian or Alaska Native
 * Asian
 * Native Hawaiian or Other Pacific Islander
 * Black or African American
 * White
 * Multiple

### Ethnicity

 * Not Hispanic or Latino
 * Hispanic or Latino

### Disability

If the participant is not typically developing, this may be indicated.
This is considered a "restricted" (identifying) field, and is not available to the public.
Please be sure that you have obtained appropriate consent to release self-reported health information before reporting this.

### SES

### Primary Language

What is the participant's primary language?

### Secondary Language

What is the participant's secondary language, if any?

### Term (gestation) for infants

Numeric in weeks from last menstrual period

### Experience with target behavior

Onset date of a target behavior.
You should also describe the target behavior and how it is measured.
This is considered a "restricted" (identifying) field, and is not available to the public.
