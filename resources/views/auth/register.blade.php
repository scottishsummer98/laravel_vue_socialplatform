<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration</title>

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <style>
        body {
            background-image: linear-gradient(to right, darkgreen ,royalblue);
        }
    </style>
    </head>
    <body class="hold-transition register-page">
        <div id="app">
            <register-component />
        </div>
        <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>