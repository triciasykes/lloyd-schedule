// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



document.addEventListener('DOMContentLoaded', () => {

    const convertDateTimeToISO = (dateTime) => {
        let separate = dateTime.split('T')
        let formatDate = separate[0].slice(2)
        let formatTime = separate[1].slice(0, 8)
        let fullDate = `${formatDate} ${formatTime}`
        let d = new Date(Date.parse(fullDate));
        return d
    }

    const setDate = (date) => {
        let isoDate = convertDateTimeToISO(date)
        let formattedDate = isoDate.toLocaleDateString()
        const titleDiv = document.querySelector(".header-text")
        titleDiv.innerHTML = `Work Orders for ${formattedDate}`
    }

    const getStartTime = (dateTime) => {
        let time = dateTime.split('T')[1]
        let startTime = time.slice(0, 2)
        return startTime
    }

    const getLength = (duration) => {
        let row = 60
        let result
        let length = duration / row
        if (Number.isInteger(length)) {
            result = length
        } else if (1 < length < 2) {
            result = 2
        } else {
            result = 1
        }
        return result
    }

    let allTimes = {
        "06": 1,
        "07": 2,
        "08": 3,
        "09": 4,
        "10": 5,
        "11": 6,
        "12": 7,
        "13": 8,
        "14": 9,
        "15": 10,
        "16": 11,
    }


    let row = 0,
        length = 0,
        column = 0


    const buildAppointment = (order) => {
        const newAppointment = document.querySelector('.appointments')
        const apptDiv = document.createElement('div')
        apptDiv.className = 'appointment'
        apptDiv.style = `grid-row: ${row}/span ${length};grid-column:${order.technician_id}; background-color:cornflowerBlue;`
        apptDiv.innerHTML =  `${order.location.name}` + '<br>' + `${order.duration} minutes` + '<br>' + `$${order.price}`
        newAppointment.appendChild(apptDiv)
    }



    const getWorkOrders = () => {
        fetch(`/work_orders.json`)
            .then(response => response.json())
            .then(response => {
                response.forEach(order => {
                    setDate(order.time)
                    let startTime = getStartTime(order.time)
                    // let time = convertDateTimeToISO(order.time)
                    row = allTimes[startTime],
                        length = getLength(order.duration),
                        column = order.technician_id,
                        buildAppointment(order)
                })
            })
    }
    getWorkOrders()

    const getEndTimes = (order) => {
        let startTime = convertISODate(order.time)
        console.log(startTime)
        //
    }

    // pop up on empty time 
    const checkIfEmpty = (row) => {
        if (row.innerHTML == "") {
            alert('empty')
        }
    }

    const addEmptyCheckToRows = () => {
        let rows = document.querySelectorAll('.row')
        rows.forEach(row => {
            row.addEventListener('click', () => {
                checkIfEmpty(row)
            })
        })
    }
    addEmptyCheckToRows()

})