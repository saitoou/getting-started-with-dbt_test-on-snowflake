SHOW TABLES IN DATABASE tasty_bytes_dbt_db;

SHOW VIEWS IN DATABASE tasty_bytes_dbt_db;

SHOW DBT PROJECTS LIKE 'tasty%';


SHOW NETWORK RULES IN SNOWFLAKE.NETWORK_SECURITY;




  GRANT ROLE ACCOUNTADMIN TO USER github_actions_service_user;

  ALTER USER github_actions_service_user SET DEFAULT_WAREHOUSE = 'tasty_bytes_dbt_wh';


  CREATE NETWORK POLICY github_actions_policy
  ALLOWED_NETWORK_RULE_LIST = ('SNOWFLAKE.NETWORK_SECURITY.GITHUBACTIONS_GLOBAL')
  BLOCKED_NETWORK_RULE_LIST = ();

ALTER USER GitHub_Actions_Service_User
  SET NETWORK_POLICY = github_actions_policy;

SHOW PARAMETERS LIKE 'NETWORK_POLICY' FOR USER github_actions_service_user;

use role accountadmin;

alter user github_actions_service_user

show user workload identity authentication methods
for user github_actions_service_user;