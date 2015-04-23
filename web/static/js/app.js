import {Socket} from "phoenix"

// let socket = new Socket("/ws")
// socket.join("topic:subtopic", {}, chan => {
// })

let App = {
  init: function() {
    let socket = new Socket("//localhost:4000/ws")
    socket.connect()
    socket.join("telemetry:response:timing:GET", {})
      .receive("ok", chan => {
        console.log("Telemetry connected!")
        chan.on("response_time", payload => {
          console.log(payload)
          dataset.push(payload)
          console.log(dataset)
          updateDomains(dataset);
          var bars = chart.selectAll("rect")
                      .data(dataset, key);

          bars.exit()
              .transition()
              .attr("x", -xScale.rangeBand())
              .remove();

          bars.enter()
              .append("rect")
              .attr("x", w)
              .attr("y", yStart)
              .attr("width", xScale.rangeBand())
              .attr("height", height)
              .attr("class", function(d) {return "q"+colorScale(value(d))+"-9";})
              .on("mouseover", function(d) {
                var xPosition = parseFloat(d3.select(this).attr("x")) + xScale.rangeBand() / 2;
                var yPosition = parseFloat(d3.select(this).attr("y")) / 2 + h / 2;

                var tooltip = d3.select("#tooltip")
                  .style("left", xPosition + "px")
                  .style("top", yPosition + "px");

                tooltip.select("#value")
                  .text(value(d));
                tooltip.select("#timestamp")
                  .text(timeFormat(dateFromKey(d)));

                d3.select("#tooltip").classed("hidden", false);

              })
              .on("mouseout", function() {
                d3.select("#tooltip").classed("hidden", true);
              });

              bars.transition()
                  .duration(duration)
                  .attr("x", function(d, i){
                    return xScale(i);
                  })
                  .attr("y", yStart)
                  .attr("width", xScale.rangeBand())
                  .attr("height", height)
                  .attr("class", function(d) { return "q"+colorScale(value(d))+"-9";});
              
        })
      })
  }
}

App.init()

export default App
