import css from "../css/app.css"
import "phoenix_html"
import Player from "./player"

console.log("one")

const video = document.getElementById("video")
if(video) {
    console.log("two")
    Player.init(video.id, video.getAttribute("data-player-id"), () => { console.log("player ready!") })
}