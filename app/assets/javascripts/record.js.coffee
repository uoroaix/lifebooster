# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->


  Highcharts.setOptions global:
    useUTC: false

  graphObjectHr = JSON.parse(window.graphDataHr) 
  graphObjectBr = JSON.parse(window.graphDataBr) 
  graphObjectCa = JSON.parse(window.graphDataCa) 

  $(".chart_hr").highcharts

    chart:
      zoomType: "x"

    title:
      text: "Heart Rate"

    subtitle:
      text: (if document.ontouchstart is `undefined` then "Click and drag in the plot area to zoom in" else "Pinch the chart to zoom in")

    xAxis:
      type: "datetime"
      # minRange: 1 * 24 * 3600000  * 256# one day

    yAxis:
      title:
        text: "Heart Rate (BPM)"
        minRange: 0

    legend:
      enabled: false

    plotOptions:
      area:
        # color: "red"
        fillColor:
          linearGradient:
            x1: 0
            y1: 0
            x2: 0
            y2: 1

          stops: [
            [
              0
              Highcharts.getOptions().colors[0]
            ]
            [
              1
              Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get("rgba")
            ]
          ]

        marker:
          radius: 2

        lineWidth: 1
        states:
          hover:
            lineWidth: 1

        threshold: null

    series: [
      # utcSeconds = 1403234308;
      # d = new Date(0);
      # d.setUTCSeconds(utcSeconds);

      type: "area"
      name: "Heart Rate"
      # pointInterval: 256
      # pointStart: d
      data: graphObjectHr
    ]

  $(".chart_br").highcharts
    chart:
      zoomType: "x"

    title:
      text: "Breathing Rate"

    subtitle:
      text: (if document.ontouchstart is `undefined` then "Click and drag in the plot area to zoom in" else "Pinch the chart to zoom in")

    xAxis:
      type: "datetime"
      # minRange: 1 * 24 * 3600000  * 256# one day

    yAxis:
      title:
        text: "Breathing Rate (RPM)"
        minRange: 0

    legend:
      enabled: false

    plotOptions:
      area:
        fillColor:
          linearGradient:
            x1: 0
            y1: 0
            x2: 0
            y2: 1

          stops: [
            [
              0
              Highcharts.getOptions().colors[0]
            ]
            [
              1
              Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get("rgba")
            ]
          ]

        marker:
          radius: 2

        lineWidth: 1
        states:
          hover:
            lineWidth: 1

        threshold: null

    series: [
      # utcSeconds = 1403234308;
      # d = new Date(0);
      # d.setUTCSeconds(utcSeconds);

      type: "area"
      name: "Breathing Rate"
      # pointInterval: 256
      # pointStart: d
      data: graphObjectBr
    ]

  $(".chart_ca").highcharts
    chart:
      zoomType: "x"

    title:
      text: "Cadence"

    subtitle:
      text: (if document.ontouchstart is `undefined` then "Click and drag in the plot area to zoom in" else "Pinch the chart to zoom in")

    xAxis:
      type: "datetime"
      # minRange: 1 * 24 * 3600000  * 256# one day

    yAxis:
      title:
        text: "Cadence (Steps/Min)"
        minRange: 0

    legend:
      enabled: false

    plotOptions:
      area:
        fillColor:
          linearGradient:
            x1: 0
            y1: 0
            x2: 0
            y2: 1

          stops: [
            [
              0
              Highcharts.getOptions().colors[0]
            ]
            [
              1
              Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get("rgba")
            ]
          ]

        marker:
          radius: 2

        lineWidth: 1
        states:
          hover:
            lineWidth: 1

        threshold: null

    series: [
      # utcSeconds = 1403234308;
      # d = new Date(0);
      # d.setUTCSeconds(utcSeconds);

      type: "area"
      name: "Steps / Min"
      # pointInterval: 256
      # pointStart: d
      data: graphObjectBr
    ]

  return



