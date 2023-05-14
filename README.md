<h1 align="center"> VBTwatch </h1> <br>

https://github.com/tsuguring/VBTwatch/assets/52564598/ada13388-0d93-4e03-8af6-fdde2c6b950e
## Introduction
watchOS app to support [VBT](https://en.wikipedia.org/wiki/Velocity_based_training) (training method that adjusts load based on speed)
### Background
In recent years, the methods of weight training have changed as technology has evolved. With the advent of devices that visualize lifting velocity, which cannot be visually confirmed, VBT has become the norm.

The advantages of VBT are as follows
1. Appropriate training can be performed according to individual abilities and conditions. (e.g. PBT determines the weight based on the maximum weight the user can lift at one time (1RM), but 1RM varies from day to day. VBT allows the user to know what percentage of 1RM the weight is based on the lifting speed, so the training is appropriate for the condition).
2. Reduce the risk of injury and train more efficiently.
### Motivation
At this time, as far as we have been able to determine, there are two ways to measure velocity
1. Purchase a dedicated VBT device and measure it.
2. Use a smartphone application and measure.

However, each has its own disadvantages.
1. They are very expensive (about 80,000~400,000 yen) and difficult to obtain.
2. Since the smartphone is used as a camera to capture and measure training, it requires a lot of space and is difficult to use in a gym.
### Purpose
To use watchos to measure speed smartly (just put it on your arm) and support appropriate weight setting.
### Method
Create a machine learning model to determine the motion of bench press by learning the motion data of applewatch during bench press using createML.
The acceleration during bench press is measured by the built-in acceleration sensor of AppleWatch, and the speed is calculated based on the measured acceleration.

## Technology Stack
Swift, SwiftUI, CoreML, AVFoundation
