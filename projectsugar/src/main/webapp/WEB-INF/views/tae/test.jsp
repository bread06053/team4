<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<meta name="google-signin-client_id" content="796949115397-ai1it1djvm2m96661au2tgt3e4ftk6l6.apps.googleusercontent.com">
<head>
<title>Insert title here</title>
</head>
<body>
<div class="g-signin2" data-onsuccess="onSignIn"></div>


<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}
</script>
<a href="#" onclick="signOut();">Sign out</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
</body>
</html>