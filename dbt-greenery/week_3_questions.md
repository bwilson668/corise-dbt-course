## (1) Create new models to answer the first two questions 

**What is our overall conversion rate?**

Overall is 36.1% 

See code at `analyses/project_answers/3_1_conversion_rate.sql`

**What is our conversion rate by product?**

product_name	conv_rate
Alocasia Polly	0.61
Aloe Vera	0.48
Angel Wings Begonia	0.58
Arrow Head	0.51
Bamboo	0.5
Bird of Paradise 	0.64
Birds Nest Fern	0.57
Boston Fern	0.55
Cactus	0.52
Calathea Makoyana	0.61
Devil's Ivy	0.37
Dragon Tree	0.56
Ficus	0.52
Fiddle Leaf Fig	0.62
Jade Plant	0.48
Majesty Palm	0.59
Money Tree	0.48
Monstera	0.58
Orchid	0.58
Peace Lily	0.55
Philodendron	0.63
Pilea Peperomioides	0.47
Pink Anthurium	0.58
Ponytail Palm	0.48
Pothos	0.5
Rubber Plant	0.48
Snake Plant	0.57
Spider Plant	0.55
String of pearls	0.53
ZZ Plant	0.59

See code at `analyses/project_answers/3_2_product_conversion_rates.sql`

**A question to think about: Why might certain products be converting at higher/lower rates than others? Note: we don't actually have data to properly dig into this, but we can make some hypotheses.**

## (2) We’re getting really excited about dbt macros after learning more about them and want to apply them to improve our dbt project. 

**Create a macro to simplify part of a model(s). Think about what would improve the usability or modularity of your code by applying a macro. Large case statements, or blocks of SQL that are often repeated make great candidates. Document the macro(s) using a .yml file in the macros directory.**

**Create a macro that would be used as a run-operation and explain the use case Think about what would be helpful on a real data team. The example I gave in the reading materials on cloning a database or copying files from S3 is a great place to start. Think about how this could help automate some behavior or keep analysts from having to write the same code over and over again.**

## (3) We’re starting to think about granting permissions to our dbt models in our postgres database so that other roles can have access to them.

**Add a post hook to your project to apply grants to the role “reporting”.**

✅

## (4) After learning about dbt packages, we want to try one out and apply some macros or tests.

**Install a package (i.e. dbt-utils, dbt-expectations) and apply one or more of the macros to your project**

Installed my go-to packages dbt-utils, dbt-expectations, and codegen (for stubbing out some boilerplate)

## (5) After improving our project with all the things that we have learned about dbt, we want to show off our work!

**Show (using dbt docs and the model DAGs) how you have simplified or improved a DAG using macros and/or dbt packages.**

It will not show up in the DAG, but I made heavy use of the codegen package to stub out the YAML files and create the staging tables. You can see some of the stubs in the `analysis/stubs` directory.