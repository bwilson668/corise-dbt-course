## (1) Modeling challenge

**Let’s say that the Director of Product at greenery comes to us (the head Analytics Engineer) and asks some questions:**

**How are our users moving through the product funnel?**  

**Which steps in the funnel have largest drop off points?**

* Session to Page View
* Add to Cart to Checkout

**Product funnel is defined with 3 levels for our dataset:**  

* **Sessions with any event of type page_view / add_to_cart / checkout**
* **Sessions with any event of type add_to_cart / checkout**
* **Sessions with any event of type checkout**

**They need to understand how the product funnel is performing to set the roadmap for the next quarter. The Product and Engineering teams are asking what their projects will be, and they want to make data-informed decisions.**

**Thankfully, we can help using our data, and modeling it with dbt!**

**In addition to answering these questions right now, we want to be able to answer them at any time. The Product and Engineering teams will want to track how they are improving these metrics on an ongoing basis. As such, we need to think about how we can model the data in a way that allows us to set up reporting for the long-term tracking of our goals.**

**We’ll also want to make sure that any model feeding into this report is defined in an exposure (which we’ll cover in this week’s materials).**

**Please create any additional dbt models needed to help answer these questions from our product team, and put your answers in a README in your repo.**

**Use an exposure on your product analytics model to represent that this is being used in downstream BI tools. Please reference the course content if you have questions.**

## (2A) dbt next steps for you

**Reflecting on your learning in this class...**

* **if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?**

Visibility into lineage. Peace of mind with tests. Orchestratition with regularly scheduled jobs (stale dashboards are a common pain).

* **if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?**

My organization started with dbt in a "do no harm" mode. Stored procedures were turned into dbt jobs, but not much refactoring was done to the processes. I would like to see us standardize to a star schema or another disciplined data modeling approach.

* **if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?**

Practice, practice, practice. This course gave me insight into an ecommerce business, which is a different domain from my day job. It gave me confidence that these data modeling problems generalize across industries. 

## (2B) Setting up for production / scheduled dbt run of your project 

**And finally, before you fly free into the dbt night, we will take a step back and reflect: after learning about the various options for dbt deployment and seeing your final dbt project, how would you go about setting up a production/scheduled dbt run of your project in an ideal state? You don’t have to actually set anything up - just jot down what you would do and why and post in a README file.**

**Hints: what steps would you have? Which orchestration tool(s) would you be interested in using? What schedule would you run your project on? Which metadata would you be interested in using? How/why would you use the specific metadata? , etc.**

I am a fan of dbt Cloud. It is less infrastructure overhead to setup and maintain. It is the path of least resistance to get started. 