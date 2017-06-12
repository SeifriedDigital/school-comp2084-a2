# Matntenance Minder
Matntenance Minder (asp.net)
http://comp2084-a2.azurewebsites.net/


Application Outline
  
Title: Maintenance Minder

Development: November 23rd - December 16th 2016

Development Team: Mathew Seifried https://mathew.codes

Description:
This application will be used to track vehicle and equipment maintenance such as repairs and regular servicing. The application will manage users and assets(vehicles/equipment).

Additional Information
- Errors are handled and redirected. Additionally they are logged and emailed to developer via ELMHA (http://elmah.github.io/). To view error log you must be logged in and then access it via rootdomain/elmah.axd. To test logging cause an error by inputting an invalid ID in url >100. SMTP settings are found in the web.config for log email reporting aswell as log viewing permission settings.
