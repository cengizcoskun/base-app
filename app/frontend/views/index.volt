{# Template View | base-app | 1.2 #}
<!DOCTYPE html>
<html lang="{{ substr(i18n.lang(), 0, 2) }}">
    <head>
        <meta charset="utf-8">
        {{ getTitle() }}
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="{{ site_desc }}">

        {{ stylesheetLink('css/bootstrap.min.css') }}
        <style>
            body { padding-top: 70px; }
        </style>
        {{ assets.outputCss() }}

        <!-- Fav and touch icons -->
        <link rel="shortcut icon" href="{{ url.getStatic('favicon.ico') }}">
    </head>
    <body>
        <header class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    {{ linkTo([NULL, config.site.name, 'class' : 'navbar-brand']) }}
                </div>
                <div class="collapse navbar-collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">{{ linkTo(NULL, '<span class="glyphicon glyphicon-home"></span> ' ~ __('Home')) }}</li>
                    </ul>
                    {% if ! auth.logged_in() %}
                        {{ form('user/signin', 'class' : 'navbar-form pull-right') }}
                        {{ textField([ 'username', 'class' : 'form-control', 'style' : 'width: 200px', 'placeholder' : __('Username') ]) }}
                        {{ passwordField([ 'password', 'class' : 'form-control', 'style' : 'width: 200px', 'placeholder' : __('Password') ]) }}
                        <button type="submit" name="submit_signin" class="btn btn-default"><span class="glyphicon glyphicon-log-in"></span> {{ __('Sign in') }}</button>
                        {{ endForm() }}
                    {% else %}
                        <ul class="nav navbar-nav pull-right">
                            <li class="dropdown">
                                {{ linkTo([ '#', 'class' : 'dropdown-togle', 'data-toggle' : 'dropdown', auth.get_user().username ~ '<b class="caret"></b>' ]) }}
                                <ul class="dropdown-menu">
                                    <li class="dropdown-header">{{ auth.get_user().email }}</li>
                                    <li>{{ linkTo('user', '<span class="glyphicon glyphicon-user"></span> ' ~ __('Account')) }}</li>
                                    {% if auth.logged_in('admin') %}
                                        <li>{{ linkTo('admin', '<span class="glyphicon glyphicon-wrench"></span> ' ~ __('Admin panel')) }}</li>
                                    {% endif %}
                                    <li class="divider"></li>
                                    <li>{{ linkTo('user/signout', '<span class="glyphicon glyphicon-log-out"></span> ' ~ __('Sign out')) }}</li>
                                </ul>
                            </li>
                        </ul>
                    {% endif%}
                </div>
            </div>
        </header>
        
        <div class="container">
            {{ content() }}
        </div>
        
        <footer class="navbar navbar-default navbar-fixed-bottom">
            <div class="container">
                <p class="navbar-text">
                    {{ linkTo(NULL, config.site.name) }} &copy; {{ date('Y') }}
                    <span class="text-muted"> | Phalcon {{ version() }}</span>
                </p>
                <ul class="nav navbar-nav pull-left">
                    <li>{{ linkTo('user/signup', __('Sign up')) }}</li>
                </ul>
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown">
                        {{ linkTo([ '#', 'class' : 'dropdown-togle', 'data-toggle' : 'dropdown', __('Language') ~ '<b class="caret"></b>' ]) }}
                        <ul class="dropdown-menu">
                            <li>{{ linkTo('lang/set/en-gb', __('English')) }}</li>
                            <li>{{ linkTo('lang/set/pl-pl', __('Polish')) }}</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </footer>
        
        {{ javascriptInclude('js/jquery.min.js') }}
        {{ javascriptInclude('js/bootstrap.min.js') }}
        
        <!-- Enable responsive features in IE8 -->
        <!--[if lt IE 9]>
        {{ javascriptInclude('js/respond.js') }}
        <![endif]-->
        
        {{ assets.outputJs() }}
    </body>
</html>