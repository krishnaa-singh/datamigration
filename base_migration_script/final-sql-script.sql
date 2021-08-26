UPDATE public.crm_team
     SET id = migrate.crm_team.id, name = migrate.crm_team.name, active = migrate.crm_team.active FROM migrate.crm_team 
WHERE public.crm_team.id=migrate.crm_team.id;

UPDATE public.sale_order
     SET id = migrate.sale_order.id,
          write_uid = migrate.sale_order.write_uid, write_date = migrate.sale_order.write_date, sale_order_template_id = migrate.sale_order.sale_order_template_id, 
          campaign_id = migrate.sale_order.campaign_id, source_id = migrate.sale_order.source_id, medium_id = migrate.sale_order.medium_id, incoterm = migrate.sale_order.incoterm, picking_policy = migrate.sale_order.picking_policy,
          warehouse_id = migrate.sale_order.warehouse_id, procurement_group_id = migrate.sale_order.procurement_group_id, effective_date = migrate.sale_order.effective_date, cart_recovery_email_sent = migrate.sale_order.cart_recovery_email_sent, website_id = migrate.sale_order.website_id, warning_stock = migrate.sale_order.warning_stock, carrier_id = migrate.sale_order.carrier_id,
          delivery_price = migrate.sale_order.delivery_price, delivery_message = migrate.sale_order.delivery_message, delivery_rating_success = migrate.sale_order.delivery_rating_success, invoice_shipping_on_delivery = migrate.sale_order.invoice_shipping_on_delivery, amount_delivery = migrate.sale_order.amount_delivery, has_delivery = migrate.sale_order.has_delivery, 
          code_promo_program_id = migrate.sale_order.code_promo_program_id,
          opportunity_id = migrate.sale_order.opportunity_id, 
          status_stellar = migrate.sale_order.x_studio_status_stellar, 
          field_YR61u = migrate.sale_order.x_studio_field_YR61u,
          margin = migrate.sale_order.margin, argo_so_ = migrate.sale_order.x_studio_argo_so_, 
          customer_po_ = migrate.sale_order.x_studio_customer_po_,
          comments_1 = migrate.sale_order.x_studio_comments_1, delivery_method = migrate.sale_order.x_studio_delivery_method, 
          customer_notes = migrate.sale_order.x_studio_customer_notes, partner_note = migrate.sale_order.partner_note, website_status_1 = migrate.sale_order.x_studio_website_status_1 FROM migrate.sale_order 
WHERE public.sale_order.id=migrate.sale_order.id;


