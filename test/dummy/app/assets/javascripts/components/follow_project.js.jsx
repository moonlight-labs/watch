var FollowProject = React.createClass(
  {
    displayName: 'Watch Button',
    mixins: [FollowMixin],

    propTypes: {
      target_id: React.PropTypes.number,
      target_type: React.PropTypes.string
    },

    getDefaultProps: function() {
      return { 
        target_id: 0,
        target_type: "Firm"
      };
    },

    is_following: function() {
      //return true;
      
      return Math.floor((Math.random() * 100) + 1) % 2 === 0;

      // $.get("/projects/" + this.props.following_id + "/following", function(data) { return(/true/.test(data)) });
    },

    follow: function() { 
      var url = "/watch/" + this.props.target_type + "/" + this.props.target_id + "/on";
      $.get(url);
    },

    unfollow: function() { 
      var url = "/watch/" + this.props.target_type + "/" + this.props.target_id + "/off";
      $.get(url);
    },
  }
);
