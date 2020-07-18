# README

## Interview

I interviewed for a Software Engineering positon with Wave back in 2018.

This is the coding assigment given to me, the result allowed me to proceed to an on-site although an offer wasn't extended for that position I was invited to apply an Operations Engineering role which I declined.

Overall the interview wasn't difficult but I think nerves got the better of me on the day as it was my first on-site in three years.

The practice proved useful and I received an offer from Capital One the next week.

I wrote up a short review on GlassDoor:

https://www.glassdoor.ca/Interview/Wave-Senior-Software-Engineer-Interview-Questions-EI_IE554319.0,4_KO5,29.htm#InterviewReview_24620498

## Challenge

A copy of the challenge can be found [here](./challenge.md).

## Result

### Instructions

* Ruby version
- Built using ruby 2.3.4p301
- Requires ruby 2.2.2+

* System dependencies
- Possibly sqlitedev dependencies - install via:
- `brew install sqlite` for OSX
- `apt-get install sqlite3 libsqlite3-dev` debian systems
- `yum install sqlite3 libsqlite3-dev` el systems

* Configuration
- `bundle install` in app directory

* Database creation
- `rails db:create`

* Database initialization
- `rails db:migrate` && `rails db:seed`

### Introduction

I've heavily leveraged ruby/rails standard libraries because I believe they make code more readable.

I also had a to make a tradeoff decision with regards to performance for large CSV files:

Choices were:

1. Load the entire CSV into memory to reduce the number of DB writes
2. Load the CSV line-by-line and write into the DB, also updating the Payroll Entry totals

I chose 2 primarily from experience with Ruby memory consumption but 1 would allow us to rollback a DB transaction if data was invalid.

#### Assumptions I made

1. JobGroup records are immutable OR old CSVs are not uploaded e.g. if a job group has updated the hourly wage and a CSV is uploaded that was intended to reference the previous hourly wage. In that case we should either - create a new JobGroup or denormalise the data.
2. Validation of data is not required - if validation was required then we could make some reasonable assertions on the CSV entries such as hours worked is per day <= 24, JobGroup exists, Employee exists etc.
3. CSV files might have thousands of entries
