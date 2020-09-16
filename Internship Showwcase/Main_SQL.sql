ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN session_duration int;

ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN login_date date;

ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN session_projects_added int;

ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN session_likes_given int;

ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN session_comments_given int;

ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN inactive_duration int;

SELECT
	customer_id, 
	projects_added,
	likes_given, 
	comment_given,
	session_id,
	session_duration
 FROM Showwcase.dbo.showwcase_sessions
 WHERE 
	projects_added = 'TRUE' and 
	comment_given = 'TRUE' and
	likes_given = 'TRUE' 
  ORDER BY session_duration ASC;


 /* Customer_id = 87265
  Session_duration = 2395 
  Session_id= 84773

  Did they experience any bugs? There were zero bugs during that session */

SELECT bugs_in_session
FROM Showwcase.dbo.showwcase_sessions
	WHERE session_id= 84773;


/* Additional information: how many times has the user logged in October 2019?
   They have logged in a total of 12 times in the month of October*/

SELECT login_date 
FROM Showwcase.dbo.showwcase_sessions
	WHERE customer_id = 87265
	ORDER BY login_date ASC;

/* Now compare it to the user with the lowest session duration but with the same criteria 
    Customer_id = 40572
	Session_id = 310751 
	Session_duration = 32 */

SELECT
	customer_id, 
	projects_added,
	likes_given, 
	comment_given,
	session_id,
	session_duration
 FROM Showwcase.dbo.showwcase_sessions
 WHERE 
	projects_added = 'TRUE' and 
	comment_given = 'TRUE' and
	likes_given = 'TRUE' 
  ORDER BY session_duration ASC;

  /* Did they experience any bugs? There were 3 bugs for that session. */

  SELECT bugs_in_session
  FROM Showwcase.dbo.showwcase_sessions
	WHERE session_id= 310751;

 /*Additional information: how many times has the user logged in October 2019?
   They have logged in a total of 16 times during the month of October */


SELECT login_date, 
	   bugs_in_session,
	   projects_added,
	   likes_given, 
	   comment_given
FROM Showwcase.dbo.showwcase_sessions
	WHERE customer_id = 40572 and
		  projects_added = 'TRUE' and 
		  likes_given = 'TRUE' and 
		  comment_given = 'TRUE'
	ORDER BY login_date ASC;

/*Out of the 6 sessions which checked off the projects, likes, and comments given, there were 11 bugs total */


SELECT login_date, 
	   bugs_in_session,
	   projects_added,
	   likes_given, 
	   comment_given
FROM Showwcase.dbo.showwcase_sessions
	WHERE customer_id = 87265 and
		  projects_added = 'TRUE' and 
		  likes_given = 'TRUE' and 
		  comment_given = 'TRUE'
	ORDER BY login_date ASC;

/* Out of the 8 sessions which checked off the projects, likes, and comments given, there were 6 bugs total*/


/* Is there a correlation between bugs and user engagement? */

/*I have defined user engagements to check off three points:
1. Projects added 
2. Comments given 
3. Likes given 
4. Number of times they logged in

Customer 87265 had the highest duration of 2395 during Session 84773. 
There were 0 bugs during this session. 
They have logged in a total of 12 times during the month of October. 
Out of the 8 sessions which checked off the projects, likes, and comments given, there were 6 bugs total.

Customer 40572 had the lowest duration of 32 during Session 310751. 
There were 3 bugs during this session. 
They have logged in a total of 16 times during the month of October. 
Out of the 6 sessions which checked off the projects, likes, and comments given, there were 11 bugs total.*/

/*Cross Join the Customer id's and the highest bugs */
SELECT bugs_in_session, customer_id
FROM Showwcase.dbo.showwcase_sessions
WHERE bugs_in_session = (SELECT MAX(bugs_in_session)  
						FROM Showwcase.dbo.showwcase_sessions 
						)
GROUP BY bugs_in_session,customer_id;

/*We find customer 40572 part of the list with having one of the highest bugs encountered which is 5. 


Conclusion: The amount of bugs a customer experiences can impact their productivity and activity during a given session. 
Compared to the user with the longest duration they only experienced 6 bugs in total during the month of October. 
The user with the shortest duration had experienced 11 bugs in total during the month of October. 

Additional Metrics: 
Specifiy the date to be a weekend or weekday. 
What times during the day exhbited most/least activity. */