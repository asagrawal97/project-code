const express = require('express');
const auth = require('./auth');
const users = require('./users');
const posts = require('./posts');
const tags = require('./tags');
const answers = require('./answers');

const router = express.Router();

router.use('/auth', auth);
router.use('/users', users);
router.use('/posts', posts);
router.use('/tags', tags);
router.use('/posts/answers', answers);

module.exports = router;
