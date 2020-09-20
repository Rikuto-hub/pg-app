import $ from 'jquery'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
    $('.answer').on('click'), () => {
        $('.answer_nav').removeClass('hidden')
        $('.answer').addClass('hidden')
    }
})