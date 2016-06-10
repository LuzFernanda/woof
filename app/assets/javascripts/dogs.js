$(function(){
  $('.date-field').datepicker({ dateFormat: "yy-mm-dd" });
  var map = new google.maps.Map(document.getElementById('map'), 
  {
    center: {lat: 25.682243, lng: -100.317921},
    zoom: 5,
    scrollwheel: false
  });
//---
  /*
$.ajax(
    {
      type: "GET",
      url: '/dogs/map_data',
      data: {},
      success: function(data)
      {
        var dogs = data['dogs']
    
    for(var dog_index in dogs)
    {
    
      //Insertar el marker del perro con dog['latitude'] y dog['longitude']
    var marker = new google.maps.Marker({
      position: {lat: dogs[dog_index]['latitude'] , lng: dogs[dog_index]['longitude']},
      map: map,
      title: dogs[dog_index]['gender'],
      icon: '/assets/icono2.png',


      });

      (function(){
        var index = dog_index;
        var local_marker = marker;

      marker.addListener('click', function() {
      
        var fun = (function(index){ 
          return function(){(new google.maps.InfoWindow({content: dogs[index]['calle']+ ' ' + dogs[index]['numero']+ ' ' + dogs[index]['colonia']})).open(map, local_marker);};
        })(index);
            
            fun()

        });

        marker.addListener('dblclick', function() {

          document.location = '/dogs/' + dogs[index]['id'];
        });

    })();
    

    }
      }
    }); */

    $('.dog').each(function(dog_index, dog){

      var calle = $(dog).find('.dog-calle').val();
      var numero = $(dog).find('.dog-numero').val();
      var colonia = $(dog).find('.dog-colonia').val();
      var lat = parseFloat($(dog).find('.dog-lat').val());
      var lon = parseFloat($(dog).find('.dog-lgt').val());
      var id = $(dog).find('.dog-id').val();
      var gender = $(dog).find('.dog-gender').attr('name');
      var marker = new google.maps.Marker({
      
      position: {lat: lat , lng: lon},
      map: map,
      title: gender,
      icon: '/assets/icono2.png',


      }); 

      (function(){
        var index = dog_index;
        var local_marker = marker;

      marker.addListener('click', function() {
      
        var fun = (function(index){ 
          return function(){(new google.maps.InfoWindow({content: calle + ' ' + numero + ' ' + colonia })).open(map, local_marker);};
        })(index);
            
            fun()

        });

        marker.addListener('dblclick', function() {

          document.location = '/dogs/' + id;
        });

    })(); 
    });


});