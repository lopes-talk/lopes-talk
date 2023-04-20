<table>
  <tr>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
  </tr>

  <tr>
    <td colspan=3><img width="200px" height="200px" src="https://avatars.githubusercontent.com/u/129710298?s=200&v=4" alt="LopesTalk LOGO"></td>
    <td colspan=4 align="center"><h1>LopesTalk Project Portfolio</h1></td>
    <td colspan=3><img width="200px" height="200px" src="https://avatars.githubusercontent.com/u/129710298?s=200&v=4" alt="LopesTalk LOGO"></td>
  </tr>
  <tr>
    <td colspan=10 align="center"><h3>Jesseña Quiñones</h3></td>
  </tr>
    <tr>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
    <td>  </td>
  </tr>
</table>


## Table of Contents

- [Introduction](#introduction)
- [Requirements](#requirements)
  - [Functional Requirements](#functional-requirements)
  - [Non-Functional Requirements (NFRs)](#non-functional-requirements-nfrs)
- [Technologies & Tools](#technologies--tools)
- [Cloud Deployment](#cloud-deployment)
  - [Frontend (Flutter App)](#frontend-flutter-app)
  - [Backend (Spring Boot)](#backend-spring-boot)
  - [Cross-Origin Resource Sharing (CORS)](#cross-origin-resource-sharing-cors)
  - [Monitoring](#monitoring)
- [Technical Approach](#technical-approach)
- [Risks & Challenges](#risks--challenges)
- [Contacts](#contacts)

#### Introduction

LopesTalk is a mental health app designed to empower students to prioritize their well-being through fun and engaging self-care activities. Our mission is to help students succeed in their academic and personal goals by focusing on self-care, one task at a time. As Lopers, we are passionate about making a positive impact in the GCU community and beyond, and we believe that by taking care of ourselves, we can better support and care for those around us. With our innovative approach and commitment to mental health, LopesTalk is here to help students thrive.

## Requirements

### Functional Requirements

- Users can sign up for an account
- Users can log into their account
- Users can access a variety of self-care paths and tasks
- Users will be able to see the LopesTalk mascot 'Lopey' on home screen
- Users can see a daily motivaitonal quote with author
- Users can add/delete/update tasks for journey paths

### Non-Functional Requirements (NFRs)

- The app should be responsive and connected 80% during the month
- The app should be responsive and work well on different Android devices: (mobile, tablet)
- The app should be fast and responsive, with minimal lag or delay

## Technologies & Tools

LopesTalk is built using the following technologies and tools:
- Flutter \[v3.7.10]
- Dart \ [2.19.6]
- Spring Boot \[3.0.5]
  - MongoDB.Driver \[v2.15.0]
  - Java [v17.0]
-  MongoDB Atlas
- Hosting
  - AWS Hosting Elastic Beanstalk Service
- Other Tools
  - Postman \[v10.12.13]
  - Swagger \[3.0]
  - UpTimeRobot Monitoring
  - VSCode IDE \[v1.77.3]

<table>
  <tr align="center">
    <td>
      <img width="300" src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fblog.scottlogic.com%2Fbquinn%2Fassets%2FFlutter_logo_text.png&f=1&nofb=1&ipt=27adcee19052e570c4c7ed2825236e71146825ad47371e0de4ad3679a117f0dd&ipo=images"/>
    </td>
    <td>
      <img width="300" src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmanifesto.co.uk%2Fwp-content%2Fuploads%2F2014%2F08%2Fdart-logo.png&f=1&nofb=1&ipt=bdd1d1f185a353fcd6c2153283945a31a5f07e661bd4902683fc27e95f1e2cbc&ipo=images"/>
    </td>
    <td>
      <img width="300" src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.freebiesupply.com%2Flogos%2Fthumbs%2F2x%2Fjava-14-logo.png&f=1&nofb=1&ipt=96d3cce70f769bb587869145ff2bd598ecda55822177def44fedc89b327849f5&ipo=images"/>
   </td>
  </tr><tr></tr>
  <tr align="center">
    <td align="center">
      <img width="200"  src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi2.wp.com%2Fsoftwareengineeringdaily.com%2Fwp-content%2Fuploads%2F2016%2F12%2Fmongodb-atlas-logo.png&f=1&nofb=1&ipt=7c876e3fde85e105ba80689befd0406e948871f6f9b8d87f876fd1edd2a09069&ipo=images"/>
    </td>
    <td>
      <img width="300" src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ffuturumresearch.com%2Fwp-content%2Fuploads%2F2020%2F01%2Faws-logo.png&f=1&nofb=1&ipt=fc57404c8d1bdcf78cc85f4d283b6a4be568ea15655f8034a2f64080d9513bf9&ipo=images"/>
    </td>
    <td>
      <img width="300" src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fraw.githubusercontent.com%2Fswagger-api%2Fswagger.io%2Fwordpress%2Fimages%2Fassets%2FSWU-logo-clr.png&f=1&nofb=1&ipt=174e38fadc36dc83e2f8573a18173c0779c83afaecb74610567c8b73cfc91d41&ipo=images"/>
    </td>
</table>


## Cloud Deployment

LopesTalk is deployed on the cloud using the following services:

### Frontend (Flutter App)

The Flutter app is deployed through the Google Play Store.

### Backend (Spring Boot)

The custom API is deployed on AWS Elastic Beanstalk, a cloud platform as a service (PaaS) that allows us to easily deploy and scale web applications.

### Cross-Origin Resource Sharing (CORS)

To allow cross-origin requests from the Flutter app to the API

### Monitoring

LopesTalk uses UptimeRobot to monitor errors and exceptions that occur in the app.


## Technical Approach

Our application follows a client-server architecture, with the Flutter framework serving as the client and Spring Boot serving as the server. The client-server architecture allows for a clear separation of concerns between the user interface and the application logic.

In terms of development methodology, we have opted for a waterfall approach. This approach emphasizes a linear, sequential process where each stage of the development process (requirements, design, implementation, testing, and deployment) is completed before moving on to the next stage. While this approach may not be as flexible as Agile, it allows for well-defined requirements and a fixed scope.

We are also following a modular design pattern, which allows us to break down the application into smaller, reusable components. This makes it easier to maintain and update the codebase over time.

Finally, we are using MongoDB Atlas as our database. This cloud-based database service provides us with a scalable, secure, and reliable database solution for our application.


## Risks & Challenges

A few challenges when writing the app was the following:
- Investing in a cloud server- AWS
- Hosting on a cloud server
- Monitoring app uptime 
- Learning a new open source software platform - Flutter
- Investing into graphic design(paying artist)
- Investing to be able to publish on the Google Play Store
- Implementing an external API for Quotes

A few risks when writing the app was the following:
- Before I could get LopesTalk up and running one risk was the idea of using Flutter. If it wasn't a good fit I was going to need to switch to another application such as Android Studio. 
- One risk of building LopesTalk was the the mascot. I wanted to give the users a virtual friend but drawing wise I struggle. I was able to buy some art from a friend to give users Lopey!
- Another risk was the idea of implementing an external API. This would save me time instead of having to fully create an API by scratch for motivational quotes.

One of the main challenges in developing LopesTalk is creating engaging and effective self-care resources that resonate with students. To tackle this, I researched various self-care routes and gathered relevant examples. Providing users with a clear understanding of each path with tasks.


## Contacts

- Jesseña Quiñones - [LinkedIn](https://www.linkedin.com/in/jessena-quinones) - [GitHub](https://github.com/jessenaqu)
