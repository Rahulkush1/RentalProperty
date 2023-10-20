Rails.configuration.stripe = { 
  :publishable_key => "pk_test_51O2t3FSH6OcOxuhnnJDGpo3CDg2zuqJm5RC21EdPFwcy2ZJdlSfANKaCCSYJYZ4hSRMr6HnWU3H7iLznjHiIaAQS00JxvDUZvk",
  :secret_key => "sk_test_51O2t3FSH6OcOxuhn7suYA0qCK6eg9034Pf1G761Znff6v03oG5kRokDahxfyGJJ8n0CTQ2z28GDRikrvNqC1ybHU00EQ12r2BW"
} 
Stripe.api_key = Rails.configuration.stripe[:secret_key]