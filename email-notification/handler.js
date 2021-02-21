'use strict';
const nodemailer = require('nodemailer')

// create reusable transporter object using the default SMTP transport
const transporter = nodemailer.createTransport({
  host: process.env.SMTP_SERVER,
  port: 465,
  secure: true, // true for 465, false for other ports
  auth: {
    user: process.env.EMAIL_FROM, // generated ethereal user
    pass: process.env.EMAIL_FROM_PASSWORD, // generated ethereal password
  },
});  

module.exports.send = async (event) => {
  const emailPromises = []

  for (const record of event.Records) {
    const message = JSON.parse(record.body).Message
    
    emailPromises.push(transporter.sendMail({
      from: `"Reservas" ${process.env.EMAIL_FROM}`,
      to: process.env.EMAIL_TO,
      subject: "Reserva efetuada",
      text: message,
      html: message,
    }))
  }

  await Promise.all(emailPromises)
  console.log('Todos e-mails enviados com sucesso')
  return { message: 'Go Serverless v1.0! Your function executed successfully!', event };
};
