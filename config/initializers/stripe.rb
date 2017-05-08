if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => "pk_test_5WcVBTFRm7efXyPyLHsm7dyE",
    :secret_key => "sk_test_MhIjYvxtAgSml5cTFVps0wkD"
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
