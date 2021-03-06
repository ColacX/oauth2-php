<?php
echo "PHP START\n";

require './vendor/autoload.php';

$provider = new TheNetworg\OAuth2\Client\Provider\Azure([
    'clientId'          => '8fbd8511-110a-4cf5-b6a2-22a806b5faed',
    'clientSecret'      => 'mnoHfGFXklDLL4cVkwWJNKgQOH5XX9y3DL4M6R4p5xE=',
    'redirectUri'       => 'http://vustebifru.azurewebsites.net/test.php'
]);

if (!isset($_GET['code'])) {

    // If we don't have an authorization code then get one
    $authUrl = $provider->getAuthorizationUrl();
    $_SESSION['oauth2state'] = $provider->getState();
    header('Location: '.$authUrl);
    exit;

// Check given state against previously stored one to mitigate CSRF attack
}
elseif (empty($_GET['state']) || ($_GET['state'] !== $_SESSION['oauth2state'])) {

    unset($_SESSION['oauth2state']);
    exit('Invalid state');

}
else {

    // Try to get an access token (using the authorization code grant)
    $token = $provider->getAccessToken('authorization_code', [
        'code' => $_GET['code'],
        'resource' => 'https://graph.windows.net',
    ]);

    // Optional: Now you have a token you can look up a users profile data
    try {

        // We got an access token, let's now get the user's details
        $me = $provider->get("me", $token);

        // Use these details to create a new profile
        printf('Hello %s!', $me['givenName']);

    } catch (Exception $e) {

        // Failed to get user details
        exit('Oh dear...');
    }

    // Use this to interact with an API on the users behalf
    echo $token->getToken();
}

echo "PHP FINISH\n";
?>
