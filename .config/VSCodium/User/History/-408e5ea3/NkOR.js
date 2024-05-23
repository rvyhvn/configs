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
  draggable: true,
});

layer.add(circle);

// Create horizontal and vertical lines forming a `+` symbol
const lineHorizontal = new Konva.Line({
  points: [-50, 0, 50, 0], // Horizontal line
  stroke: 'black',
  strokeWidth: 2,
  rotation: circle.rotation(), // Initial rotation based on circle's rotation
});

const lineVertical = new Konva.Line({
  points: [0, -50, 0, 50], // Vertical line
  stroke: 'black',
  strokeWidth: 2,
  rotation: circle.rotation(), // Initial rotation based on circle's rotation
});

layer.add(lineHorizontal);
layer.add(lineVertical);

// Function to update the lines' rotation based on the circle's rotation
function updateLinesRotation() {
  const rotation = circle.rotation();
  lineHorizontal.rotation(rotation);
  lineVertical.rotation(rotation);
  layer.batchDraw(); // Redraw the layer
}

// Event listener for circle's rotation change
circle.on('transform', () => {
  updateLinesRotation(); // Update lines' rotation based on circle's rotation
});

// Start the animation
updateLinesRotation();
