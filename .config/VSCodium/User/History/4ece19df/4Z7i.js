import Konva from "konva";

const width = window.innerWidth;
const height = window.innerHeight;

let stagePosition = { x: width / 2, y: height / 2 };

const stage = new Konva.Stage({
  container: "container",
  width: width,
  height: height,
  x: stagePosition.x,
  y: stagePosition.y,
  draggable: true,
});

const layer = new Konva.Layer();

const tire = new Konva.Circle({
  x: -20,
  y: 200,
  strokeWidth: 2,
  stroke: 'black',
  radius: 50,
});

const innerTire = new Konva.Circle({
  x: tire.x(),
  y: tire.y(),
  strokeWidth: 0.5,
  stroke: 'blue',
  radius: 15,
})

const cannonBody = new Konva.Line({
  points: [tire.x() + 50, tire.y(), 150, 165, 150, 120, -50, 100],
  stroke: 'red',
  strokeWidth: 2,
  // lineCap: 'round',
  // lineJoin: 'round',
  // tension: 1,
})

layer.add(cannonBody, tire, innerTire)
layer.draw()
stage.add(layer);