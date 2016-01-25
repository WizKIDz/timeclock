# Changes (Jan 22, 2016)
#### Austin Crane

## Devise Issues
Devise was filtering out your project_ids from the registrations because it was not using their params filter serializer thing... check the RegistrationsController#configure_permitted_parameters for more notes on that. Devise is sometimes really stubborn by design. In the future if you want to do more roles for different types of users IE: Admin Super Admin, Marketing, Sales, Developer, ect i would suggest using the **rolify gem**.

## Timekeeping Relationships
I added some validations to the timekeeping relationships so that you cant create a timekeeping model without there existing a user and a project tied to it. **checkout the timekeeping model for those changes**

## Keep Up The Good Work
This looks great! Keep up the good work and goodluck. feel free to contact me by email or slack @ austin@coffeehousedevelopers.com
