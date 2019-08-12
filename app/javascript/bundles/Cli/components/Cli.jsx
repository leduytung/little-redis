import React from 'react';
import Messages from './Messages'
import { excuteCommand } from '../actions/axios-request';
import {
  Container, Header, Form, Feed
} from 'semantic-ui-react'

export default class Cli extends React.Component {
  static propTypes = {
  };

  constructor(props) {
    super(props);
    this.state = { command: '', results: [] }
  }

  excuteCommand = (params) => {
    // Push new command to array, in the first place.
    let temp = this.state.results
    temp.unshift(params)
    this.setState({results: temp})
  }

  handleChange = (e, { name, value }) => {
    this.setState({ [name]: value })
  }

  handleSubmit = (e) => {
    excuteCommand(this.state.command, this.excuteCommand)
    this.setState({ command: '' })
  }

  render() {
    const { command } = this.state
    return (
      <div>
        <Header as='h2' content='Little CLI for Ledis' style={{margin: '3em', }} textAlign='center' />
        <Container >
          <Form onSubmit={this.handleSubmit}>
            <Form.Input placeholder='Command' name='command' value={command} onChange={this.handleChange}>
            </Form.Input>
          </Form>
          <Messages
            messages = {this.state.results}
          />
        </Container>
      </div>
    );
  }
}
