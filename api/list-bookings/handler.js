const AWS = require('aws-sdk')
AWS.config.update({
    region: process.env.AWS_REGION
})
const documentClient = new AWS.DynamoDB.DocumentClient()

module.exports.list = async (event) => {
    if (event.requestContext.authorizer.role === 'admin') {
        const data = await documentClient.scan({
            TableName: process.env.DYNAMODB_BOOKINGS
        }).promise()

        return {
            statusCode: 200,
            body: JSON.stringify(data.Items)
        }
    }

    return {
        statusCode: 401,
        body: JSON.stringify({
            message: 'Unauthorized'
        })
    }
}
