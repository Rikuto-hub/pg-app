import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common[`X-CSRF-Token`] = csrfToken()
document.addEventListener('DOMContentLoaded', () => {
    const dataset = $('#account-show').data()
    const accountId = dataset.accountId
    axios.get(`/accounts/${accountId}/relation`)
    .then((res) => {
        const hasFollowed = res.data.hasFollowed
        if (hasFollowed){
            $('.unfollow').removeClass('hidden')
        }else{
            $('.follow').removeClass('hidden')
        }
    })
    $('.follow').on('click', () => {
        axios.post(`/accounts/${accountId}/follows`)
            .then((res) => {
                if (res.data.status === 'ok'){
                    $('.follow').addClass('hidden')
                    $('.unfollow').removeClass('hidden')
                }
            })
            .catch((e) =>{
                window.alert('Error')
                console.log(e)
            })
    })
    $('.unfollow').on('click', () => {
        axios.post(`/accounts/${accountId}/unfollows`)
            .then((res) => {
                if (res.data.status === 'ok'){
                    $('.unfollow').addClass('hidden')
                    $('.follow').removeClass('hidden')
                }
            })
            .catch((e) =>{
                window.alert('Error')
                console.log(e)
            })
    })
})