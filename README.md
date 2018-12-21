# Simple iOS Coordinator Pattern Example

This code represent an example to help me to deliver my talk regarding to Coordinator Pattern.

## Why using coordinator pattern? (according to my own experience)

- Separation of concern, because VC doing many things
- Hard to change the flow because navigation flows are handled on VC
- Hard to test the flow correctness
- VC tend to hold unneccessary dependency during passing data in certain flow

## So, the purpose of coordinator is...

- Handle the navigation flows
- Manage the view controllers in one flow
- Manage data that can be used on other controllers in one flow

## How VC and coordinator communicates

- Using delegate
- Using closure / blocks

## There's still available for improvements, such as

- Isolating UINavigationController specific things into one another layer for better testability
- View Controllers & Coordinator creation using factory & also abstracting them to adhere Open/Closed principle
