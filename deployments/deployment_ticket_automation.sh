# Jira Config
JIRA_URL="https://jira.storage.hpecorp.net/"
JIRA_USER=""
JIRA_TOKEN=""

# Jira Issue Info
# TODO: Replace human readable strings with associated IDs, dropdown in UI means we have 'enums' in backend
PROJECT_KEY="CDS DevOps (CDSDO)"
ISSUE_TYPE="Service Request"
COMPONENTS="Deployment"
ENGINEERING_TEAM="DSCC Common Services"

# Service / Version Info
read -p "Microservice name: " MICROSERVICE_NAME
read -p "Target environment (scdev, scint, prod): " TARGET_ENVIRONMENT
read -p "Current version: " CURRENT_VERSION
read -p "Upgrade version: " UPGRADE_VERSION

# Summary / Description
SUMMARY="Deploy $MICROSERVICE_NAME $UPGRADE_VERSION to $TARGET_ENVIRONMENT"
DESCRIPTION="Microservice: $MICROSERVICE_NAME
Target Environment: $TARGET_ENVIRONMENT
Current version: $CURRENT_VERSION
Upgrade version: $UPGRADE_VERSION
List of changes: TODO"

printf "\nSummary: \n%s\n" "$SUMMARY"
printf "\nDescription: \n%s\n" "$DESCRIPTION"

# TODO: Scrape Current Version Tag

# TODO: Scrape Github Commit Messages

# Construct Jira Issue JSON
# JSON_PAYLOAD=$(jq -n \
#     --arg project "$PROJECT_KEY" \
#     --arg type"$ISSUE_TYPE" \
#     --arg summary "$SUMMARY" \
#     --arg components "$COMPONENTS" \
#     --arg team "$ENGINEERING_TEAM" \
#     --arg description "$DESCRIPTION" \
#     '{
#         fields : {
#             project: { key : $project },
#             issueType: { name: $issueType },
#             summary: $summary,
#             components: [{ id: $componenets }],
#             engineering_team: $team
#             description: $description
#         }
#     }'
# )

# Invoke Jira Post API
# RESPONSE=$(curl -s -X POST |
#     --url "$JIRA_URL/rest/api/2/issue/" \
#     --user "$JIRA_USER:$JIRA_TOKEN" \
#     --header "Content-Type: application/json" \
#     --data "$JSON_PAYLOAD"
# )

# Error Checks & Issue ID Return
# ISSUE_ID=$(echo "$RESPONSE" | jq -r '.key')
# if [[ "$ISSUE_ID" != "null" ]]; then
#     echo "Jira Issue: $JIRA_URL/browse/$ISSUE_ID
# else
#     echo "Could not post Jira Issue: $RESPONSE"
# fi
