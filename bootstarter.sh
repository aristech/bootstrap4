#!/bin/bash

clear
echo "Hello, what's the name of the bootstrap workplace you want to create?"
read ans
sleep 2
echo "Please wait while i create $ans in the Documents folder"
sleep 2
cd ..
mkdir $HOME/Documents/$ans && cd $HOME/Documents/$ans
npm init -y
npm i gulp browser-sync gulp-sass gulp-uglify --save-dev
npm i bootstrap jquery popper.js --save
mkdir $HOME/Documents/$ans/src
mkdir $HOME/Documents/$ans/src/assets
mkdir $HOME/Documents/$ans/src/css
mkdir $HOME/Documents/$ans/src/js
mkdir $HOME/Documents/$ans/src/customjs
mkdir $HOME/Documents/$ans/src/scss
cat > $HOME/Documents/$ans/src/index.html << EOL
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <title>Bootstrap 4 Layout</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,800">
        <link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="/css/bootstrap.css">
        <link rel="stylesheet" href="/css/styles.css">
    </head>

    <body>
        <div class="container">
            <section id="navigation">    
                <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                    <a class="navbar-brand" href="#">CompanyName</a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link  text-sm-right" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#info">About</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">
                                    Products
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Product 1</a>
                                    <a class="dropdown-item" href="#">Product 2</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Another Product</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </section>     
            <section id="jumbo">
                <div class="jumbotron">
                    <h1 class="display-4">Simple. Elegant. Awesome.</h1>
                    <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
                
                    <p class="lead">
                        <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
                    </p>
                </div>
            </section>
            <section id="elements">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">Some quick example text to build on the card title</p>
                                    <a href="#" class="card-link">Another link</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">Some quick example text to build on the card title</p>
                                    <a href="#" class="card-link">Another link</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">Some quick example text to build on the card title</p>
                                    <a href="#" class="card-link">Another link</a>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
            <section id="info">
                    <div class="row mt-sm-4 mt-md-0">
                            <div class="col-sm-12 col-md-8 text-sm-center text-md-left">
                            <h3>An important heading</h3>
                            <p class="lead">A sort of important subheading can go here, which is larger and gray.</p>
                    
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                        </div>
                    
                        <div class="col-sm-12 col-md-4">
                            <h3 class="mb-4">Secondary Menu</h3>
                    
                            <ul class="nav flex-column nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Active</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Link</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Link</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">Disabled</a>
                                </li>
                            </ul>
                        </div>
                    </div>
            </section>
        </div>   
        <script src="/js/jquery.min.js"></script>
        <script src="/js/popper.min.js"></script>
        <script src="/js/bootstrap.min.js"></script>
        <script src="/js/custom.js"></script>
    </body>
</html>
EOL
cat > $HOME/Documents/$ans/gulpfile.js << EOL
var gulp        = require('gulp');
var browserSync = require('browser-sync').create();
var sass        = require('gulp-sass');
var uglify 		= require("gulp-uglify");


// watch custom js files
gulp.task('minify-js', function () {
	return gulp.src('src/customjs/*.js')
		.pipe(uglify())
        .pipe(gulp.dest("src/js"))
        .pipe(browserSync.stream());
});

// Compile sass into CSS & auto-inject into browsers
gulp.task('sass', function() {
    return gulp.src(['node_modules/bootstrap/scss/bootstrap.scss', 'src/scss/*.scss'])
        .pipe(sass())
        .pipe(gulp.dest("src/css"))
        .pipe(browserSync.stream());
});


// Move the javascript files into our /src/js folder
gulp.task('js', function() {
    return gulp.src(['node_modules/bootstrap/dist/js/bootstrap.min.js', 'node_modules/jquery/dist/jquery.min.js', 'node_modules/popper.js/dist/umd/popper.min.js','customjs/*.js'])
        .pipe(gulp.dest("src/js"))
        .pipe(browserSync.stream());
});

// Static Server + watching js/scss/html files
gulp.task('serve', ['sass', 'minify-js'], function() {

    browserSync.init({
        server: "./src"  
    });

    gulp.watch(['node_modules/bootstrap/scss/bootstrap.scss', 'src/scss/*.scss'], ['sass']);
    gulp.watch(['src/customjs/*.js'],['minify-js']);
    gulp.watch("src/*.html").on('change', browserSync.reload);
	gulp.watch("src/js/*.js").on('change', browserSync.reload);
});

gulp.task('default', ['serve']);
EOL
cat > $HOME/Documents/$ans/src/customjs/custom.js << EOL
//write your custom js scripts here and they will be minified in the /js folder
EOL
cat > $HOME/Documents/$ans/src/js/custom.js << EOL
//write your custom js scripts in the /src/customjs/custom.js file 
and they will be minified in here automtically
EOL
cat > $HOME/Documents/$ans/src/scss/styles.scss << EOL
// Variable Overrides 

//\$body-bg: #ededed;

//.jumbotron {
//    background-color: #ffffff !important;
//    border-top: 3px solid rgb(10, 35, 175);
//}

// Bootstrap Sass Imports!
EOL
cd $HOME/Documents/$ans
clear
echo "Ok, so far so good. Your new project should be inside your Documents folder."
sleep 1
echo "Let's run this baby on the browser in:"
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
gulp

