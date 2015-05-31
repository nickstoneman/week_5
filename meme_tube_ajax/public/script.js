// add a <li> to the #todo-list
function appendNewVideo(data) {
  $("<p>" + data.artist + ' -- ' + data.title + ' -- ' + data.description + ' -- ' + data.category + ' -- ' + data.genre + ' -- ' + data.url + "</p>").prependTo("#video-details");
  $("#iframe-container").append('<iframe width="200" height="200" src="https://www.youtube.com/embed/"' + data.url + '" frameborder="0" allowfullscreen></iframe>');
  console.log(data.url);
  }




function getVideos() {
  // Ajax request to get videos
  $.ajax({
    type: 'GET',
    url: '/videos',
    dataType: 'json'
  }).done(function(data){
    $.each(data, function(index, artist) {
      appendNewVideo(artist);
    })
  })
}

function createVideo() {
  console.log('createVideo')
  var artistData = $('#new-video').val();
  var titleData = $('#new-video').val();
  var descriptionData = $('#new-video').val();
  var categoryData = $('#new-video').val();
  var genreData = $('#new-video').val();
  var urlData = $('#new-video').val();
  $.ajax({
    type: 'POST',
    url: '/videos',
    dataType: 'json',
    data: {artist: artistData, title: titleData, description: descriptionData, category: categoryData, genre: genreData, url: urlData}
  }).done(function(data){
    appendNewVideo(data);
    $('#new-video').val('');
  })
}




$(document).ready(function() {
  getVideos();
  $('#new-video').on('keypress', function(event) {
    if(event.which == 13) {
      createVideo();
    }
  })
}) // Doc Ready Ends