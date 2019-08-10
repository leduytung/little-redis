import PropTypes from 'prop-types';
import React from 'react';
import {
  Feed
} from 'semantic-ui-react'

const USER = 'ubuntu@root: '

export default class Messages extends React.Component {
  static propTypes = {
      messages: PropTypes.array
  };

  constructor(props) {
    super(props);
  }

  render() {
    const { messages } = this.props
    return (
      <Feed style={{overflow: 'auto', maxHeight: 500 }}>
        {messages.map((message, index) => (
        <Feed.Event key={index}>
          <Feed.Content>
            <Feed.Summary>
              <a>{USER}</a> {message['command']}
            </Feed.Summary>
            <Feed.Extra content={message['result']} />
          </Feed.Content>
        </Feed.Event>))}
      </Feed>
    );
  }
}
