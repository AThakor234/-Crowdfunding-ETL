-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id,
backers_count 
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(backers.backer),
backers.cf_id
FROM backers
INNER JOIN campaign
ON backers.cf_id = campaign.cf_id
WHERE campaign.outcome = 'live'
GROUP BY backers.cf_id
ORDER BY backers.cf_id DESC ;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT c.first_name,
c.last_name,
c.email,
cm.goal AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as c
INNER JOIN campaign as cm ON c.contact_id = cm.contact_id
WHERE cm.outcome = 'live'
ORDER BY cm.goal DESC;


-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT backers.email, 
backers.first_name,
backers.last_name,
campaign.cf_id,
campaign.company_name,
campaign.description,
campaign.end_date,
campaign.goal AS "Left of GOAL"
INTO email_backers_remaining_goal_amount
FROM backers 
INNER JOIN campaign
ON backers.cf_id = campaign.cf_id
ORDER BY backers.email DESC;
