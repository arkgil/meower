import PostAPI from './post_api'

let PostFeed = {
    postFeed: document.getElementById('post-feed'),

    init() {
        PostAPI.indexReq(this.initialRender)
    },

    initialRender(resp) {
        if (resp.status == 200) {
            resp.json().then(PostFeed.renderAll)
        }
    },

    renderAll(posts) {
        for(let i = 0; i < posts.length; i++) {
            PostFeed.renderOne(posts[i])
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

        let postBlock = document.createElement('div')
        postBlock.classList.add('card-block')

        let postContent = document.createElement('div')
        postContent.classList.add('card-text')
        postContent.innerHTML = postObj.content

        postHeader.appendChild(postAuthor)
        postBlock.appendChild(postContent)
        post.appendChild(postHeader)
        post.appendChild(postBlock)

        this.postFeed.appendChild(post)
    }
}

export default PostFeed
