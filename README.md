# Masked-Face-Analysis-via-Multi-Task-Deep-Learning
---
Publised paper - [Journal of Imaging](https://www.mdpi.com/2313-433X/7/10/204/htm)

## Overview

Face recognition with wearable items has been a challenging task in computer vision and involves the problem of identifying humans wearing a face mask. Masked face analysis via multi-task learning could effectively improve performance in many fields of face analysis. In this paper, we propose a unified framework for predicting the age, gender, and emotions of people wearing face masks. We first construct FGNET-MASK, a masked face dataset for the problem. Then, we propose a multi-task deep learning model to tackle the problem. In particular, the multi-task deep learning model takes the data as inputs and shares their weight to yield predictions of age, expression, and gender for the masked face. Through extensive experiments, the proposed framework has been found to provide a better performance than other existing methods.

<p align="center">
<img src= https://user-images.githubusercontent.com/63264063/145868098-7b932bcc-83f7-47dd-b35a-ac04db355899.png>
</p>

## FGNET-MASK Dataset

The FGNET-MASK dataset contains 3404 images with rendered face masks. Each image is labeled with its age, gender, and expression. The dataset contains four age categories: under 10, 10–20, 20–40, and over 40 to balance the samples for each age group. There are only two genders labelled: Male and Female. Finally, expression labels were classified as Happy, Neutral, or Unhappy.

<p align="center">
<img width="574" alt="image" src="https://user-images.githubusercontent.com/63264063/145869017-255e1a19-353b-43fa-935a-655edcd65b09.png">
</p>

The total number of pictures grouped and categorized into their age groups is 1400 images of individuals under the age of 10, 1010 between the ages of 10 and 20, 720 between the ages of 20 and 40, and 274 over the age of 40. For the two gender categories, Male and Female, there are 2000 and 1404 images, respectively. And for the three types of expressions, there are 1800 images with happy expressions, 950 with neutral expressions, and 654 with unhappy expressions.

## Proposed Method

The Dataset was processed into multiple methods with different backbones, and the model's performance was evaluated by training and testing several methods, backbones, and compare results.

-  LBP
-  Tiny Image
-  VGG Face
-  Eigenface
-  Single task (age, gender and expression) on CNN 
-  Single task (age, gender and expression) on ResNet
-  Multitask Deep Learning on CNN
-  Multitask Deep Learning on ResNet

## Conclusion

The investigated problem of human masked face recognition. I constructed FGNET‐MASK, a new masked face dataset with different modalities via face synthesis. Then proposed multiple methods and their results to give a prediction of the age, expression, and gender of a person wearing a face mask, multitask deep learning with ResNet-152, obtaining highest accuracy. The experiments show the impressive performance of the proposed method on the testing data. 
