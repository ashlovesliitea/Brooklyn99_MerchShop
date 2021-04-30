var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
var player2;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {

    videoId: 'sEOuJ4z5aTc',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });

  player2 = new YT.Player('player2', {

   playerVars:{
       listType:'playlist',
       list:'PLBRsMixIwVu6MMFMN_Z1iBuGYT0jtdBsK',
       rel:0
   }}
  );
  
player3 = new YT.Player('player3', {

  playerVars:{
      listType:'playlist',
      list:'PLBRsMixIwVu7GKSDy8cCnLj15UDieKhhn',
      rel:0
  }}
 );
 
}


function onPlayerReady(event) {
    event.target.playVideo();
  }
  
  var done = false;
  function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !done) {
      done = true;
    }
  }
