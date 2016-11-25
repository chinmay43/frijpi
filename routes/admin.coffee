express = require 'express'
router = express.Router()

router.post '/readtag', (req,res) ->
  taghelper = require '../helpers/admin/tag'
  taghelper.read req.body, (response) ->
    res.send response

module.exports = router
