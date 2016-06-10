$(function(){
  $('.date-field').datepicker({ dateFormat: "yy-mm-dd" });
  var map = new google.maps.Map(document.getElementById('map'), 
  {
    center: {lat: 25.682243, lng: -100.317921},
    zoom: 5,
    scrollwheel: false
  });
//---
  
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
    });

});