
/*ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN session_duration int;

ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN login_date date;*/

 
    /* 6 LOGINS WITH HIGHEST DURATION = 2381 AND LOWEST DURATION 32 */ 
	/* What about those durations? what about the comments, likes, adds, and bugs*/


/*ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN session_projects_added int;

ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN session_likes_given int;

ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN session_comments_given int;


 SELECT 
	customer_id = 40572,
		session_duration = 2381, 
	session_comments_given,
	session_likes_given,
	session_projects_added
 FROM Showwcase.dbo.showwcase_sessions
 WHERE projects_added = 'TRUE' and 
	comment_given = 'TRUE' and
	likes_given = 'TRUE' 
	 ORDER BY session_likes_given ASC, session_projects_added ASC, session_comments_given DESC;*/

/*   
We want to see the highest session duration for a given user. 
RESULTS: customer_id = 87265, session_id = 84773
*/

/*SELECT 
	customer_id, session_id, session_duration
FROM Showwcase.dbo.showwcase_sessions
WHERE session_duration= ( SELECT MAX(session_duration) 
						FROM Showwcase.dbo.showwcase_sessions);*/


/* 
what did the user do during this duration. COMMENTS? LIKES? PROJECTS? 
IT SHOWS US THAT ALL 3 PARAMETERS FOR USAGE IS MET.
*/

/*SELECT 
	likes_given, 
	comment_given, 
	projects_added
FROM Showwcase.dbo.showwcase_sessions
WHERE 	
    customer_id = 87265 and
	session_id = 84773 and
	session_duration = 2395;*/

/*
	was there any bug errors?
	THERE WAS ZERO.
	*/


/*SELECT bugs_in_session
FROM Showwcase.dbo.showwcase_sessions
	WHERE session_id= 84773;*/



/*ALTER TABLE Showwcase.dbo.showwcase_sessions
	ALTER COLUMN inactive_duration int;*/

/*SELECT AVG(inactive_duration) as inactive_duration_avg
	FROM Showwcase.dbo.showwcase_sessions;*/

/*SELECT AVG(session_duration) as session_duration_avg
	FROM Showwcase.dbo.showwcase_sessions;*/



/* lowest session duration is 10
	customer id= 51243, session id= 74484*/

/*SELECT 
session_duration,
customer_id,
session_id
FROM Showwcase.dbo.showwcase_sessions
WHERE session_duration= ( SELECT MIN(session_duration) 
						FROM Showwcase.dbo.showwcase_sessions
						WHERE session_duration<>0);*/


 /*highest amount of bugs?*/
/*SELECT bugs_in_session, customer_id
FROM Showwcase.dbo.showwcase_sessions
WHERE bugs_in_session = (SELECT MAX(bugs_in_session)  
						FROM Showwcase.dbo.showwcase_sessions 
						)
GROUP BY bugs_in_session,customer_id;*/



	

	
  


 
 

	
	



	