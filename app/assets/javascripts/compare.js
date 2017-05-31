

$(document).ready(function(){
  $('#compare').click(function(event){
    event.preventDefault();
    compareChart()
  })
})

function compareChart(){
      if ($('input[type=checkbox]:checked').length > 2 && $('input[type=checkbox]:checked').length < 2) {
          $(this).prop('checked', false);
          alert("You need to select only compare 2 Howlers");
      }
      else
        $('#compare').append(
          makeCompareChart()
        )
}

function makeCompareChart(){
  var idOne = $('input[type=checkbox]:checked')[0].id
  // var chartInputOne = $(`.data-${idOne}`)
  // var firstOpenness = $(`.data-${idOne}`).data("openness")
  var idTwo = $('input[type=checkbox]:checked')[1].id

  var open = function findOpenness(id){
      $(`.data-${id}`).data("openness")
    }
  var conscientious = function findConscientiousness(id){
      $(`.data-${id}`).data("conscientiousness")
    }
  var extraverted = function findExtroversion(id){
      $(`.data-${id}`).data("extraversion")
    }
  var agreeable = function findAgreeableness(id){
      $(`.data-${id}`).data("agreeableness")
    }
  var emoRange = function findEmotionalRange(id){
      $(`.data-${id}`).data("emotional-range")
    }

    var socialCompare = Highcharts.chart(`small-social-chart-comparison`, {
      chart: {
        polar: true
      },
      title: {
        text: 'Social Data'
      },
      xAxis: {
        categories: ['Openness', 'Conscientiousness', 'Extraversion', 'Agreeableness', 'Emotional Range']
      },

      series: [{
        type: 'area',
        name: 'Tones1',
        data: [open(idOne), conscientious(idOne), extraverted(idOne), agreeable(idOne), emoRange(idOne)]
      },
      {
        type: 'area',
        name: 'Tones2',
        data: [open(idTwo), conscientious(idTwo), extraverted(idTwo), agreeable(idTwo), emoRange(idTwo)]
      }],

    });
    socialCompare()
}
