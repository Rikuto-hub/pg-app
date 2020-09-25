import $ from 'jquery'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
    $('.header_sub').removeClass('hidden')
    $('.header_left').addClass('hidden')

    $('.header_sub').on('click', () => {
        $('.timeline_sub').removeClass('hidden')
        $('.header_sub').addClass('hidden')
        $('.article_all').removeClass('hidden')
        $('.article_followings').addClass('hidden')
    })

    $('.timeline_sub').on('click', () => {
        $('.header_sub').removeClass('hidden')
        $('.timeline_sub').addClass('hidden')
        $('.article_followings').removeClass('hidden')
        $('.article_all').addClass('hidden')
    })
})