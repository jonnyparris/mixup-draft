$(document).ready(function() {
  $('button').on('click', function(event) {
  	event.preventDefault();
  	console.log('adding a new stem');
  	addStem();
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
	debugger
	var stemRow = '<tr id="'+Stem.id+ '"><td>'+Stem.track_name+'</td><td>'+Stem.download_url+'</td><td><input type="button" value="update"><input type="button" value="delete"></td></tr>';
	$('#my_stems').append(stemRow)
}