UPDATE public.sale_order_line
     SET id = migrate.sale_order_line.id, order_id = migrate.sale_order_line.order_id, name = migrate.sale_order_line.name, sequence = migrate.sale_order_line.sequence, invoice_status = migrate.sale_order_line.invoice_status, price_unit = migrate.sale_order_line.price_unit, price_subtotal = migrate.sale_order_line.price_subtotal, price_tax = migrate.sale_order_line.price_tax, price_total = migrate.sale_order_line.price_total, price_reduce = migrate.sale_order_line.price_reduce, price_reduce_taxinc = migrate.sale_order_line.price_reduce_taxinc, price_reduce_taxexcl = migrate.sale_order_line.price_reduce_taxexcl, discount = migrate.sale_order_line.discount, product_id = migrate.sale_order_line.product_id, product_uom_qty = migrate.sale_order_line.product_uom_qty, product_uom = migrate.sale_order_line.product_uom, qty_delivered_method = migrate.sale_order_line.qty_delivered_method, qty_delivered = migrate.sale_order_line.qty_delivered, qty_delivered_manual = migrate.sale_order_line.qty_delivered_manual, qty_to_invoice = migrate.sale_order_line.qty_to_invoice, qty_invoiced = migrate.sale_order_line.qty_invoiced, untaxed_amount_invoiced = migrate.sale_order_line.untaxed_amount_invoiced, untaxed_amount_to_invoice = migrate.sale_order_line.untaxed_amount_to_invoice, salesman_id = migrate.sale_order_line.salesman_id, currency_id = migrate.sale_order_line.currency_id, company_id = migrate.sale_order_line.company_id, order_partner_id = migrate.sale_order_line.order_partner_id, is_expense = migrate.sale_order_line.is_expense, is_downpayment = migrate.sale_order_line.is_downpayment, state = migrate.sale_order_line.state, customer_lead = migrate.sale_order_line.customer_lead, display_type = migrate.sale_order_line.display_type, create_uid = migrate.sale_order_line.create_uid, create_date = migrate.sale_order_line.create_date, write_uid = migrate.sale_order_line.write_uid, write_date = migrate.sale_order_line.write_date, product_packaging = migrate.sale_order_line.product_packaging, route_id = migrate.sale_order_line.route_id, linked_line_id = migrate.sale_order_line.linked_line_id, warning_stock = migrate.sale_order_line.warning_stock, is_delivery = migrate.sale_order_line.is_delivery, unit_price_discount = migrate.sale_order_line.x_studio_unit_price_discount, unit_price_after_discount = migrate.sale_order_line.x_studio_unit_price_after_discount, is_reward_line = migrate.sale_order_line.is_reward_line, sku = migrate.sale_order_line.x_studio_sku, field_Q61lY = migrate.sale_order_line.x_studio_field_Q61lY, field_FnedJ = migrate.sale_order_line.x_studio_field_FnedJ, vendor = migrate.sale_order_line.x_studio_vendor, notes = migrate.sale_order_line.x_studio_notes, field_A6aTY = migrate.sale_order_line.x_studio_field_A6aTY, invoice_count = migrate.sale_order_line.x_studio_invoice_count, stellar_status = migrate.sale_order_line.x_studio_stellar_status, margin = migrate.sale_order_line.margin, purchase_price = migrate.sale_order_line.purchase_price, field_XsiJW = migrate.sale_order_line.x_studio_field_XsiJW FROM migrate.sale_order_line 
WHERE public.sale_order_line.id=migrate.sale_order_line.id;


UPDATE public.product_product
     SET id = migrate.product_product.id, default_code = migrate.product_product.default_code, active = migrate.product_product.active, product_tmpl_id = migrate.product_product.product_tmpl_id, barcode = migrate.product_product.barcode, volume = migrate.product_product.volume, weight = migrate.product_product.weight, message_main_attachment_id = migrate.product_product.message_main_attachment_id, create_uid = migrate.product_product.create_uid, create_date = migrate.product_product.create_date, write_uid = migrate.product_product.write_uid, write_date = migrate.product_product.write_date, stock_value_1 = migrate.product_product.x_stock_value, qty_at_date_1 = migrate.product_product.x_qty_at_date, unit_price = migrate.product_product.x_unit_price, pricelist_name = migrate.product_product.x_studio_pricelist_name FROM migrate.product_product 
WHERE public.product_product.id=migrate.product_product.id;

