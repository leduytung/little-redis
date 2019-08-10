import React from 'react';
import Messages from './Messages'
import { excuteCommand } from '../actions/axios-request';
import {
  Container, Header, Form, Feed
} from 'semantic-ui-react'

const user = 'ubuntu@root: '
const extraText = "This is server response."

export default class Cli extends React.Component {
  static propTypes = {
  };

  constructor(props) {
    super(props);
    this.state = { command: '', results: [] }
  }

  handleChange = (e, { name, value }) => {
    this.setState({ [name]: value })
  }

  handleSubmit = (e) => {
    let cmd = {}
    cmd['command'] = this.state.command
    cmd['result'] = 'Response'
    let temp = this.state.results
    temp.unshift(cmd)
    
    this.setState({results: temp})
    this.setState({ command: '' })
  }

  render() {
    const { command } = this.state
    return (
      <div>
        <Header as='h2' content='Dummy CLI for Dummy Ledis' style={{margin: '3em', }} textAlign='center' />
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
