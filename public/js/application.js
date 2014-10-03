$(document).ready(function() {
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
});

function addStem(event) {
	$.ajax({
		url: '/add_stem',
		type: 'POST',
		data: $('#add_stem').serialize()
	})
	.done(function(data) {
		$('#my_stems').append(renderStem(data));
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
	var stemRow = '<tr id="'+Stem.id+ '"><td>'+Stem.track_name+'</td><td>'+Stem.download_url+'</td><td><input type="button" value="update"><input type="button" value="delete"></td></tr>';
	$('#my_stems').append(stemRow)
}

function addCircle(event) {
	$.ajax({
		url: '/add_circle',
		type: 'POST',
		data: $('#add_circle').serialize(),
	})
	.done(function(data) {
		renderCircle(data);
		console.log("success");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
}

function renderCircle(circle) {
	console.log(circle);
	var circleRow = '<tr id="'+circle.id+ '"><td>'+circle.name+'</td><td>'+circle.signup_deadline+'</td>  <td>'+circle.submit_deadline+'</td> <td>'+0+' remixes so far</td> <td><input type="button" value="update"><input type="button" value="delete"></td></tr>';
	$('#my_circles').append(circleRow)
}
	
	