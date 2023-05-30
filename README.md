<h1 align="center"> VBTwatch </h1> <br>

https://github.com/tsuguring/VBTwatch/assets/52564598/ada13388-0d93-4e03-8af6-fdde2c6b950e
## Introduction
[VBT](https://en.wikipedia.org/wiki/Velocity_based_training)(挙上速度をもとに負荷調整するトレーニング法)をサポートするwatchOSアプリケーション
### Background
近年、テクノロジーの進化に伴い、ウェイトトレーニングの方法が変わっている。目視で確認することができない挙上速度を可視化するデバイスが登場したため、速度ベーストレーニングが主流になってきている。

VBTの利点は以下である。
1. 個人の能力やコンディションに合わせた適切なトレーニングを行うことができる。(e.g. PBTではユーザーが一回持ち上げられる最大の重さ(1RM)を基準にして重量を決定するが、日によって1RMは変化する。VBTでは挙上速度でその重量が1RMの何%かわかるため、コンディションに合わせた適切なトレーニングを行える。)
2. 怪我のリスクを下げ、効率よくトレーニングを行うことができる。
### Motivation
現時点で、我々が調べた限り速度を測定する方法は以下の2つである。
1. VBT専用のデバイスを購入し、測定する。
2. スマホアプリを使用し、測定する。

しかし、それぞれデメリットが存在する。
1. 非常に高価(約80,000~400,000円)であり、手に入れづらい。
2. スマホをカメラでトレーニングの様子を撮影し、測定しているため、多くの場所を確保する必要があり、ジムで使用しずらい。
### Objective
watchosを使用することにより、スマート(腕につけるだけ)に挙上速度を測定し、適切な重量設定をサポートする。
### Method
ベンチプレスした際のapplewatchのモーションデータをcreateMLを用いて学習させ、ベンチプレスのモーションを判定する機械学習モデルを作成。
ベンチプレスをしている際の加速度をAppleWatch内蔵の加速度センサーにより測定し、それをもとに、速度を求める。

## Technology Stack
Swift, SwiftUI, CoreML, AVFoundation, Combine