UPDATE public.product_template
     SET id = migrate.product_template.id, product_variant_id = migrate.product_template.product_variant_id,pricelist_name == migrate.product_template.pricelist_name, name = migrate.product_template.name, sequence = migrate.product_template.sequence, description = migrate.product_template.description, description_purchase = migrate.product_template.description_purchase, description_sale = migrate.product_template.description_sale, type = migrate.product_template.type, rental = migrate.product_template.rental, categ_id = migrate.product_template.categ_id, list_price = migrate.product_template.list_price, volume = migrate.product_template.volume, weight = migrate.product_template.weight, sale_ok = migrate.product_template.sale_ok, purchase_ok = migrate.product_template.purchase_ok, uom_id = migrate.product_template.uom_id, uom_po_id = migrate.product_template.uom_po_id, company_id = migrate.product_template.company_id, active = migrate.product_template.active, color = migrate.product_template.color, default_code = migrate.product_template.default_code, message_main_attachment_id = migrate.product_template.message_main_attachment_id, create_uid = migrate.product_template.create_uid, create_date = migrate.product_template.create_date, write_uid = migrate.product_template.write_uid, write_date = migrate.product_template.write_date, service_type = migrate.product_template.service_type, sale_line_warn = migrate.product_template.sale_line_warn, sale_line_warn_msg = migrate.product_template.sale_line_warn_msg, expense_policy = migrate.product_template.expense_policy, invoice_policy = migrate.product_template.invoice_policy, purchase_method = migrate.product_template.purchase_method, purchase_line_warn = migrate.product_template.purchase_line_warn, purchase_line_warn_msg = migrate.product_template.purchase_line_warn_msg, service_to_purchase = migrate.product_template.service_to_purchase, responsible_id = migrate.product_template.responsible_id, sale_delay = migrate.product_template.sale_delay, tracking = migrate.product_template.tracking, description_picking = migrate.product_template.description_picking, description_pickingout = migrate.product_template.description_pickingout, description_pickingin = migrate.product_template.description_pickingin, rating_last_value = migrate.product_template.rating_last_value, website_meta_title = migrate.product_template.website_meta_title, website_meta_description = migrate.product_template.website_meta_description, website_meta_keywords = migrate.product_template.website_meta_keywords, website_meta_og_img = migrate.product_template.website_meta_og_img, website_id = migrate.product_template.website_id, is_published = migrate.product_template.is_published, website_description = migrate.product_template.website_description, website_size_x = migrate.product_template.website_size_x, website_size_y = migrate.product_template.website_size_y, website_sequence = migrate.product_template.website_sequence, inventory_availability = migrate.product_template.inventory_availability, available_threshold = migrate.product_template.available_threshold, custom_message = migrate.product_template.custom_message, hs_code = migrate.product_template.hs_code, field_EI5S4 = migrate.product_template.x_studio_field_EI5S4, qty_incoming = migrate.product_template.x_studio_qty_incoming, qty_outgoing = migrate.product_template.x_studio_qty_outgoing, qty_sold = migrate.product_template.x_studio_qty_sold FROM migrate.product_template 
WHERE public.product_template.id=migrate.product_template.id;


UPDATE public.purchase_order
     SET id = migrate.purchase_order.id, name = migrate.purchase_order.name, origin = migrate.purchase_order.origin, partner_ref = migrate.purchase_order.partner_ref, date_order = migrate.purchase_order.date_order, date_approve = migrate.purchase_order.date_approve, partner_id = migrate.purchase_order.partner_id, dest_address_id = migrate.purchase_order.dest_address_id, currency_id = migrate.purchase_order.currency_id, state = migrate.purchase_order.state, notes = migrate.purchase_order.notes, invoice_count = migrate.purchase_order.invoice_count, invoice_status = migrate.purchase_order.invoice_status, date_planned = migrate.purchase_order.date_planned, amount_untaxed = migrate.purchase_order.amount_untaxed, amount_tax = migrate.purchase_order.amount_tax, amount_total = migrate.purchase_order.amount_total, fiscal_position_id = migrate.purchase_order.fiscal_position_id, payment_term_id = migrate.purchase_order.payment_term_id, incoterm_id = migrate.purchase_order.incoterm_id, user_id = migrate.purchase_order.user_id, company_id = migrate.purchase_order.company_id, message_main_attachment_id = migrate.purchase_order.message_main_attachment_id, access_token = migrate.purchase_order.access_token, create_uid = migrate.purchase_order.create_uid, create_date = migrate.purchase_order.create_date, write_uid = migrate.purchase_order.write_uid, write_date = migrate.purchase_order.write_date, picking_count_1 = migrate.purchase_order.picking_count, picking_type_id = migrate.purchase_order.picking_type_id, group_id = migrate.purchase_order.group_id, select_broker_1 = migrate.purchase_order.x_studio_select_broker_1, invoice = migrate.purchase_order.x_studio_invoice, so = migrate.purchase_order.x_studio_so, term = migrate.purchase_order.x_studio_term, x_picking_count = migrate.purchase_order.x_picking_count,po_ = migrate.purchase_order.x_studio_po_, bill_reference_ = migrate.purchase_order.x_studio_bill_reference_, comments_po = migrate.purchase_order.x_studio_comments_po, purchase_stellar_status = migrate.purchase_order.x_purchase_stellar_status, deliver_to_address = migrate.purchase_order.x_studio_deliver_to_address FROM migrate.purchase_order 
WHERE public.purchase_order.id=migrate.purchase_order.id;

