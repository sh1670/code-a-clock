---
title: Code A Clock Workshop
---


## Workshop Objective: Reinvent the Clock
#### The overall objective of this workshop is simple: Have fun, while learning some basic programming concepts to create your own version of a clock or some other form of measuring time.
Don't get too worried about not completely understanding a particular concept or being unable to achieve a specific exercise, as neither of those are the aims of the exercise.

However, do feel free to let your creativity run wild... feel free to go 'off piste' and go beyond the challenges we've laid out here. Who knows, you might just reinvent the concept of time! 😜

---

## What is Processing?
#### In this activity you will be using [Processing](https://processing.org), a Java based flexible software sketchbook.

_If you are doing this workshop in a lab on a University Visit Day, then Processing will already be installed and set up on half of your screen. If not, [Click Here](https://processing.org/tutorials/gettingstarted/) for more info on getting started. _


Processing is easy for creating visual art with a few simple lines, and is ideal for learning how to code. There are both Javascript and Java variants, but today we'll be using the Java.


The Processing programming environment might seem familiar to those of you who have used an Integrated Development Environment _(IDE)_ before, however experience with IDE’s is not a prerequisite for this workshop, so do not worry if some of this looks unfamiliar at first!

Students, artists, designers, researchers, and hobbyists use Processing for learning and prototyping projects.
[Visit this link](https://processing.org/exhibition/) to see some of the examples of interesting prototypes and projects.



---
### Timings
This workshop was created for Applicant Visit Days at the University of Bristol, and the rough timings for each secion are below:
- 14:15 Intro
- 14:20 Pen up, pen down
- 14:35 Playing with time
- 14:50 Group Work
- 15:10 Presentations


---
---


## PenUp, PenDown

#### First off we are going to create a simple drawing program.

>If you have any questions at any point, please ask a teaching assistant for help!

![penup-pendown screenshot](images/screenshot_penupdown.png)penup-pendown screenshot



### Step 1:
Create the start of your program, using `size()` to define the dimensions of the screen and `background()` to define the colour, within the `setup()` function.

![skeleton code screenshot](images/skeleton.png)

_Set up the minimum program by putting numbers into the code in the above screenshot, then run the program with the play button to check it works._


>The `setup()` function is run once, when the program starts, and sets up the window and the main processing program:
```java
void setup( ){
// Main code
} ```
The `size()` function defines the dimensions of the screen:
```java
size(height, width);
size(500, 500); ```
The `background()` function controls the colour of the screen:
```java
background(red, green, blue)
background(100, 120, 90); ```
_If you are an experienced programmer, you can declare and define variables/consts instead of hard-coding numbers._


### Step 2:
If you have successfully created a screen in your `setup()` function, now create a draw loop with `draw()`.
This function is repeatedly called whilst your sketch is running.

_The objective is to try and create a shape on the screen with your mouse._

>The `fill` function can be used to control the colour of shapes:
```java
fill(red, green, blue)
fill(200, 200, 200);```
The `ellipse()` function draws an ellipse at a given location, with given width and height:
```java
ellipse(centre_x, centre_y, width, height)
ellipse(250, 250, 100, 50);```







### Step 3:
Your program should now draw an ellipse on a blank screen. Try refactoring/changing it so that an ellipse is only drawn if you click your mouse.

To do this you’ll need to use an `if` statement: “if mouse is clicked draw an ellipse, else do nothing”.

>If statements allow you to write some code which is only executed if some test condition is true:
```java
if (test) {
  // statements
} ```
The `mousePressed` variable is `true` when any mouse button is pressed. It is `false` otherwise.
```java
if (mousePressed) {
 // code to draw an ellipse
}```

### Step 4:
Your program should now effectively be a pen up and pen down program now.
However, a pen that doesn''t move is useless.

>To make it more realistic use the `mouseX` and `mouseY` variables to draw your ellipse based on where you put your mouse on the screen.



### Congratulations.
You should now have a simple painting program in Processing.

Here are a few extensions you could try:
- Try using a different conditional statement. I.e. replace the if statement with either a for-loop, a while-loop or a do-while-loop
- Change the colour with of the ellipse with every mouse click !
- Change the size of the ellipse with every mouse click.





---


## Playing with Time
#### In this exercise you will be creatively modifying the code for a program that draws a working clock.

First create a new Processing sketch (File -> New)

Then copy and paste in the code below:

{% include_relative example_code/simple_clock.pde %}



Now press the play button and it you should have a clock that looks like this:




---


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




---


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







---

## Show and Tell
#### Time to show off your new creations!
Can the other groups read the time on your new clock?
Would they want a version on their wall at home?
Did you use any interesting hacks in your code that you can explain to the other groups?









---

LINKS:
This worksheet is here:
* original - https://tinyurl.com/y9cuqury
* new - https://lukestorry.co.uk/code-a-clock/

Processing reference: https://processing.org/reference/
