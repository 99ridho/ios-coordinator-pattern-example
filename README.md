# Simple iOS Coordinator Pattern Example

This code represent an example for help me to deliver my talk regarding to Coordinator Pattern.

## Why using coordinator pattern?

- Separation of concern, because VC doing many things
- Hard to change the flow because navigation flows are handled on VC
- Hard to test

## So, the purpose of coordinator is...

- Handle the navigation flows
- Manage the view controllers in one flow
- Manage data that can be used on other controllers in one flow

## How VC and coordinator communicates

- Using delegate
- Using closure / blocks
