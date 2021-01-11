'use strict';

const AWS = require("aws-sdk")
const bcrypt = require("bcryptjs")
const { v4: uuidv4 } = require("uuid")

AWS.config.update({
  region: process.env.AWS_REGION
})

const documentClient = new AWS.DynamoDB.DocumentClient()

module.exports.register = async (event) => {
  const body = JSON.parse(event.body)
  await documentClient.put({
    TableName: process.env.DYNAMODB_USERS,
    Item: {
      id: uuidv4(),
      name: body.name,
      email: body.email,
      password: bcrypt.hashSync(body.password, 10)
    }
  }).promise()
  return {
    statusCode: 201,
    body: JSON.stringify(
      {
        message: 'Usuário inserido com successo'
      }
    ),
  };

  // Use this code if you don't use the http event with the LAMBDA-PROXY integration
  // return { message: 'Go Serverless v1.0! Your function executed successfully!', event };
};