UPDATE public.purchase_order_line
     SET id = migrate.purchase_order_line.id, name = migrate.purchase_order_line.name, sequence = migrate.purchase_order_line.sequence, product_qty = migrate.purchase_order_line.product_qty, product_uom_qty = migrate.purchase_order_line.product_uom_qty, date_planned = migrate.purchase_order_line.date_planned, product_uom = migrate.purchase_order_line.product_uom, product_id = migrate.purchase_order_line.product_id, price_unit = migrate.purchase_order_line.price_unit, price_subtotal = migrate.purchase_order_line.price_subtotal, price_total = migrate.purchase_order_line.price_total, price_tax = migrate.purchase_order_line.price_tax, order_id = migrate.purchase_order_line.order_id, account_analytic_id = migrate.purchase_order_line.account_analytic_id, company_id = migrate.purchase_order_line.company_id, state = migrate.purchase_order_line.state, qty_invoiced = migrate.purchase_order_line.qty_invoiced, qty_received = migrate.purchase_order_line.qty_received, partner_id = migrate.purchase_order_line.partner_id, currency_id = migrate.purchase_order_line.currency_id, create_uid = migrate.purchase_order_line.create_uid, create_date = migrate.purchase_order_line.create_date, write_uid = migrate.purchase_order_line.write_uid, write_date = migrate.purchase_order_line.write_date, sale_order_id = migrate.purchase_order_line.sale_order_id, sale_line_id = migrate.purchase_order_line.sale_line_id, orderpoint_id = migrate.purchase_order_line.orderpoint_id, purchase_qty_ordered = migrate.purchase_order_line.x_purchase_qty_ordered, bill_count = migrate.purchase_order_line.x_bill_count,field_Vhfzt = migrate.purchase_order_line.x_studio_field_Vhfzt, qty_ordered = migrate.purchase_order_line.x_studio_qty_ordered, stellar_status_po = migrate.purchase_order_line.x_studio_stellar_status_po FROM migrate.purchase_order_line 
WHERE public.purchase_order_line.id=migrate.purchase_order_line.id;

