express = require 'express'
bodyParser = require 'body-parser'
app = module.exports = express()
io = require('socket.io-client')
socket = io.connect('http://52.77.228.237',{
	port:8000
})


socket.on 'connect', (socket) ->
	console.log "Connected!"
socket.emit "joinroom", {id:1}

socket.on "unlock", (socket) ->
	console.log "Unlock received"

console.log socket.connected
#frijRouter = require('./routes/frij')

port = process.env.PORT ? 8001

#Middleware
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

#Routers
#app.use '/admin',adminRouter


#Server
server = require('http').createServer(app)
server.listen port, () ->
  console.log "Listening on Port #{port}"
