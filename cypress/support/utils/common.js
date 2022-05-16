export const extractUrlFromEmail = (response) => {
  const mail = response?.body?.mail
  const actualUrl = mail.split('\n').filter((e) => e.indexOf('//localhost:5100') > 1)[0]
  return actualUrl.split('localhost:5100')[1]
}