UPDATE public.res_company
     SET id = migrate.res_company.id, name = migrate.res_company.name, partner_id = migrate.res_company.partner_id, currency_id = migrate.res_company.currency_id, sequence = migrate.res_company.sequence, create_date = migrate.res_company.create_date, parent_id = migrate.res_company.parent_id, report_header = migrate.res_company.report_header, report_footer = migrate.res_company.report_footer, logo_web = migrate.res_company.logo_web, account_no = migrate.res_company.account_no, email = migrate.res_company.email, phone = migrate.res_company.phone, company_registry = migrate.res_company.company_registry, paperformat_id = migrate.res_company.paperformat_id, external_report_layout_id = migrate.res_company.external_report_layout_id, base_onboarding_company_state = migrate.res_company.base_onboarding_company_state, create_uid = migrate.res_company.create_uid, write_uid = migrate.res_company.write_uid, write_date = migrate.res_company.write_date, snailmail_color = migrate.res_company.snailmail_color, snailmail_duplex = migrate.res_company.snailmail_duplex, fiscalyear_last_day = migrate.res_company.fiscalyear_last_day, fiscalyear_last_month = migrate.res_company.fiscalyear_last_month, period_lock_date = migrate.res_company.period_lock_date, fiscalyear_lock_date = migrate.res_company.fiscalyear_lock_date, transfer_account_id = migrate.res_company.transfer_account_id, expects_chart_of_accounts = migrate.res_company.expects_chart_of_accounts, chart_template_id = migrate.res_company.chart_template_id, bank_account_code_prefix = migrate.res_company.bank_account_code_prefix, cash_account_code_prefix = migrate.res_company.cash_account_code_prefix, transfer_account_code_prefix = migrate.res_company.transfer_account_code_prefix, account_sale_tax_id = migrate.res_company.account_sale_tax_id, account_purchase_tax_id = migrate.res_company.account_purchase_tax_id, tax_cash_basis_journal_id = migrate.res_company.tax_cash_basis_journal_id, tax_calculation_rounding_method = migrate.res_company.tax_calculation_rounding_method, currency_exchange_journal_id = migrate.res_company.currency_exchange_journal_id, anglo_saxon_accounting = migrate.res_company.anglo_saxon_accounting, property_stock_account_input_categ_id = migrate.res_company.property_stock_account_input_categ_id, property_stock_account_output_categ_id = migrate.res_company.property_stock_account_output_categ_id, property_stock_valuation_account_id = migrate.res_company.property_stock_valuation_account_id, overdue_msg = migrate.res_company.overdue_msg, tax_exigibility = migrate.res_company.tax_exigibility, account_bank_reconciliation_start = migrate.res_company.account_bank_reconciliation_start, incoterm_id = migrate.res_company.incoterm_id, invoice_reference_type = migrate.res_company.invoice_reference_type, qr_code = migrate.res_company.qr_code, invoice_is_email = migrate.res_company.invoice_is_email, invoice_is_print = migrate.res_company.invoice_is_print, account_opening_move_id = migrate.res_company.account_opening_move_id, account_setup_bank_data_state = migrate.res_company.account_setup_bank_data_state, account_setup_fy_data_state = migrate.res_company.account_setup_fy_data_state, account_setup_coa_state = migrate.res_company.account_setup_coa_state, account_onboarding_invoice_layout_state = migrate.res_company.account_onboarding_invoice_layout_state, account_onboarding_sample_invoice_state = migrate.res_company.account_onboarding_sample_invoice_state, account_onboarding_sale_tax_state = migrate.res_company.account_onboarding_sale_tax_state, account_invoice_onboarding_state = migrate.res_company.account_invoice_onboarding_state, account_dashboard_onboarding_state = migrate.res_company.account_dashboard_onboarding_state, currency_interval_unit = migrate.res_company.currency_interval_unit, currency_next_execution_date = migrate.res_company.currency_next_execution_date, currency_provider = migrate.res_company.currency_provider, last_currency_sync_date = migrate.res_company.last_currency_sync_date, payment_acquirer_onboarding_state = migrate.res_company.payment_acquirer_onboarding_state, payment_onboarding_payment_method = migrate.res_company.payment_onboarding_payment_method, invoice_is_snailmail = migrate.res_company.invoice_is_snailmail, yodlee_access_token = migrate.res_company.yodlee_access_token, yodlee_user_login = migrate.res_company.yodlee_user_login, yodlee_user_password = migrate.res_company.yodlee_user_password, yodlee_user_access_token = migrate.res_company.yodlee_user_access_token, sale_note = migrate.res_company.sale_note, portal_confirmation_sign = migrate.res_company.portal_confirmation_sign, portal_confirmation_pay = migrate.res_company.portal_confirmation_pay, quotation_validity_days = migrate.res_company.quotation_validity_days, sale_quotation_onboarding_state = migrate.res_company.sale_quotation_onboarding_state, sale_onboarding_order_confirmation_state = migrate.res_company.sale_onboarding_order_confirmation_state, sale_onboarding_sample_quotation_state = migrate.res_company.sale_onboarding_sample_quotation_state, sale_onboarding_payment_method = migrate.res_company.sale_onboarding_payment_method, po_lead = migrate.res_company.po_lead, po_lock = migrate.res_company.po_lock, po_double_validation = migrate.res_company.po_double_validation, po_double_validation_amount = migrate.res_company.po_double_validation_amount, resource_calendar_id = migrate.res_company.resource_calendar_id, social_twitter = migrate.res_company.social_twitter, social_facebook = migrate.res_company.social_facebook, social_github = migrate.res_company.social_github, social_linkedin = migrate.res_company.social_linkedin, social_youtube = migrate.res_company.social_youtube, social_googleplus = migrate.res_company.social_googleplus, social_instagram = migrate.res_company.social_instagram, nomenclature_id = migrate.res_company.nomenclature_id, propagation_minimum_delta = migrate.res_company.propagation_minimum_delta, internal_transit_location_id = migrate.res_company.internal_transit_location_id, security_lead = migrate.res_company.security_lead, website_sale_onboarding_payment_acquirer_state = migrate.res_company.website_sale_onboarding_payment_acquirer_state, website_sale_dashboard_onboarding_state = migrate.res_company.website_sale_dashboard_onboarding_state, extract_show_ocr_option_selection = migrate.res_company.extract_show_ocr_option_selection, days_between_two_followups = migrate.res_company.days_between_two_followups, totals_below_sections = migrate.res_company.totals_below_sections, account_check_printing_layout = migrate.res_company.account_check_printing_layout, account_check_printing_date_label = migrate.res_company.account_check_printing_date_label, account_check_printing_multi_stub = migrate.res_company.account_check_printing_multi_stub, account_check_printing_margin_top = migrate.res_company.account_check_printing_margin_top, account_check_printing_margin_left = migrate.res_company.account_check_printing_margin_left, account_check_printing_margin_right = migrate.res_company.account_check_printing_margin_right, vat_check_vies = migrate.res_company.vat_check_vies FROM migrate.res_company 
