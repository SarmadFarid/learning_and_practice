require("dotenv").config();
const express = require("express");
const cors = require("cors");
const Stripe = require("stripe");

const app = express();
const stripe = Stripe(process.env.STRIPE_SECRET_KEY);
app.use(cors());

app.post(
  "/webhook",
  express.raw({ type: "application/json" }),
  (req, res) => {
    const sig = req.headers["stripe-signature"];

    let event;

    try {
      event = stripe.webhooks.constructEvent(
        req.body,
        sig,
        process.env.STRIPE_WEBHOOK_SECRET,
      );
    } catch (err) {
      console.log("❌ Webhook signature verification failed.", err.message);
      return res.sendStatus(400);
    }

    console.log("✅ Webhook received:", event.type);

    switch (event.type) {
      case "payment_intent.succeeded":
        const paymentIntent = event.data.object;
        const propertyId = event.metadata.propertyId; 
        const userId = event.metadata.userId; 

        console.log("prperty Id ", propertyId);  
        console.log("user Id :" , userId);  
        
        console.log("💰 Payment succeeded:", paymentIntent.id);
        break;

      case "payment_intent.payment_failed":
        console.log("❌ Payment failed");
        break;

      case "payment_intent.processing":
        console.log("⏳ Payment processing");
        break;

      default:
        console.log(`Unhandled event type ${event.type}`);
    }

    res.json({ received: true });
  },
);


app.use(express.json());

app.get("/", (req, res) => {``
  res.send("Stripe backend running");
});


app.post("/create-payment-intent", async (req, res) => {
  console.log("Request received:", req.body);
  try {
    const { amount, currency = "usd" } = req.body;

    if (!amount) {
      return res.status(400).json({ error: "Amount is required" });
    }

    // Always validate amount server-side in real apps
    if (amount < 50) {
      return res.status(400).json({ error: "Amount too small" });
    }

    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount, // amount in cents
      currency: currency,
      automatic_payment_methods: {
        enabled: true,
      },
      metadata: {
        propertyId:"property_123", 
        userId:"user_356"
      }
    });

    res.json({
      clientSecret: paymentIntent.client_secret,
      paymentIntentId: paymentIntent.id,
    });
  } catch (error) {
    console.error("Error creating PaymentIntent:", error);
    res.status(500).json({ error: error.message });
  }
});


app.post("/create-customer", async (req, res) => {
  const { email } = req.body;

  try {
    const customer = await stripe.customers.create({
      email: email,
    });

    res.json({ customerId: customer.id });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


app.post("/create-setup-intent", async (req, res) => {
  const { customerId } = req.body;

  try {
    const setupIntent = await stripe.setupIntents.create({
      customer: customerId,
      payment_method_types: ["card"],
    });

    res.json({
      clientSecret: setupIntent.client_secret,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


app.post("/list-payment-methods", async (req, res) => {
  const { customerId } = req.body;

  try {
    const paymentMethods = await stripe.paymentMethods.list({
      customer: customerId,
      type: "card",
    });

    res.json(paymentMethods.data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


app.post("/set-default-card", async (req, res) => {
  const { customerId, paymentMethodId } = req.body;

  try {
    await stripe.customers.update(customerId, {
      invoice_settings: {
        default_payment_method: paymentMethodId,
      },
    });

    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


app.post("/charge-default-card", async (req, res) => {
  const { customerId, amount } = req.body;

  try {
    const customer = await stripe.customers.retrieve(customerId);

    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount,
      currency: "usd",
      customer: customerId,
      payment_method: customer.invoice_settings.default_payment_method,
      off_session: true,
      confirm: true,
    });

    res.json({ success: true, paymentIntent });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});





app.listen(process.env.PORT, () => {
  console.log(`Server running on port ${process.env.PORT}`);
});

