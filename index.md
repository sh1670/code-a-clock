code-a-clock
sketching with code using Processing




What is Processing?
In this activity you will be using Processing (https://processing.org) a Java based flexible software sketchbook.  The Processing programming environment might seem familiar to those of you who have used an Integrated Development Environment (IDE) before, however experience with IDE’s is not a prerequisite for this workshop, so do not worry if some of this looks unfamiliar at first!

Processing is easy for learning how to code while creating visual art. Students, artists, designers, researchers, and hobbyists use Processing for learning and prototyping projects. Visit this link to see some of the examples of interesting prototypes and projects developed by other people who used processing : https://processing.org/exhibition/
Workshop Objective: Reinvent the Clock
The overall objective of this workshop is simple. Have fun, while learning some basic programming concepts to create your own version of a clock or some other form of measuring time. Don't get too worried about not completely understanding a particular concept or being unable to achieve a specific exercise, as neither of those are the aims of the exercise.

However, do feel free to let your creativity run wild... feel free to go 'off piste' and go beyond the challenges we've laid out here. Who knows, you might just reinvent the concept of time! 😜



14:15 Intro
14:20 Pen up, pen down
14:35 Playing with time
14:50 Group Work
15:10 Show and tell
Pen Up, Pen Down

First off we are going to create a simple drawing program from scratch.
Start up Processing and then follow the steps below. Please ask a teaching assistant if you need any help!


                       starting point for the sketch                end result


Objective
Hint

Step 1: Create the start of your program as shown above, using size() to define the dimensions of the screen and background() to define the colour.

Now run the program with the play button and check it works.




(If you are an experienced programmer, you can declare and define variables instead of hard-coding numbers.)
The setup() function is run once, when the program starts and contains the main processing program:
void setup( ){
// Main code
}

The size function defines the dimensions of the screen: size(height, width)
size(500, 500);

The background function controls the colour of the screen:
background(red, green, blue)
background(100, 120, 90);
Step 2: If you have successfully created a screen in your setup() function, now create a draw loop with draw().

The objective is to try and create a shape on the screen with your mouse.

Also try to make the shape change colour by changing the variable values given to fill.
The draw function continuously executes until the loop is stopped:
Void draw(){
  // executed code
}

The ellipse function draws an ellipse with given width and height:
ellipse(centre_x, centre_y, width, height)
ellipse(250, 250, 100, 50);

The fill function can be used to control the colour of shapes:
fill(red, green, blue)
fill(200, 200, 200);






Step 3:  Assuming that your program now draws an ellipse on a blank screen, try refactoring/changing it so that an ellipse is only drawn if you click your mouse.

To do this you’ll need to use an if statement; “if mouse is clicked draw an ellipse, else do nothing”.
If statements allow you to write some code which is only executed if some test condition is true:
if (test) {
  // statements
}


The mousePressed variable is true when any mouse button is pressed. It is false otherwise.
If (mousePressed) {
 // code to draw an ellipse
}
Step 4: Your program should now effectively be a pen up and pen down program now. However a pen that doesn't move is useless.

To make it more realistic use the mouseX and mouseY variables to draw your ellipse based on where you put your mouse on the screen i.e. a pen that moves.

Congratulations. If you complete the above you have completed the exercise. If:
Try using a different conditional statement. I.e. replace the if statement with either a for-loop, a while-loop or a do-while-loop
Change the colour with of the ellipse with every mouse click !
Change the size of the ellipse with every mouse click.

The mouseX, and mouseY variables contain the X and Y coordinates of the mouse respectively.

ellipse(mouseX, mouseY, 100, 50);






Fun things to google:
while() and for()
Modulo i.e. % .





Playing with Time
In this exercise you will be creatively modifying the code for a program that draws a working clock.

First create a new Processing sketch (File -> New)

Then copy and paste in the code below:


int clockCentreX, clockCentreY;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {

  size(400, 400);

  clockCentreX = width / 2;
  clockCentreY = height / 2;

  int maxRadius = min(width, height) / 2;

  secondsRadius = maxRadius * 0.72;
  minutesRadius = maxRadius * 0.60;
  hoursRadius = maxRadius * 0.50;
  clockDiameter = maxRadius * 1.8;
}


void draw() {

  // first clear the canvas by drawing the background
  background(100, 100, 100);

  // now draw the clock face
  fill(150, 150, 150);
  noStroke();
  ellipse(clockCentreX, clockCentreY, clockDiameter, clockDiameter);

  // calculate the current hand angles
  float second_angle = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float minute_angle = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float hour_angle = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  // set the colour to draw the details
  stroke(255, 255, 255);
  strokeWeight(1);
  line(clockCentreX, clockCentreY, clockCentreX + cos(second_angle) * secondsRadius, clockCentreY + sin(second_angle) * secondsRadius);
  // minute hand
  strokeWeight(3);
  line(clockCentreX, clockCentreY, clockCentreX + cos(minute_angle) * minutesRadius, clockCentreY + sin(minute_angle) * minutesRadius);
  // hour hand
  strokeWeight(6);
  line(clockCentreX, clockCentreY, clockCentreX + cos(hour_angle) * hoursRadius, clockCentreY + sin(hour_angle) * hoursRadius);

  strokeWeight(2);
  beginShape(POINTS);
  for (int degrees = 0; degrees < 360; degrees+=6) {
    float rads = radians(degrees);
    float tick_mark_x = clockCentreX + cos(rads) * secondsRadius;
    float tick_mark_y = clockCentreY + sin(rads) * secondsRadius;
    vertex(tick_mark_x, tick_mark_y);
  }
  endShape();
}




Now press the play button and it you should have a clock that looks like this:

Great - now try hacking the clock by trying some of the challenges below, feel free to pick and choose, no need to do them in order. Also, it's no problem to go beyond the challenges and try just generally playing around with the code. Once you've tried this version, try the other two example clocks below. If you need any help, please ask a teaching assistant!

Challenge
Try Hint

Challenge 1:  Can you make the appearance of this clock nicer by changing its background color, the color and length of its hands, and the number of points of the color, for example?
Colours are given in (Red, Green and Blue) values
0 means none of that colour and 255 means full.

To make purple you mix red and blue, so try (255, 0, 255).


Challenge 2: Can you make a clock with only hour and minute hands?
Where is the line of code that draws the second hand?

Rather than deleting it, you can comment it out using two forward slashes.

// like this!
Challenge 3: Can you give a snapshot of some fixed time such as 18:45pm?


Try setting the minute_angle and hour_angle by hand in order to show a certain time on the clock.
Challenge 4:  Can you give another time-zone clock e.g. Beijing time, New York time?

How about also swapping between time zones with a click of the mouse?
Find the change in minute_angle and hour_angle that correspond to the time-zone difference.


done? ...there are two more clock examples to hack below!


Linear Clock
This clock lays the hours, minutes and seconds out in a table and highlights the current time. How about playing around by removing all the lines, or creating a different shade for each block?



             int WIDTH = 960;
              int HEIGHT = 600;
              void setup(){;
                           size(960, 600);
                           }
              int seconds = 0;
              int minutes = 0;
              int hours = 0;
              void draw(){
                    background(20, 135, 196);
                   //draw update rectangles per second, minute and hour
                    fill((seconds*4)%255, 50, 50);
                    rect(WIDTH/60*seconds, 3*HEIGHT/4, WIDTH/60, HEIGHT/4);
                    fill((minutes*4)%4, 87, 100);
                    rect(WIDTH/60*minutes, HEIGHT/3, WIDTH/60, 5*HEIGHT/12);
                    fill(56, 16, 178);
                    rect(WIDTH/24*hours, 0, WIDTH/24, HEIGHT/3);
                   //draw grid
                    for(int i=0; i<WIDTH; i+=WIDTH/24){
                          line(i, 0, i, HEIGHT/3);
                          fill(196, 251, 252);
                          text(i/40,i+6, HEIGHT/6);
                                              }
                    line(0, HEIGHT/3, WIDTH, HEIGHT/3);
                    for(int i=0; i<WIDTH; i+= WIDTH/60){
                    line(i, HEIGHT/3, i, 3*HEIGHT/4);
                    fill(196, 251, 252);
                    text(i/16, i+2, 3*HEIGHT/5);
                                }
                    line(0, 3*HEIGHT/4, WIDTH, 3*HEIGHT/4);
                    for(int i=0; i<WIDTH; i += WIDTH/60){
                    line(i, 3*HEIGHT/4, i, HEIGHT);
                    fill(216, 251, 255);
                    text(i/16, i+2, 9*HEIGHT/10);
                     }
                    seconds = second();
                   minutes = minute();
                   hours = hour();
                   }

Binary Clock
This clock lays the hours, minutes and seconds out in binary. The first line is binary number for the hour, second line for minute, third line for second shown as picture below.  



The picture above reads: 001111 hours, 001010 mins, 100111 seconds = 15:10:39? Can you tell why?
You can translate this binary clock to decimal clock by using some online binary converter here.

int on_colour = 255;
int off_colour = 30;
int back_colour = 0;

void setup() {
  size(360, 210);
  smooth();
  noStroke();
}

void draw() {
  background(back_colour);
  int hours = int(binary(hour()));
  int mins = int(binary(minute()));
  int secs = int(binary(second()));

  String  bin_time_str = nf(hours,6)+nf(mins,6)+nf(secs,6);

  int i=0;
  for(int row=0; row<3; row++){
    for(int col=0; col<6; col++){
      if (bin_time_str.charAt(i) == '1') {
        fill(on_colour);
      } else {
        fill(off_colour);
      }
      ellipse(55+50*col,55+50*row,50,50);
      i++;
    }
   }
}



Group work: invent your own clock
Team up! Group with your neighbours into teams of four people.

Over the next fifteen minutes you are going to use everything you've learnt so far to create a clock of your own. At the end each group will have a minute to present their new clock idea!

Time to get creative!

Here's some ideas as starting points!
Play with colour - can you tell the time just by colour?   http://www.pantoneclock.com
Think about shape.
Is your new clock simple to read or fiendishly complex?
Think about scale. Is your clock good for looking at seconds or does it work over years?
Can you make a stopwatch?
Smooth seconds using millis() and adjusting map()
http://www.jacopocolo.com/hexclock/ using time as RGB values, multipliers for stronger colours









Show and Tell
Time to show off your new creations!
Can the other groups read the time on your new clock?
Would they want a version on their wall at home?
Did you use any interesting hacks in your code that you can explain to the other groups?











LINKS:
This worksheet is here: https://tinyurl.com/y9cuqury
Processing reference: https://processing.org/reference/