WHERE public.res_company.id=migrate.res_company.id;

UPDATE public.res_partner
     SET id = migrate.res_partner.id, name = migrate.res_partner.name, company_id = migrate.res_partner.company_id, create_date = migrate.res_partner.create_date, display_name = migrate.res_partner.display_name, date = migrate.res_partner.date, title = migrate.res_partner.title, parent_id = migrate.res_partner.parent_id, ref = migrate.res_partner.ref, lang = migrate.res_partner.lang, tz = migrate.res_partner.tz, user_id = migrate.res_partner.user_id, vat = migrate.res_partner.vat, website = migrate.res_partner.website, comment = migrate.res_partner.comment, credit_limit = migrate.res_partner.credit_limit, barcode = migrate.res_partner.barcode, active = migrate.res_partner.active, customer = migrate.res_partner.customer, supplier = migrate.res_partner.supplier, employee = migrate.res_partner.employee, function = migrate.res_partner.function, type = migrate.res_partner.type, street = migrate.res_partner.street, street2 = migrate.res_partner.street2, zip = migrate.res_partner.zip, city = migrate.res_partner.city, state_id = migrate.res_partner.state_id, country_id = migrate.res_partner.country_id, email = migrate.res_partner.email, phone = migrate.res_partner.phone, mobile = migrate.res_partner.mobile, is_company = migrate.res_partner.is_company, industry_id = migrate.res_partner.industry_id, color = migrate.res_partner.color, partner_share = migrate.res_partner.partner_share, commercial_partner_id = migrate.res_partner.commercial_partner_id, commercial_company_name = migrate.res_partner.commercial_company_name, company_name = migrate.res_partner.company_name, create_uid = migrate.res_partner.create_uid, write_uid = migrate.res_partner.write_uid, write_date = migrate.res_partner.write_date, message_main_attachment_id = migrate.res_partner.message_main_attachment_id, message_bounce = migrate.res_partner.message_bounce, signup_token = migrate.res_partner.signup_token, signup_type = migrate.res_partner.signup_type, signup_expiration = migrate.res_partner.signup_expiration, ocn_token = migrate.res_partner.ocn_token, team_id = migrate.res_partner.team_id, debit_limit = migrate.res_partner.debit_limit, last_time_entries_checked = migrate.res_partner.last_time_entries_checked, invoice_warn = migrate.res_partner.invoice_warn, invoice_warn_msg = migrate.res_partner.invoice_warn_msg, online_partner_vendor_name = migrate.res_partner.online_partner_vendor_name, online_partner_bank_account = migrate.res_partner.online_partner_bank_account, sale_warn = migrate.res_partner.sale_warn, sale_warn_msg = migrate.res_partner.sale_warn_msg, purchase_warn = migrate.res_partner.purchase_warn, purchase_warn_msg = migrate.res_partner.purchase_warn_msg, calendar_last_notif_ack = migrate.res_partner.calendar_last_notif_ack, picking_warn = migrate.res_partner.picking_warn, picking_warn_msg = migrate.res_partner.picking_warn_msg, website_id = migrate.res_partner.website_id, customer_id = migrate.res_partner.x_studio_customer_id, field_efH4o = migrate.res_partner.x_studio_field_efH4o, field_LMw5H = migrate.res_partner.x_studio_field_LMw5H, field_nKi0h = migrate.res_partner.x_studio_field_nKi0h, pst_number = migrate.res_partner.x_studio_pst_number, website_meta_title = migrate.res_partner.website_meta_title, website_meta_description = migrate.res_partner.website_meta_description, website_meta_keywords = migrate.res_partner.website_meta_keywords, website_meta_og_img = migrate.res_partner.website_meta_og_img, is_published = migrate.res_partner.is_published, website_description = migrate.res_partner.website_description, website_short_description = migrate.res_partner.website_short_description, fax = migrate.res_partner.x_studio_fax, phone2 = migrate.res_partner.x_studio_phone2, contact_name = migrate.res_partner.x_studio_contact_name, second_contact_name = migrate.res_partner.x_studio_second_contact_name, subscribed_to_confirmation_email = migrate.res_partner.subscribed_to_confirmation_email FROM migrate.res_partner 
