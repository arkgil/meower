let PostAPI = {

    basePath: '/api/posts',

    headers: {
        "Content-Type": 'application/json'
    },

    indexPath() {
        return this.basePath
    },

    showPath(id) {
        return this.basePath + '/' + id
    },

    createPath() {
        return this.basePath
    },

    indexReq(succ, err) {
        return fetch(this.indexPath(), {
            method: 'GET',
            headers: this.headers,
            credentials: 'same-origin'
        }).then(succ).then(err)
    },

    showReq(id, succ, err) {
        return fetch(this.showPath(id), {
            method: 'GET',
            headers: this.headers,
            credentials: 'same-origin'
        }).then(succ).then(err)
    },

    createReq(post, succ, err) {
        return fetch(this.createPath(), {
            method: 'POST',
            headers: this.headers,
            credentials: 'same-origin',
            body: JSON.stringify({
                post: post
            })
        }).then(succ).then(err)
    }

}

export default PostAPI
