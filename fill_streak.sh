#!/bin/bash

# Define the start and end dates for the period January to September
start_date="2024-01-01"
end_date="2024-09-30"

echo "Start date: $start_date"
echo "End date: $end_date"

# Loop through each day from January 1st to September 30th
current_date=$start_date
while [ "$current_date" != "$(date -d "$end_date +1 day" +%Y-%m-%d)" ]; do
    # Set GIT_AUTHOR_DATE and GIT_COMMITTER_DATE to backdate the commit
    export GIT_AUTHOR_DATE="$current_date 12:00:00"
    export GIT_COMMITTER_DATE="$current_date 12:00:00"

    # Create or modify a file for the commit (e.g., append a line in a file)
    echo "Commit for $current_date" >> streak_demo.txt
    git add streak_demo.txt

    # Make the commit
    git commit -m "Backdated commit for $current_date"

    # Move to the next day
    current_date=$(date -d "$current_date +1 day" +%Y-%m-%d)
done
