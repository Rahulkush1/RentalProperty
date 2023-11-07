// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "jquery"

import "popper"

import "bootstrap"
	

	var myElement = document.querySelector('#property_prop_type');

	function handle_change(e){

		if (e.target.value == 'Flat'){	
			document.querySelector(".flat_type").style.display = "block"
			document.querySelector(".pg_detail").style.display = "none"
			document.querySelector(".room_detail").style.display = "none"

		}
		else if(e.target.value == 'PG'){

			console.log(document.querySelector(".pg_detail"))
			document.querySelector(".pg_detail").style.display = "block"
			document.querySelector(".flat_type").style.display = "none"
			document.querySelector(".room_detail").style.display = "none"
		}
		else if (e.target.value == 'Room'){
			document.querySelector(".room_detail").style.display = "block"
			document.querySelector(".pg_detail").style.display = "none"
			document.querySelector(".flat_type").style.display = "none"
		}
		else{
			document.querySelector(".room_detail").style.display = "none"
			document.querySelector(".pg_detail").style.display = "none"
			document.querySelector(".flat_type").style.display = "none"
	}	
	}
	myElement.addEventListener('change',(e)=>{
		handle_change(e);
	})


	












