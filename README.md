git add .
git commit -c "commit message"
git push origin main

dbt run -s  models/snowflake --target snowflake --profiles-dir .