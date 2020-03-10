# React Notes

## Life Cycle Methods

- These will be depricated in React v0.17.0
  - `componentWillMount()`
  - `componentWillReceiveProps()`
  - `componentWillUnmount()`
- Other life cycle methods
  - `getDerivedStateFromProps(props, state)`
    - return the new, updated state based upon the props
  - `getSnapshotBeforeUpdate()`
    - create a backup of the current way things are
  - `shouldComponentUpdate(nextProps, nextState)`
    - return true if want it to update, false if not
