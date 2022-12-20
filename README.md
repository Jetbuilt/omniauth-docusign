# OmniAuth DocuSign

![Gem](https://img.shields.io/gem/v/omniauth-docusign.svg)
![CI](https://img.shields.io/github/actions/workflow/status/Jetbuilt/omniauth-docusign/ci.yml?branch=main)

This is an unofficial OmniAuth strategy for authenticating to DocuSign. To get started, sign up
for a DocuSign sandbox account.

## Basic Usage

    use OmniAuth::Builder do
      provider :docusign, ENV['DOCUSIGN_CLIENT_ID'], ENV['DOCUSIGN_CLIENT_SECRET'], sandbox: true
    end

## Auth Hash

The hash in `env['omniauth.auth']` will have the following information:

- in `credentials`:
  - `token`: The access token.
  - `refresh_token`: The refresh token. Use this to get a new token when the one in `token` has been expired.
  - `expires_at`: Timestamp that indicates when `token` will expire.
  - `expires`: `true`
- in `extra`:
  - in `user_info`: The complete response from the `/oauth/getuserinfo` endpoint.
- in `info`:
  - `uid`: The `accountId` of the first account returned by the /oauth/getuserinfo endpoint.
  - `name`: The full name of the user_info
  - `email`: The email of the user
  - `base_uri`: The base uri that should be used to access the API for this user

- in `uid`: The account id of the first account the user belongs to

## See Also

https://docs.docusign.com/esign/ has the DocuSign API documentation.
