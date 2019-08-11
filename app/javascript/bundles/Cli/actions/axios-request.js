import axios from 'axios';
const PATH = '/cli'

export function excuteCommand(param, callback) {
  axios.post(PATH, {command: param})
  .then(res => {
    callback(res.data)
  })
  .catch(error => {
    callback({command: param, result: error.message})
  })
}