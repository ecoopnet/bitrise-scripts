# bitrise-scripts
bitrise.io script collection.

## iOS-dSYM-upload-to-Sentry.sh
Upload dSYMs file to Sentry for iOS.

### Input environment variables:

- `SENTRY_AUTH_TOKEN`
   Auth Token that is generated on https://sentry.io/settings/account/api/auth-tokens/
- `SENTRY_ORG`
   Your organization's name. i.e. if your sentry URL is https://sentry.io/organizations/example, your organization name is "example".
- `SENTRY_PROJ`
   Your project's name. Please see https://sentry.io/organizations/your-organization-name/projects/
- `BITRISE_DSYM_PATH`
   It is set automatically after the step 'Xcode Archive & Export for iOS'.

