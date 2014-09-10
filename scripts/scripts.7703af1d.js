(function(){"use strict";angular.module("dallceApp",["ngAnimate","ngCookies","ngStorage","ui.router","ngSanitize","ngTouch","ui.bootstrap","restangular","Satellizer"]).config(["$urlRouterProvider","$stateProvider","$locationProvider","RestangularProvider","settings",function(a,b,c,d,e){return c.html5Mode(!0),d.setBaseUrl(e.apiUrl),a.otherwise("/"),b.state("main",{url:"/",templateUrl:"views/main.html",controller:"MainCtrl"}).state("about",{url:"/about",templateUrl:"views/about.html",controller:"AboutCtrl"}).state("login",{url:"/login",templateUrl:"views/login.html",controller:"LoginCtrl"}).state("register",{url:"/register",templateUrl:"views/register.html",controller:"SignUpCtrl"}).state("career",{url:"/career/:id",templateUrl:"views/career.html",controller:"careerCtrl"})}])}).call(this),function(){"use strict";angular.module("dallceApp").controller("MainCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this),function(){"use strict";angular.module("dallceApp").controller("AboutCtrl",["$scope","Restangular",function(a,b){return a.baseCareers=b.all("careers"),a.careers=a.baseCareers.getList().$object,a.saveCareer=function(b){return a.baseCareers.post(b).then(function(b){return a.careers.push(b),console.log(b)},function(){return console.log("shit")})},a["delete"]=function(b){return b.remove().then(function(){return a.careers=_.without(a.careers,b)})}}]),angular.module("dallceApp").controller("careerCtrl",["$scope","Restangular","$stateParams",function(a,b,c){return b.one("careers",c.id).get().then(function(b){return a.career=b}),a.saveCareer=function(b){return a.baseCareers.post(b).then(function(b){return a.careers.push(b),console.log(b)},function(){return console.log("shit")})},a["delete"]=function(b){return b.remove().then(function(){return a.careers=_.without(a.careers,b)})}}])}.call(this),function(){"use strict";angular.module("dallceApp").directive("userPanel",function(){return{templateUrl:"views/user_panel.html",restrict:"EA",replace:!0,transclude:!0,controller:"LoginCtrl"}}),angular.module("dallceApp").directive("dcMatch",function(){return{restrict:"A",scope:!0,require:"ngModel",link:function(a,b,c,d){var e;return e=function(){var b,d;return b=a.$eval(c.ngModel),d=a.$eval(c.dcMatch),b===d},a.$watch(e,function(a){return d.$setValidity("unique",a)})}}})}.call(this),function(){"use strict";angular.module("dallceApp").controller("LoginCtrl",["$scope","auth",function(a,b){return a.user=b.info(),a.credentials={},a.signIn=function(){return b.signIn(a.credentials)},a.signOut=function(){return b.signOut()}}]),angular.module("dallceApp").controller("SignUpCtrl",["$scope","auth",function(a,b){return a.user=b.info(),a.credentials={},a.signUp=function(){return b.signUp(a.credentials)}}])}.call(this),function(){"use strict";angular.module("dallceApp").factory("auth",["$localStorage","$http","$state","settings",function(a,b,c,d){return null==a.currentUser&&(a.currentUser={signedIn:!1,token:""}),b.defaults.headers.common["Auth-Token"]=a.currentUser.token,{signIn:function(e){return b.post(d.apiUrl+"/auth/login",e).success(function(d){return a.currentUser.token=d.authentication_token,a.currentUser.id=d.id,a.currentUser.email=d.email,a.currentUser.signedIn=!0,b.defaults.headers.common["Auth-Token"]=a.currentUser.token,c.go("main")})},signOut:function(){return a.currentUser.signedIn=!1,a.currentUser.token="",b.defaults.headers.common["Auth-Token"]=""},signUp:function(e){return b.post(d.apiUrl+"/auth/signup",e).success(function(d){return a.currentUser.token=d.authentication_token,a.currentUser.id=d.id,a.currentUser.email=d.email,a.currentUser.signedIn=!0,b.defaults.headers.common["Auth-Token"]=a.currentUser.token,c.go("main")})},info:function(){return a.currentUser}}}])}.call(this),function(){"use strict";angular.module("dallceApp").constant("settings",{apiUrl:"http://dallce.scixiv.com/api/v1"})}.call(this);