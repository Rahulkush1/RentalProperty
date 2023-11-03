// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "jquery"

import "popper"

import "bootstrap"
	

var myElement = document.querySelector('#property_prop_type');

function handle_change(e){
	console.log(myElement)

if (myElement.value == 'Flat'){	
	document.querySelector(".flat_type").style.display = "block"
	document.querySelector(".flat_available_for").style.display = "block"

}
else{
	document.querySelector(".flat_type").style.display = "none"
	document.querySelector(".flat_available_for").style.display = "none"

}
}

myElement.addEventListener('change',()=>{

	handle_change();
})












