#!/usr/bin/env bash
# Upload dSYMs to Sentry.
# https://docs.sentry.io/platforms/cocoa/dsym/?_ga=2.246369603.69609480.1590971154-674475966.1590564131#dsym-with-bitcode
# 
# Input environment variables:
#    - SENTRY_AUTH_TOKEN: Auth Token that is generated on https://sentry.io/settings/account/api/auth-tokens/
#                      (I do not know what scopes are required, but I set the socopes below and upload-dif goes sucessfully:
#                       event:admin, event:read, member:read, org:read, project:read, project:releases, team:read, project:write, event:write)
#    - SENTRY_ORG: Your organization's name. i.e. if your sentry URL is https://sentry.io/organizations/example, your organization name is "example".
#    - SENTRY_PROJ: Your project's name. Please see https://sentry.io/organizations/your-organization-name/projects/
#    - BITRISE_DSYM_PATH: It is set automatically after the step 'Xcode Archive & Export for iOS'.

# fail if any commands fails
set -e
# debug log
set -x

# Install sentry-cli if not exist.
if ! which sentry-cli > /dev/null; then
        curl -sL https://sentry.io/get-cli/ | bash
fi

# Upload last dSYM to sentry.io.
sentry-cli --auth-token "$SENTRY_AUTH_TOKEN" upload-dif --org "$SENTRY_ORG" --project "$SENTRY_PROJ" "$BITRISE_DSYM_PATH"



