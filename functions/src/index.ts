import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();
const db = admin.firestore();

import * as sgMail from '@sendgrid/mail';

const API_KEY = functions.config().sendgrid.key;
const TEMPLATE_ID = functions.config().sendgrid.template();
sgMail.setAPIKey(API_KEY);

export const genericEmail = functions.https.onCall(async (data, context) => {

if (!context.auth && !context.auth.token.mail) {
throw new functions.https.HttpsError('failed-precondition', 'Must be logged in with an email address');
}

const msg = {
    to: context.auth.token.email,
    from: levmartens@gmail.com,
    templateId: TEMPLATE_ID,
    dynamic_template_data: {
        subject: data.subject,
        name: data.text,
    }
}

await sgMail.send(msg);

return { success: true };

});







