import Konva from 'konva';

// Create a new stage
const width = window.innerWidth;
const height = window.innerHeight;
const stage = new Konva.Stage({
  container: 'container', // id of container <div>
  width: width,
  height: height
});

// Create a new layer
const layer = new Konva.Layer();
stage.add(layer);

// Create a new circle
const circle = new Konva.Circle({
  x: stage.width() / 2,
  y: stage.height() / 2,
  radius: 50,
  fill: 'red',
  stroke: 'black',
  strokeWidth: 4,
  draggable: true
});

// Create horizontal and vertical lines forming a `+` symbol
const lineHorizontal = new Konva.Line({
  x: circle.x(),
  y: circle.y(),
  points: [-50, 0, 50, 0], // Horizontal line
  stroke: 'black',
  strokeWidth: 2
});

const lineVertical = new Konva.Line({
  x: circle.x(),
  y: circle.y(),
  points: [0, -50, 0, 50], // Vertical line
  stroke: 'black',
  strokeWidth: 2
});

// Add the circle and lines to the layer
layer.add(circle);
layer.add(lineHorizontal);
layer.add(lineVertical);

// Function to animate the rotation
function rotateElements() {
  const angle = circle.rotation() + 1; // Increment rotation angle
  circle.rotation(angle);
  lineHorizontal.rotation(angle);
  lineVertical.rotation(angle);
  layer.batchDraw(); // Redraw the layer
  requestAnimationFrame(rotateElements); // Continue the animation
}

// Start the animation
rotateElements();