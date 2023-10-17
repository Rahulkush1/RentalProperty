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
	console.log(document.querySelectorAll(".flat_type"))
	
	document.querySelectorAll(".flat_type").style.display = "block"

}
else{
	document.querySelectorAll(".flat_type").style.display = "none"
}
}

myElement.addEventListener('change',()=>{

	handle_change();
})












