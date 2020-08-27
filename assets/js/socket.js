import { Socket } from 'phoenix';

let socket = new Socket('/socket', { params: { token: window.userToken } });

socket.connect();

const meetingUuid = document.getElementById("header").getAttribute("data");
console.log(meetingUuid)

let channel = socket.channel(`video:${meetingUuid}`, {});

channel
  .join()
  .receive('ok', resp => {
    console.log('Joined successfully', resp);
  })
  .receive('error', resp => {
    console.error('Unable to join', resp);
  });

export default channel;