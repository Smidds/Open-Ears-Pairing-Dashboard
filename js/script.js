$('.collapse').on('show.bs.collapse', function () {
    $('.collapse.in').collapse('hide');
});

function select(id, tag)
{
  document.getElementById(tag).innerHTML = id;
}

function sendOff(){

  var fid = $("#friendInput").text();
  var wid = $("#warriorInput").text();
  if(fid == wid){
    alert("Um, no, they're the same. Sorry not sorry");
  }
  else{
    $.ajax({
      url: 'php/pair.php',
      type: 'POST',
      data: {
          fID: fid,
          wID: wid
          // in PHP, use $_POST['yourData']
      },
      success: function(msg) {
          alert('Data returned from PHP: ' + msg);
          location.reload();
      },
      error: function(msg) {
          alert('AJAX request failed!' + msg);
      }
    });
  }
}


function removePair(){

  var fid = $("#friendRemove").text();
  var wid = $("#warriorRemove").text();
  var rsn = document.getElementById("reasonInput").value;


  $.ajax({
    url: 'php/unpair.php',
    type: 'POST',
    data: {
        fID: fid,
        wID: wid,
        rsn: rsn
    },
    success: function(msg) {
        alert('Data returned from PHP: ' + msg);
        location.reload();
    },
    error: function(msg) {
        alert('AJAX request failed!' + msg);
    }
  });
}

$('#removePairModal').on('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = $(event.relatedTarget)

  // Extract info from data-* attributes
  var fid = button.data('friend')
  var wid = button.data('warrior')

  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).

  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.friendRemove').text(fid)
  modal.find('.warriorRemove').text(wid)

})

$('#removePairModal').on('hidden.bs.modal', function (e) {
  $(this)
    .find("textarea")
       .val('')
       .end()
})

var remove = document.getElementById("unpair");
remove.addEventListener("click", removePair);
var sendButton = document.getElementById("submitPair");
sendButton.addEventListener("click", sendOff);