WHERE public.res_partner.id=migrate.res_partner.id;

UPDATE public.res_users
     SET id = migrate.res_users.id, active = migrate.res_users.active, login = migrate.res_users.login, password = migrate.res_users.password, company_id = migrate.res_users.company_id, partner_id = migrate.res_users.partner_id, create_date = migrate.res_users.create_date, signature = migrate.res_users.signature, action_id = migrate.res_users.action_id, share = migrate.res_users.share, create_uid = migrate.res_users.create_uid, write_uid = migrate.res_users.write_uid, write_date = migrate.res_users.write_date, alias_id = migrate.res_users.alias_id, notification_type = migrate.res_users.notification_type, odoobot_state = migrate.res_users.odoobot_state, sale_team_id = migrate.res_users.sale_team_id, website_id = migrate.res_users.website_id, target_sales_won = migrate.res_users.target_sales_won, target_sales_done = migrate.res_users.target_sales_done, target_sales_invoiced = migrate.res_users.target_sales_invoiced FROM migrate.res_users 
WHERE public.res_users.id=migrate.res_users.id;

UPDATE public.stock_move_line
     SET id = migrate.stock_move_line.id,invoice_number = migrate.stock_move_line.invoice_number,  picking_id = migrate.stock_move_line.picking_id, move_id = migrate.stock_move_line.move_id, product_id = migrate.stock_move_line.product_id, product_uom_id = migrate.stock_move_line.product_uom_id, product_qty = migrate.stock_move_line.product_qty, product_uom_qty = migrate.stock_move_line.product_uom_qty, qty_done = migrate.stock_move_line.qty_done, package_id = migrate.stock_move_line.package_id, package_level_id = migrate.stock_move_line.package_level_id, lot_id = migrate.stock_move_line.lot_id, lot_name = migrate.stock_move_line.lot_name, result_package_id = migrate.stock_move_line.result_package_id, date = migrate.stock_move_line.date, owner_id = migrate.stock_move_line.owner_id, location_id = migrate.stock_move_line.location_id, location_dest_id = migrate.stock_move_line.location_dest_id, state = migrate.stock_move_line.state, reference = migrate.stock_move_line.reference, create_uid = migrate.stock_move_line.create_uid, create_date = migrate.stock_move_line.create_date, write_uid = migrate.stock_move_line.write_uid, write_date = migrate.stock_move_line.write_date, location_processed = migrate.stock_move_line.location_processed, ordered_qty = migrate.stock_move_line.x_studio_ordered_qty, currency_id = migrate.stock_move_line.x_currency_id, subtotal = migrate.stock_move_line.x_studio_subtotal, unit_price = migrate.stock_move_line.x_studio_unit_price, item_number = migrate.stock_move_line.x_studio_item_number, unit_price_after_discount = migrate.stock_move_line.x_unit_price_after_discount, rma_customer_number = migrate.stock_move_line.x_studio_rma_customer_number, notes = migrate.stock_move_line.x_studio_notes, rma_request_type = migrate.stock_move_line.x_studio_rma_request_type, vendor_name = migrate.stock_move_line.x_studio_vendor_name, customer_name = migrate.stock_move_line.x_studio_customer_name, admin_notes = migrate.stock_move_line.x_studio_admin_notes, unit_price_1 = migrate.stock_move_line.x_studio_unit_price_1, customer_name_1 = migrate.stock_move_line.x_studio_customer_name_1, product_name = migrate.stock_move_line.x_studio_product_name, invoice_date = migrate.stock_move_line.x_studio_invoice_date FROM migrate.stock_move_line 
WHERE public.stock_move_line.id=migrate.stock_move_line.id;

