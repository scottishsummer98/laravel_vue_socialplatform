<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>My Template</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Nunito', sans-serif;
                background-image: linear-gradient(to right, darkgreen ,royalblue);
            }
        </style>
    </head>
    <body class="antialiased">
        <div id="app">
            <frontend-component />
        </div>
        <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>
