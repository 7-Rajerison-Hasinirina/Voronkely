document.addEventListener("DOMContentLoaded", function(){


const reference =
document.getElementById("referenceMembre");


const idMembre =
document.getElementById("idMembre");


const photo =
document.getElementById("photoMembre");


const nom =
document.getElementById("nomMembre");


const prenom =
document.getElementById("prenomMembre");



reference.addEventListener("change", function(){


let ref = reference.value.trim();



if(ref === ""){
return;
}



fetch(
contextPath + "/api/membres/reference/" + ref
)


.then(response=>{


if(!response.ok){

throw new Error();

}


return response.json();


})


.then(membre=>{


console.log(membre);



idMembre.value =
membre.id;



nom.textContent =
membre.nomMembre;



prenom.textContent =
membre.prenomMembre;



if(membre.image){

photo.src =
contextPath + "/images/" + membre.image;

}
else{

photo.src =
contextPath + "/images/profile-femme.png";

}



})


.catch(()=>{


idMembre.value="";


nom.textContent=
"Membre introuvable";


prenom.textContent="";


photo.src =
contextPath + "/images/profile-femme.png";


});


});





document
.getElementById("formAssurance")
.addEventListener("submit",function(e){


if(idMembre.value===""){


e.preventDefault();


alert("Veuillez choisir un membre valide");


}



});


});