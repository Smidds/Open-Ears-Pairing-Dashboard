$('.collapse').on('show.bs.collapse', function () {
    $('.collapse.in').collapse('hide');
});

function select(id, tag)
{
  document.getElementById(tag).innerHTML = id;
}

function sendOff(){

  var fid = document.getElementById("friendInput").innerHTML;
  var wid = document.getElementById("warriorInput").innerHTML;
  if(fid == wid){
    
  }

  $.ajax({
    url: 'pair.php',
    type: 'POST',
    data: {
        fID: fid,
        wID: wid
        // in PHP, use $_POST['yourData']
    },
    success: function(msg) {
        alert('Data returned from PHP: ' + msg);
    },
    error: function(msg) {
        alert('AJAX request failed!' + msg);
    }
  });

  /*
  //alert("friendID = " + fid + ", warriorID = " + wid)
  xhr.open("POST", url, true);
  //xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');

  /**
   * I've no idea what this does --
   * var response = xhr.responseText;

  xhr.onreadystatechange = function () {
    if(xhr.readyState == 4 && xhr.status == 200){
      document.getElementById("friendInput").innerHTML = "YAY!";

    }
    else if(xhr.readyState == 4 && xhr.status != 200){
      document.getElementById("friendInput").innerHTML = "DARN!";
    }
  };


  xhr.send("fid="+ fid + "&wid=" + wid );
  */
}


var sendButton = document.getElementById("submitPair");
sendButton.addEventListener("click", sendOff);
