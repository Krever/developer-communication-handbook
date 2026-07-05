# The Developer Communication Handbook

## Intro

Communicating with people comes naturally and mostly works, so we don't think about it. It's
also a huge and imprecise topic, and many books have been written about it. This handbook focuses on the parts of
communication that matter to software developers. It isn't a comprehensive guide, and won't, for example, teach an
engineering manager how to lay people off. But it does try to teach things like:

* how to give and receive pull request feedback
* how to name and phrase things, like error messages, APIs or variables
* how to talk with stakeholders, managers and fellow developers (and why each needs a different approach)
* how to share estimates and manage expectations
* how to make your work visible
* how to not bore your colleagues at standups

It also covers some more general topics, such as:

* how to organise your work
* how to avoid confusion
* how to not be a jerk
* the basics of public speaking

There is one perfect, infallible way to communicate without any friction: **know what's inside the receiver's head**.
Unfortunately, evolution never equipped us with it.

### Principles

Every piece of advice in this handbook distills down to two first principles:

1. **Understand what they think.**
2. **Adjust to what they think.**

"They" is whoever receives your message.

The whole of this book will look into different aspects of software development from those two angles: how to better
understand people we talk with and how to adjust our communication to that understanding.

It contains helpful tactics but they are not important. The primary objective is to
build proper intuition. No one can be expected to keep tens or hundreds of tiny rules in their head, so the goal is
to build a skill of unconsciously predicting and adapting our interactions.

## Before development

### Gathering requirements

To deliver a product or a feature we have to know what are the requirements. Those lucky of us have a product manager or
business analysts
who make this process simpler, but even then a significant amount of work has to be put into refining their vision.
Alternatively (or parallely), we need to talk with stakeholders (most of which will be non-technical) directly and
figure out
the requirements on our own. In either case there is a lot of talking involved and its important to do it effectively:
extract as much _correct_ information as possible in as little time as possible (because likes spending times in
meetings?).

**Understand**

* Product Managers are not omniscient and might lack information
* Product Managers are busy and often work on multiple things at once
* Stakeholders have their own priorities and cannot be expected to care about the project as much as you do
* Stakeholders usually don't know what solution they want, but they do know what problems they have
* Neither PM nor stakeholders are responsible for the technical side of the project
* People have a tendency to assume you know things that are obvious to them

**Adjust**

* Share with the PM or the team any concerns you might have with the project
* Try to propose solutions instead of asking for direction - it's much easier for Them to criticize than to come up with
  the satrting point
* Don't assume things have been thought about if not explicitly stated. Confirm everything of importance.
* ...

### Estimates

As a software developer you will be frequently asked about

**Understand**

* People ask for estimates for multiple reasons, all of which require different approach. Those could be: internal
  planning of work without external consequences,
  planning public announcements, adhering to external deadlines (e.g. legal/compliance requirements or public events),
  comparing work items in terms of cost, adjusting pricing for the client (in-case of software houses)
* Some reasons require estimates and some commitments
    * estimate: approximation of effort needed to deliver a feature
    * commitment: promise that a feature will be delivered by certain date
* Estimates might vary in scope and can include any subset of: requirements’ acquisition, core logic development,
  writing automated tests, conducting manual testing, deploying to certain envrionments, canary deployments, monitoring,
  post-release adjustments
* Estimating time might mean either work-time or calendar time. Work time is simply how much time has to be spent on
  scope. Calendar time is work time adjusted for the number of people
  involved, holidays, other conflicting projects, maintenance of existing features and unplanned fire-fighting.
* Every estimate is an approximation by definition and might come with a different uncertainty factor. Doing something
  you do every month (e.g. integrating a new datasource into the data lake) is different from creating a completely new
  product line
* People asking for an estimate usually don't care about all those details and just want to see the number that matches
  their model and context.
* Lowering the estimate, e.g. due to perceived pressure, is equal to lying. If the provided number is correct but too
  big it can spark negotiations, e.g. adding more people or removing features. Taking decision based on incorrect number
  is an easy
  way to a failed project.
* If you deliver sooner than estimate, everyone will be happy. If you deliver later, everyone will be angry.
* Approximations get more correct the smaller the distance to the goal.

**Adjust**

* If not clear, *always* ask about the reason for the estimate
* Don't assume people know the difference between estimate and commitment. Explicitly confirm which one is needed.
* Be explicit about what's in the scope of the estimate
* When estimating time, be explicit if it's work-time or estimate time.
* Be explicit about the uncertainity and the impact it has on the numbers. 
* Underpromise, overdeliver. Don't inflate the estimates artificially, but when it doubt it's saffer to provide a bigger
  number and adjust if needed.
* Repeat estimations e.g. every week or month, as new things are disocvered and work gets completed. 
