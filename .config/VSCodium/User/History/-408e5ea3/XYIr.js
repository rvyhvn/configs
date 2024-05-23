import Konva from 'konva';

const width = window.innerWidth;
const height = window.innerHeight;

const stage = new Konva.Stage({
  container: 'container',
  width: width,
  height: height
});

const layer = new Konva.Layer();
stage.add(layer);

const circle = new Konva.Circle({
  x: stage.width() / 2,
  y: stage.height() / 2,
  radius: 50,
  fill: 'red',
  stroke: 'black',
  strokeWidth: 4
});

layer.add(circle);

// Function to animate the rotation of the circle
function rotateCircle() {
  circle.rotate(1); // Rotate the circle by 1 degree
  layer.batchDraw(); // Redraw the layer
  requestAnimationFrame(rotateCircle); // Continue the animation
}

// Start the animation
rotateCircle();