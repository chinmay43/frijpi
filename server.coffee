express = require 'express'
bodyParser = require 'body-parser'
app = module.exports = express()
io = require('socket.io-client')
socket = io.connect('http://52.77.228.237',{
	port:8000
})
 
Gpio = require('onoff').Gpio
lock = new Gpio(24,"out")



socket.on 'connect', (socket) ->
	console.log "Connected!"
socket.emit "joinroom", {id:1}

socket.on "unlock", (socket) ->
	lock.writeSync 0
	console.log "Unlock received"

socket.on "lock", (socket) ->
	lock.writeSync 1
	console.log "Lock received"

process.on 'SIGINT', () ->
	lock.unexport()
console.log socket.connected

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