UPDATE public.stock_picking
     SET id = migrate.stock_picking.id, name = migrate.stock_picking.name, origin = migrate.stock_picking.origin, note = migrate.stock_picking.note, backorder_id = migrate.stock_picking.backorder_id, move_type = migrate.stock_picking.move_type, state = migrate.stock_picking.state, group_id = migrate.stock_picking.group_id, priority = migrate.stock_picking.priority, scheduled_date = migrate.stock_picking.scheduled_date, date = migrate.stock_picking.date, date_done = migrate.stock_picking.date_done, location_id = migrate.stock_picking.location_id, location_dest_id = migrate.stock_picking.location_dest_id, picking_type_id = migrate.stock_picking.picking_type_id, partner_id = migrate.stock_picking.partner_id, company_id = migrate.stock_picking.company_id, owner_id = migrate.stock_picking.owner_id, printed = migrate.stock_picking.printed, is_locked = migrate.stock_picking.is_locked, immediate_transfer = migrate.stock_picking.immediate_transfer, message_main_attachment_id = migrate.stock_picking.message_main_attachment_id, create_uid = migrate.stock_picking.create_uid, create_date = migrate.stock_picking.create_date, write_uid = migrate.stock_picking.write_uid, write_date = migrate.stock_picking.write_date, sale_id = migrate.stock_picking.sale_id, website_id = migrate.stock_picking.website_id, carrier_price = migrate.stock_picking.carrier_price, carrier_id = migrate.stock_picking.carrier_id, volume = migrate.stock_picking.volume, weight = migrate.stock_picking.weight, carrier_tracking_ref = migrate.stock_picking.carrier_tracking_ref,pink_slip = migrate.stock_picking.x_studio_pink_slip, argo_reference = migrate.stock_picking.x_studio_argo_reference, stage_id = migrate.stock_picking.x_stage_id, stellar_status_picking = migrate.stock_picking.x_studio_stellar_status_picking, type_of_operation = migrate.stock_picking.x_studio_type_of_operation, operation_type = migrate.stock_picking.x_studio_operation_type, operation_type_id = migrate.stock_picking.x_studio_operation_type_id, currency_id = migrate.stock_picking.x_currency_id, untaxes_amount = migrate.stock_picking.x_studio_untaxes_amount, po_taxes = migrate.stock_picking.x_studio_po_taxes, field_FRcQD = migrate.stock_picking.x_studio_field_FRcQD, warehouse_notes_1 = migrate.stock_picking.x_studio_warehouse_notes_1, global_comments = migrate.stock_picking.x_studio_global_comments, stage = migrate.stock_picking.x_studio_stage, field_pw11C = migrate.stock_picking.x_studio_field_pw11C, customer_po_onPickSlip = migrate.stock_picking.x_customer_po_onPickSlip, purchase_stellar_status = migrate.stock_picking.x_studio_purchase_stellar_status, po_ = migrate.stock_picking.x_studio_po_, invoice_number = migrate.stock_picking.x_invoice_number, so_ = migrate.stock_picking.x_studio_so_, bill_reference_ = migrate.stock_picking.x_studio_bill_reference_, delivery_method = migrate.stock_picking.x_studio_delivery_method FROM migrate.stock_picking 
WHERE public.stock_picking.id=migrate.stock_picking.id;

UPDATE public.stock_production_lot
     SET sales_order = migrate.stock_production_lot.sales_order  FROM migrate.stock_production_lot 
WHERE public.stock_production_lot.id=migrate.stock_production_lot.id;

UPDATE public.stock_quant
     SET cost = migrate.stock_production_lot.cost,cost_total = migrate.stock_production_lot.cost_total  FROM migrate.stock_quant 
WHERE public.stock_quant.id=migrate.stock_quant.id;


UPDATE public.stock_valuation_layer
     SET qty_at_date_1 = migrate.stock_valuation_layer.qty_at_date_1,stock_value_1 = migrate.stock_valuation_layer.stock_value_1 ,lst_price = migrate.stock_valuation_layer.lst_price,unit_price = migrate.stock_valuation_layer.unit_price   FROM migrate.stock_valuation_layer 
WHERE public.stock_valuation_layer.id=migrate.stock_valuation_layer.id;