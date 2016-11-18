import PostAPI from './post_api'
import socket from './socket'

let PostFeed = {

    init() {
        this.postFeed =  document.getElementById('post-feed'),
        this.postForm = document.getElementById('post-form')
        this.postSubmitButton =  document.getElementById('post-submit-button'),
        this.postAuthorInput = document.getElementById('post-author-input'),
        this.postContentInput =  document.getElementById('post-content-input'),

        this.postForm.onsubmit = this.handlePostSubmit.bind(this)

        this.channel = socket.channel("post_feed", {})
        this.channel.join()
            .receive("ok", () => {
                this.channel.on("new_post", ({post}) => {
                    this.renderOne(post)
                })
            })
            .receive("error", () => {})

        PostAPI.indexReq(this.initialRender.bind(this))
    },

    initialRender(resp) {
        if (resp.status == 200) {
            resp.json().then(this.renderAll.bind(this))
        }
    },

    renderAll(posts) {
        for(let i = 0; i < posts.length; i++) {
            this.renderOne(posts[i])
        }
    },

    renderOne(postObj) {
        let post = document.createElement('div')
        post.classList.add('card')

        let postHeader = document.createElement('div')
        postHeader.classList.add('card-header')
        postHeader.classList.add('text-muted')

        let postAuthor = document.createElement('b')
        postAuthor.innerHTML = '@' + postObj.author

        let postCreatedAt = document.createElement('small')
        postCreatedAt.classList.add('pull-right')
        postCreatedAt.innerHTML = postObj.created_at

        let postBlock = document.createElement('div')
        postBlock.classList.add('card-block')

        let postContent = document.createElement('div')
        postContent.classList.add('card-text')
        postContent.innerHTML = postObj.content

        postHeader.appendChild(postAuthor)
        postHeader.appendChild(postCreatedAt)
        postBlock.appendChild(postContent)
        post.appendChild(postHeader)
        post.appendChild(postBlock)

        this.postFeed.insertBefore(post, this.postFeed.firstChild)
    },

    handlePostSubmit(e) {
        e.preventDefault()

        let author = this.postAuthorInput.value
        let content = this.postContentInput.value
        PostAPI.createReq({author: author, content: content}, this.createPost.bind(this))
    },

    createPost(resp) {
        if(resp.status == 201) {
            this.postContentInput.value = ""
        }
    }
}

export default PostFeed
