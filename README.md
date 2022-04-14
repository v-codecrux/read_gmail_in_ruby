READ GMAIL messages.

1. Assuming you have access_token and refresh_token already.
2. Make sure you have right gmail api access to your project on google developer console.
3. Query is getting only last 1 hour's messages. Similarly you can set more search operators for the query. Please following this link [search operators].

This piece of code is handy when you are doing any background process with user's message but have taken their permissions from either mobile app or web. Once they have granted permission, your app will have their access token and refresh token.

'google/apis/gmail_v1' requires google-api-client gem

[search operators]: https://support.google.com/mail/answer/7190?hl=en
![alt text](https://github.com/v-codecrux/test_blog/blob/master/app/assets/images/authorclimber.JPG)
