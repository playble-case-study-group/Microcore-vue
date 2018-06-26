<html>
<head>
    {{-- Mobile Friendly --}}
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    {{-- Title --}}
    <title>Microcore</title>

    {{-- Meta fun! --}}
    <meta name="description" content="Educational simulation teaching technical writing to students in an engaging and fun environment. ">
    <meta name="keywords" content="education,technology,writing,byu,simulation,game">
    <meta name="author" content="Derek Hansen, Jon Balzotti, Daniel Ebeling">

    {{-- Bootstrap --}}
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    {{-- Favicon --}}
    <link rel="shortcut icon" href='favicon.ico' type="image/xicon">
    <link rel="icon" type="image/png" href="/images/MCFavicon.png">

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-78011219-1', 'auto');
        ga('send', 'pageview');
    </script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <img id="company_logo" src="/images/microcore_logo.png" alt="microcore logo">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <img id="company_lab" src="/images/WelcomeLab" alt="Microcore Lab">
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <a href="/home">
                <button id="enterSim_btn" class="btn btn-success"><h2 id="btnTitle">Enter Microcore Simulation</h2></button>
            </a>
        </div>
    </div>
    <div class="row">
        <div id="information_block" class="col-md-12">
            <br>
            <h1 class="home_title center">Learn more about the Microcre simulation!</h1>
            <br>
            <div class="row">
                <div class="col-md-8">
                    <p>Microcore, a virtualized case-study simulation, offers students the opportunity to participate in meaningful work experiences. These experiences are designed to give students an accurate look into the dynamics and expectations of professional communication.</p>
                    <p>Built by a collaborative effort between BYU’s English and IT departments, Microcore is a fictional medical tech firm which “hires” students as interns. Over the course of their internship, students will acquire professional communication skills through completing assignments identical to those that will be expected from them in their future careers, such as proposals and press releases.</p>
                </div>
                <div class="col-md-4">
                    <img class="home_img center" src="/images/BYU_noback.png" alt="byu logo"><br><br>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">

                    <img class="home_img center" src="/img/Virus3.png" alt="microbot">
                </div>
                <div class="col-md-8">
                    <p>The Microcore simulation focuses on creating an authentic experience that is also engaging and fun. Interesting characters and an interesting story arc help keep students engaged with the content they are learning. The web interface keeps things streamlined and organized while adding to the immersive nature of the simulation.</p>
                    <p>Through this simulated case-study, students will learn the genres of professional communication as well as become familiar with the different modes of learning that take place outside a classroom.</p>
                    <p>Microcore, a virtualized case-study simulation, offers students the opportunity to participate in meaningful work experiences. These experiences are designed to give students an accurate look into the dynamics and expectations of professional communication.</p>
                </div>

            </div>


        </div>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <p class="text-muted">Brigham Young University, Provo, UT 84602 - (801) 422-6300 - Copyright 2011, All Rights Reserved</p>
    </div>
</footer>
</body>
<style>
    #company_logo, #company_lab {
        width: 100%;
    }
    #company_logo {
        margin-top: 30px;
    }
    #company_lab {
        margin-top: 30px;
        height: 400px;
    }
    #enterSim_btn {
        margin-top: 30px;
        margin-bottom: 30px;
        width: 100%;
    }
    #information_block, .footer {
        background-color: #F1F1F1;
    }
    .footer {
        padding-top: 30px;
        padding-bottom: 30px;
        margin-top: 30px;
    }
    .home_title {
        color: #074165;
    }
    .home_img {
        max-width: 230px;
        margin-bottom: 30px;
    }
    .center {
        margin: auto;
        text-align: center;
    }
    #btnTitle {
        margin-top: 10px;
    }
</style>

</html>
