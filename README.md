# terraform-remote-state-s3
Example on remote state setup for terraform

main.tf file has code for setting up s3 bucket and terraform backend code to read from the same bucket.
Since both codes are not executing in same apply, have to figure out way to execute setup code one by one probably by module or different script.
Right now s3 bucket creation code is commented out.
