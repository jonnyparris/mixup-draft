$(document).ready(function() {
  $('.signup').on('click', function(event) {
    event.preventDefault();
    console.log('signup form');
  });
  $('.login').on('click', function(event) {
    event.preventDefault();
    console.log('login form');
  });

  $('button').on('click', function(event) {
    event.preventDefault();
    switch(event.target.className) {
        case 'add_stem':
            console.log('trying to add a stem');
            addStem()
            break;
        case 'add_circle':
            console.log('trying to add a circle');
            addCircle()
            break;
    }
  });

  $('.side-nav #stems').on('click', function(event) {
    event.preventDefault();
    $('#stems_partial').show(400)
    $('#circles_partial').hide(400)
    $('#single_circle_partial').hide(400)
  });

  $('.side-nav #circles').on('click', function(event) {
    event.preventDefault();
    $('#stems_partial').hide(400)
    $('#circles_partial').show(400)
    $('#single_circle_partial').hide(400)
  });

  $('#my_circles .circle_row').on('click', function(event) {
    console.log('selected circle: '+event.target.parentNode.parentNode.id);
    var circle_id = event.target.parentNode.parentNode.id;
    $('#single_circle_partial').toggle(400)
    $('#circles_partial').hide(400)
  });

  $('#single_circle_partial > a').on('click', function(event) {
    event.preventDefault();
    console.log(event.target.parentNode.parentNode.id);
    $('#single_circle_partial').hide(400)
    $('#circles_partial').show(400)
  });

  $('#join_circle').on('click', function(event) {
      event.preventDefault();
      console.log(event);
      console.log(event.target.className);
      var stemSubmitPacket = {circle_id: event.target.className, stem_name: event.target.innerText};
      submitStem(stemSubmitPacket);
  });

  $('#mixup_circle').on('click', function(event) {
      event.preventDefault();
      console.log(event);
      console.log('selected circle for mixup: '+event.target.className);
      var circlePacket = {circle_id: event.target.className};
      mixupCircle(circlePacket);
  });

  $('#submit_remix').on('click', function(event) {
      event.preventDefault();
      console.log(event);
      console.log('selected circle for reimx submission: '+event.target.className);
      var circlePacket = {circle_id: event.target.className};
      submitRemix(circlePacket);
  });

});

function addStem(event) {
    $.ajax({
        url: '/add_stem',
        type: 'POST',
        data: $('#add_stem').serialize()
    })
    .done(function(data) {
        $('#stems_partial').remove()
        $('#dashboard_main').append(data);
        console.log("success");
    })
    .fail(function() {
        console.log("error");
    })
    .always(function() {
        console.log("complete");
    });
}

function renderStem(Stem) {
    console.log(Stem);
    var stemDiv = '<div id="'+Stem.id+'"><h4>'+Stem.track_name+'</h4><p><a href="'+Stem.download_url+'">'+Stem.download_url+'</a></p></div>';
    $('.my_stems').append(stemDiv)
}

function addCircle(event) {
    $.ajax({
        url: '/add_circle',
        type: 'POST',
        data: $('#add_circle').serialize(),
    })
    .done(function(data) {
        $('#circles_partial').remove()
        $('#dashboard_main').append(data);
        $('#circles_partial').show()
        console.log("success");
    })
    .fail(function() {
        console.log("error");
    })
    .always(function() {
        $('input').prop('disabled', false);
        console.log("complete");
    });
}

function renderCircle(circle) {
    console.log(circle);
    var circleRow = '<tr id="'+circle.id+ '"><td><a href="#">'+circle.name+'</a></td><td>'+circle.signup_deadline+'</td>  <td>'+circle.submit_deadline+'</td> <td>'+0+' remixes so far</td> <td><input type="button" value="update"><input type="button" value="delete"></td></tr>';
    $('#my_circles').append(circleRow)
}

function submitStem(stemSubmitPacket) {
    $.ajax({
        url: '/circles/'+stemSubmitPacket.circle_id+'/stems',
        type: 'POST',
        data: stemSubmitPacket,
    })
    .done(function() {
        console.log("success");
    })
    .fail(function() {
        console.log("error");
    })
    .always(function() {
        console.log("complete");
    });
    
}

function mixupCircle(circlePacket) {
    $.ajax({
        url: '/circles/'+circlePacket.circle_id+'/mixup',
        type: 'POST',
        data: circlePacket,
    })
    .done(function(data) {
        console.log('Which stem do I have to remix? '+data.producer.track_name);
        renderRemixTodo(data)
        console.log("success");
    })
    .fail(function() {
        console.log("error");
    })
    .always(function() {
        console.log("complete");
    });
    
}
    
function renderRemixTodo(data) {
    $('#mixup_modal').append('<hr>');
    $('#mixup_modal').append('<p>'+data.producer.track_name+'</p>');
    $('#mixup_modal').append('<a href="'+data.producer.download_url+'">'+data.producer.download_url+'</a></p>');
}

function submitRemix(circlePacket) {
    console.log('submit remix to database');
}
    