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

// Create a group to hold the circle and lines
const group = new Konva.Group({
  x: stage.width() / 2,
  y: stage.height() / 2,
  draggable: true,
});

layer.add(group);

// Create a new circle
const circle = new Konva.Circle({
  x: 0,
  y: 0,
  radius: 50,
  fill: 'red',
  stroke: 'black',
  strokeWidth: 4
});

group.add(circle);

// Create horizontal and vertical lines forming a `+` symbol
const lineHorizontal = new Konva.Line({
  points: [-50, 0, 50, 0], // Horizontal line
  stroke: 'black',
  strokeWidth: 2,
});

const lineVertical = new Konva.Line({
  points: [0, -50, 0, 50], // Vertical line
  stroke: 'black',
  strokeWidth: 2,
});

group.add(lineHorizontal);
group.add(lineVertical);

// Function to animate the rotation of the group
function rotateGroup() {
  const angle = group.rotation() + 1; // Increment rotation angle
  group.rotation(angle);
  layer.batchDraw(); // Redraw the layer
  requestAnimationFrame(rotateGroup); // Continue the animation
}

// Start the animation
rotateGroup();
