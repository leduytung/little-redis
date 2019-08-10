import axios from 'axios';
const PATH = '/cli'

export function excuteCommand(params = {}) {
  let result = {}
  axios.post(PATH)
  .then(res => {
    result = res.data;
  })
  return result
}