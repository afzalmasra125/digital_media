/* global Vue, VueRouter, axios */

var MoviesIndexPage = {
  template: "#movies-index-page",
  data: function() {
    return {
      movies:[],
      movie_id: ""
    };
  },
  created: function() {
    axios.get("/movies")
      .then(function(response) {
        this.movies = response.data;
      }.bind(this));
  },
  methods: {
        submit: function(movie_id){
          var params = {
            movie_id: movie_id
          };
           axios.post("/watchlists/", params)
          .then(function(response) {
            console.log(response);
            router.push("/watchlist");
            })
          }.bind(this)

  },
  computed: {}
};
var MoviesShowPage = {
  template: "#movies-show-page",
  data: function() {
    return {
     movie:{},
     movies_collection:false
      };
  },
  created: function() {
    if (this.$route.params.movie_name){
    axios.get("/movies/" + this.$route.params.id)
      .then(function(response) {
        this.movie = response.data;   
      }.bind(this));
    } else {
        axios.get("/collection/" + this.$route.params.id) 
        .then(function(response) {
          console.log(response);
        this.movie = response.data;  
        this.movies_collection = true;
      }.bind(this));
    }
  },
  methods: {
     submit: function(movie_id){
          var params = {
            movie_id: movie_id
          };
           axios.post("/watchlists/", params)
          .then(function(response) {
            console.log(response);
            router.push("/watchlist");
            })
          }.bind(this)
  },
  computed: {}
};
var WatchlistIndexPage = {
template: "#watchlist-index-page",
  data: function() {
    return {
      watchlists:[]
         };
  },created: function() {
    axios.get("/watchlists")
      .then(function(response) {
        this.watchlists = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
  };
var RequestMovieIndexPage = {
  template: "#request-page",
  data: function() {
    return {
      movie_name: "",
      year: "",
      actor: "",
      genre: ""
    };
  },
  methods: {
    submit: function() {
      var params = {
        movie_name: this.movie_name,
        year: this.year,
        actor: this.actor,
        genre: this.genre
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
   }
  };

  var WatchlistsDestroyPage = {
  created: function() {
    axios.delete("/watchlists/" + this.$route.params.id)
      .then(function(response) {
        router.push("/#/movies");
      });
  }
}

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      passwordconfirmation: "",
      errors: [],
      // isLoginDisabled:true
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordconfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
          // isLoginDisabled:true;
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
   }
  };
  var PlayerShowPage = {
    template: "#player-show-page",
  data: function() {
    return {
     movie: {}
      };
  },
  created: function() {
    axios.get("/movies/" + this.$route.params.id)
      .then(function(response) {
        this.movie = response.data;
      }.bind(this));
       },
  methods: {},
  computed: {}
};
var BrowseIndexPage = {
  template: "#browse-index-page",
  data: function() {
    return {
      movies:[]
    };
  },
  created: function() {
    axios.get("/collection")
      .then(function(response) {
        this.movies = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};
var TVShowsIndexPage = {
  template: "#tvshows-index-page",
  data: function() {
    return {
      tvshows:[]
    };
  },
  created: function() {
    axios.get("/tvshows")
      .then(function(response) {
        this.tvshows = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};


var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: [],
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};
var LogoutPage = {
  template: "#logout-page",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/logout");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: MoviesIndexPage },
    { path: "/movies", component: MoviesIndexPage },
    { path: "/movies/:id/:movie_name", component: MoviesShowPage },
     { path: "/movies/:id", component: MoviesShowPage },
    { path: "/watchlist", component: WatchlistIndexPage },
    { path: "/watchlist/:id/delete", component: WatchlistsDestroyPage },
    // { path: "/watchlist/new", component: WatchNewPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/player/:id", component: PlayerShowPage},
    { path:"/browse/", component: BrowseIndexPage},
    { path:"/tvshows/", component: TVShowsIndexPage},
    { path:"/requestmovie", component: RequestMovieIndexPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  data: function() {
    return {isLoggedIn: false}
  },
  router: router,
  created: function () {
   var jwt = localStorage.getItem("jwt");
   if (jwt) {
     this.isLoggedIn = true;
     axios.defaults.headers.common["Authorization"] = jwt;
   }
 }
});