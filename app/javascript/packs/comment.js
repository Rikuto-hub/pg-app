import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common[`X-CSRF-Token`] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {
    $('.comment').on('click', () => {
        $('.comments_container').removeClass('hidden')
        $('.comment').addClass('hidden')
    })

    const dataset = $('#article-show').data()
    const articleId = dataset.articleId

    axios.get(`/articles/${articleId}/comments`)
    .then((response) => {
        const comments = response.data
        comments.forEach((comment) => {
            $('.comment_nav').append(
                `<div class="comment_item"><p>${comment.content}</p></div>`
            )
        })
    })

    $('.comment_post').on('click', () => {
        const content = $('#comment_content').val()
        if (!content){
            window.alert('miss')
        }else{
            axios.post(`/articles/${articleId}/comments`, {
                comment: {content: content}
            })
            .then((response) => {
                const comment = response.data
                $('.comment_nav').append(
                    `<div class="comment_item"><p>${comment.content}</p></div>`
                )
                $('#comment_content').val('')
            })
        }
    })    
})