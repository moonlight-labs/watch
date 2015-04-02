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

      var t = this;

      $.ajax({
        url:      '/me.json',
        dataType: 'json',
        success: function(data) {
          console.log(data);
          var bloom = new JsonBloomfilter(data.watch_bloom);
          var result = bloom.test([t.props.target_type, t.props.target_id]);
          t.setState({following: result});
        }
      });
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
