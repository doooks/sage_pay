SagePay
=======

# Description

This is a Ruby library for integrating with SagePay. SagePay is a payment
gateway for accepting credit card payments through your web app. It offers
three different integration modes:

* Form, which is the simplest, and just involves crafting an HTML form that
  submits information to SagePay. This is not something you're going to need
  much help with, so this gem currently doesn't help you out there.

* Server, which is the sweet spot: you can do most of the transaction types
  that you'd want to do, but you don't have to take/store credit card numbers,
  so you don't have to worry too much about PCI compliance.

* Direct, the full-on integration where you take the credit card numbers
  directly on your app and the client need never know you're talking to
  SagePay to do the payment.

The current client app I'm writing is using SagePay Server, so that's where
the current implementation will be focused. Direct will follow when I (or
somebody else) has the impetus to do so.

# Installation

You should be able to install the gem directly from Gemcutter, the newly
default Rubygems repository. Simply do:

    (sudo) gem install sage_pay

and you're good to go.

# Assumptions

This gem currently implements SagePay protocol version 2.23. The client app
I'm writing is in Rails, so there are probably some assumptions around that,
too.
