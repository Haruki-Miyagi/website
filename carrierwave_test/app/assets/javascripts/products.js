var loadFile = function(event){
  var output = document.getElementbyid( 'image-preview' );
  output.src = URL.createObjectURL(event.target.files[0]);
};
