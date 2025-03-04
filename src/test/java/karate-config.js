function fn() {
  var config = {
    apiUrl: '[api_url]',
    apiToken: '',
    dbConnStr: 'sqlcmd -S [db_host] -U [db_username] -P [db_password] -d [default_db] -o testselect.out.txt -Q '
  };
  return config;
}