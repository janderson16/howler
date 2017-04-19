var API = 'http://localhost:3000/api/v1'

var printStuff = function(data){

  $("#emotionalData td").remove();

  $("#emotionalData tbody").append("<tr>").append("<td>Anger</td><td>"+ data[0]["Emotion Tone"]["Anger"] +"</td>")
  $("#emotionalData tbody").append("<tr>").append("<td>Disgust</td><td>"+ data[0]["Emotion Tone"]["Disgust"] +"</td>")
  $("#emotionalData tbody").append("<tr>").append("<td>Fear</td><td>"+ data[0]["Emotion Tone"]["Fear"] +"</td>")
  $("#emotionalData tbody").append("<tr>").append("<td>Joy</td><td>"+ data[0]["Emotion Tone"]["Joy"] +"</td>")
  $("#emotionalData tbody").append("<tr>").append("<td>Sadness</td><td>"+ data[0]["Emotion Tone"]["Sadness"] +"</td>")

  debugger;
  $("#languageData tbody").append("<tr>").append("<td>Analytical</td><td>"+ data[1]["Language Tone"]["Analytical"] +"</td>")
  $("#languageData tbody").append("<tr>").append("<td>Confident</td><td>"+ data[1]["Language Tone"]["Confident"] +"</td>")
  $("#languageData tbody").append("<tr>").append("<td>Tentative</td><td>"+ data[1]["Language Tone"]["Tentative"] +"</td>")

  $("#social-data tbody").append("<tr>").append("<td>Openness</td><td>"+ data[2]["Social Tone"]["Openness"] +"</td>")
  $("#social-data tbody").append("<tr>").append("<td>Conscientiousness</td><td>"+ data[2]["Social Tone"]["Conscientiousness"] +"</td>")
  $("#social-data tbody").append("<tr>").append("<td>Extraversion</td><td>"+ data[2]["Social Tone"]["Extraversion"] +"</td>")
  $("#social-data tbody").append("<tr>").append("<td>Agreeableness</td><td>"+ data[2]["Social Tone"]["Agreeableness"] +"</td>")
  $("#social-data tbody").append("<tr>").append("<td>Emotional Range</td><td>"+ data[2]["Social Tone"]["Emotional Range"] +"</td>")

}

var postData = function(){
  var input = $("textarea[name=text]").val();

  return $.ajax({
    url: API + '/tones',
    method: "GET",
    data: {text: input}
  })

  .done(printStuff)
  .fail(function(error){
    console.error(error)
  });
}

$(document).ready(function(){

  $("input[type=submit]").on('click', postData)
  // postData();

  $('form').on('submit', function(event){
    event.preventDefault();
  });
});
