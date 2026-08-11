# Day 9 – Lightning Web Components & Deployment

## Objective

To build and deploy Lightning Web Components and integrate them into a Salesforce Lightning page using Lightning App Builder.

## Work Completed

- Set up the Salesforce DX project in VS Code.
- Connected the Salesforce Playground to VS Code.
- Configured `PlacementOrg` as the target Salesforce org.
- Worked with the `eligibleJobs` Lightning Web Component.
- Worked with the `placementHome` Lightning Web Component.
- Deployed the LWC components to the Salesforce Playground.
- Added the `Eligible Jobs` component to the Placement Home Lightning page.
- Saved and verified the final Lightning page.

## Components

### eligibleJobs

Displays eligible job opportunities on the Placement Home page.

### placementHome

Acts as the main Placement Portal page and contains the Eligible Jobs component.

## Project Structure

```text
PlacementManagementSystem/
│
├── force-app/
│   └── main/
│       └── default/
│           └── lwc/
│               ├── eligibleJobs/
│               │   ├── eligibleJobs.html
│               │   ├── eligibleJobs.js
│               │   └── eligibleJobs.js-meta.xml
│               │
│               └── placementHome/
│                   ├── placementHome.html
│                   ├── placementHome.js
│                   └── placementHome.js-meta.xml
│
├── manifest/
├── sfdx-project.json
└── README.md
