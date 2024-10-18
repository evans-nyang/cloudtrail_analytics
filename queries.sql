-- Count the number of API calls made by each user in the last 24 hours
SELECT
  eventtime,
  useridentity.userName,
  COUNT(*)
FROM
  cloudtrail_logs
WHERE
  eventtime >= date_add('hour', -24, now())
GROUP BY
  eventtime,
  useridentity.userName
ORDER BY
  eventtime DESC

-- Find all failed API calls made by a specific user
SELECT
  eventtime,
  eventname,
  errorcode,
  errormessage
FROM
  cloudtrail_logs
WHERE
  eventtime >= date_add('day', -7, now())
  AND useridentity.userName = 'myuser'
  AND responseElements IS NOT NULL
  AND responseElements.error IS NOT NULL

-- Identify which EC2 instances were launched and terminated in the last week
SELECT
  eventtime,
  eventName,
  resourceType,
  resourceId
FROM
  cloudtrail_logs
WHERE
  eventtime >= date_add('day', -7, now())
  AND eventName IN ('RunInstances', 'TerminateInstances')
  AND resourceType = 'AWS::EC2::Instance'
ORDER BY
  eventtime DESC

-- Count the number of API calls made by each service in the last hour
SELECT
  eventtime,
  eventSource,
  COUNT(*)
FROM
  cloudtrail_logs
WHERE
  eventtime >= date_add('hour', -1, now())
GROUP BY
  eventtime,
  eventSource
ORDER BY
  eventtime DESC
