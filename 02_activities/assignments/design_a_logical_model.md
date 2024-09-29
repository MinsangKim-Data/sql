# Assignment 1: Design a Logical Model

## Minsang Kim
## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

![Question 1](02_activities/assignments/erd_assignment_1_q1.jpg)
*** could not figure out how to embed please refer to the added jpg file under assignments. ***

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.
![Question 2](02_activities/assignments/erd_assignment_1_q2.jpg)
*** could not figure out how to embed please refer to the added jpg file under assignments. ***


## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Bonus: Are there privacy implications to this, why or why not?
```
There would be two types of architectures to the CUSTOMER_ADDRESS table: type 1 overwrites and type 2 retain changes. Type 1 is more of a simple replacement structure and does not retain any historical data as the new address will simply replace the old one when it is added. Naturally, the downside with this architecture is that a customer changing their address would amount to losing any record of their previous address as the record is not kept

An example of a type 1 CUSTOMER_ADDRESS table architecture would be:

CUSTOMER_ADDRESS TYPE 1
- address_id (PK)
- customer_id (FK)
- address_line1
- address_line2
- city
- state
- postal_code
- country

Type 2, on the other hand, will keep all historical data. When a new address is added, instead of replacing the old address, a new address is added while keeping the previous address. This design is more complex and requires more storage, but allows for full historical tracking of addresses.

An exapmle of a type 2 CUSTOMER_ADDRESS table architecture would be:

CUSTOMER_ADDRESS TYPE 2
- address_id (PK)
- customer_id (FK)
- address_line1
- address_line2
- city
- state
- postal_code
- country
- address_start_date
- address_end_date
- current_flag (indicates if this is current address or not)

As expected, simply because of the structure of how data is collected Type 1 is simpler on the data pipeline and storage; however, there is no historical data for both customer and seller. Type 2 is great for the option of having historical data, but there are many privacy implications where data security could be an issue. This could lead to major data exposure, which could ultimately lead to identity theft and fraud. Therefore, there should be practices and regulation of how personal data should be stored, handled, and disposed of.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
The two main difference is color schema and the organization of arrows. The Adventureworks schema has the huge logical ERD sub categorized into multiple schemas: Sales, Purchasing, Person, Production, HumanResources, and dbo. In addition, I could see that the relationship lines consisted more straight lines and did not cross over any other tables. Therefore, considering the design of this ERD, I would make the appropriate changes in the future. However, I think this overall needs a good understanding of the relationship lines and how they all relate to each other. Nevertheless, I believe color coding and having straight lines as much as possible is important for readability and flow of information, especially when ERD starts to have several tables. 
```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
