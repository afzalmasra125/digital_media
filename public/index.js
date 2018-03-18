/* global Vue, VueRouter, axios */

var MoviesIndexPage = {
  template: "#movies-index-page",
  data: function() {
    return {
      movies:[]
    };
  },
  created: function() {
    axios.get("/movies")
      .then(function(response) {
        this.movies = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};
var MoviesShowPage = {
  template: "#movies-show-page",
  data: function() {
    return {
     movie:{}
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
var WatchNewPage = {
template: "#watchlist-new-page",
  data: function() {
    return {
      watchlist:[]
         };
  },
      created: function() {
    axios.post("/watchlists/")
     .then(function(response) {
          router.push("/");
      this.watchlists = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};
var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
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
var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
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
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: MoviesIndexPage },
    { path: "/movies", component: MoviesIndexPage },
    { path: "/movies/:id", component: MoviesShowPage },
    { path: "/watchlist", component: WatchlistIndexPage },
    { path: "/watchlist/new", component: WatchNewPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    {path: "/player/:id", component: PlayerShowPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});