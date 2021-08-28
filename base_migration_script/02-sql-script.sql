ALTER TABLE product_product DISABLE TRIGGER ALL;
INSERT INTO product_product ( id,  default_code, active, product_tmpl_id, barcode, volume, weight, create_uid, create_date, write_uid, write_date )
SELECT id,  default_code, active, product_tmpl_id, barcode, volume, weight, create_uid, create_date, write_uid, write_date FROM migrate.product_product
WHERE NOT EXISTS (SELECT 1 FROM product_product WHERE id=migrate.product_product.id);
SELECT pg_catalog.setval('product_product_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_product) x;
ALTER TABLE product_product ENABLE TRIGGER ALL;

ALTER TABLE product_pricelist DISABLE TRIGGER ALL;
DELETE FROM product_pricelist;
INSERT INTO product_pricelist ( id, name, active, currency_id, company_id, sequence, discount_policy, website_id,selectable, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, active, currency_id, company_id, sequence, discount_policy,website_id,selectable, create_uid, create_date, write_uid, write_date FROM migrate.product_pricelist 
WHERE NOT EXISTS (SELECT 1 FROM product_pricelist WHERE id=migrate.product_pricelist.id);
SELECT pg_catalog.setval('product_pricelist_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_pricelist) x;
ALTER TABLE product_pricelist ENABLE TRIGGER ALL;

ALTER TABLE product_pricelist_item DISABLE TRIGGER ALL;
DELETE FROM product_pricelist_item;
INSERT INTO product_pricelist_item ( id,active,product_tmpl_id,product_id, categ_id, min_quantity, applied_on, base, base_pricelist_id, pricelist_id, price_surcharge, price_discount, price_round, price_min_margin, price_max_margin, company_id, currency_id, date_start, date_end, compute_price, fixed_price, percent_price, create_uid, create_date, write_uid, write_date ) 
SELECT id, True, product_tmpl_id,product_id, categ_id, min_quantity, applied_on, base, base_pricelist_id, pricelist_id, price_surcharge, price_discount, price_round, price_min_margin, price_max_margin, company_id, currency_id, date_start, date_end, compute_price, fixed_price, percent_price, create_uid, create_date, write_uid, write_date FROM migrate.product_pricelist_item 
WHERE NOT EXISTS (SELECT 1 FROM product_pricelist_item WHERE id=migrate.product_pricelist_item.id);
SELECT pg_catalog.setval('product_pricelist_item_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_pricelist_item) x;
ALTER TABLE product_pricelist_item ENABLE TRIGGER ALL;

ALTER TABLE product_attribute DISABLE TRIGGER ALL;
INSERT INTO product_attribute ( id, name, sequence, create_variant, create_uid, create_date, write_uid, write_date, display_type )
SELECT id, name, sequence, create_variant, create_uid, create_date, write_uid, write_date, type FROM migrate.product_attribute
WHERE NOT EXISTS (SELECT 1 FROM product_attribute WHERE id=migrate.product_attribute.id);
SELECT pg_catalog.setval('product_attribute_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_attribute) x;
ALTER TABLE product_attribute ENABLE TRIGGER ALL;

ALTER TABLE product_attribute_value DISABLE TRIGGER ALL;
INSERT INTO product_attribute_value ( id, name, sequence, attribute_id, is_custom, html_color, create_uid, create_date, write_uid, write_date )
SELECT id, name, sequence, attribute_id, is_custom, html_color, create_uid, create_date, write_uid, write_date FROM migrate.product_attribute_value
WHERE NOT EXISTS (SELECT 1 FROM product_attribute_value WHERE id=migrate.product_attribute_value.id);
SELECT pg_catalog.setval('product_attribute_value_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_attribute_value) x;
ALTER TABLE product_attribute_value ENABLE TRIGGER ALL;

ALTER TABLE product_template_attribute_line DISABLE TRIGGER ALL;
INSERT INTO product_template_attribute_line ( id, product_tmpl_id, attribute_id, create_uid, create_date, write_uid, write_date )
SELECT id, product_tmpl_id, attribute_id, create_uid, create_date, write_uid, write_date FROM migrate.product_template_attribute_line
WHERE NOT EXISTS (SELECT 1 FROM product_template_attribute_line WHERE id=migrate.product_template_attribute_line.id);
SELECT pg_catalog.setval('product_template_attribute_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_template_attribute_line) x;
ALTER TABLE product_template_attribute_line ENABLE TRIGGER ALL;

ALTER TABLE product_attribute_value DISABLE TRIGGER ALL;
INSERT INTO product_attribute_value ( id, name, sequence, attribute_id, is_custom, html_color, create_uid, create_date, write_uid, write_date )
SELECT id, name, sequence, attribute_id, is_custom, html_color, create_uid, create_date, write_uid, write_date FROM migrate.product_attribute_value
WHERE NOT EXISTS (SELECT 1 FROM product_attribute_value WHERE id=migrate.product_attribute_value.id);
SELECT pg_catalog.setval('product_attribute_value_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_attribute_value) x;
ALTER TABLE product_attribute_value ENABLE TRIGGER ALL;

ALTER TABLE product_attribute_value_product_template_attribute_line_rel DISABLE TRIGGER ALL;
INSERT INTO product_attribute_value_product_template_attribute_line_rel (product_template_attribute_line_id, product_attribute_value_id)
SELECT product_template_attribute_line_id, product_attribute_value_id FROM migrate.product_attribute_value_product_template_attribute_line_rel
WHERE NOT EXISTS (SELECT 1 FROM product_attribute_value_product_template_attribute_line_rel WHERE product_attribute_value_id=migrate.product_attribute_value_product_template_attribute_line_rel.product_attribute_value_id);
ALTER TABLE product_attribute_value_product_template_attribute_line_rel ENABLE TRIGGER ALL;

ALTER TABLE product_template_attribute_value ALTER COLUMN attribute_line_id DROP NOT NULL;

ALTER TABLE product_template_attribute_value DISABLE TRIGGER ALL;
INSERT INTO product_template_attribute_value ( id, product_attribute_value_id, price_extra, product_tmpl_id, create_uid, create_date, write_uid, write_date )
SELECT id, product_attribute_value_id, price_extra, product_tmpl_id, create_uid, create_date, write_uid, write_date FROM migrate.product_template_attribute_value
WHERE NOT EXISTS (SELECT 1 FROM product_template_attribute_value WHERE id=migrate.product_template_attribute_value.id);
SELECT pg_catalog.setval('product_template_attribute_value_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_template_attribute_value) x;
ALTER TABLE product_template_attribute_value ENABLE TRIGGER ALL;

ALTER TABLE product_template DISABLE TRIGGER ALL;
INSERT INTO product_template ( id,name,sequence,description,description_purchase,description_sale,type,categ_id,list_price,volume,weight,sale_ok,purchase_ok,uom_id,uom_po_id,company_id,active,color,default_code,message_main_attachment_id,create_uid,create_date,write_uid,write_date,sale_delay,tracking,description_picking,description_pickingout,description_pickingin,purchase_method,purchase_line_warn,purchase_line_warn_msg,service_type,sale_line_warn,sale_line_warn_msg,expense_policy,invoice_policy,service_to_purchase,rating_last_value,website_meta_title,website_meta_description,website_meta_keywords,website_meta_og_img,website_id,is_published,website_description,website_size_x,website_size_y,website_sequence,inventory_availability,available_threshold,custom_message)
SELECT id,name,sequence,description,description_purchase,description_sale,type,categ_id,list_price,volume,weight,sale_ok,purchase_ok,uom_id,uom_po_id,company_id,active,color,default_code,message_main_attachment_id,create_uid,create_date,write_uid,write_date,sale_delay,tracking,description_picking,description_pickingout,description_pickingin,purchase_method,purchase_line_warn,purchase_line_warn_msg,service_type,sale_line_warn,sale_line_warn_msg,expense_policy,invoice_policy,service_to_purchase,rating_last_value,website_meta_title,website_meta_description,website_meta_keywords,website_meta_og_img,website_id,is_published,website_description,website_size_x,website_size_y,website_sequence,inventory_availability,available_threshold,custom_message FROM migrate.product_template
WHERE NOT EXISTS (SELECT 1 FROM product_template WHERE id=migrate.product_template.id);
SELECT pg_catalog.setval('product_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_template) x;
ALTER TABLE product_template ENABLE TRIGGER ALL;


ALTER TABLE product_attribute_product_template_rel DISABLE TRIGGER ALL;
INSERT INTO product_attribute_product_template_rel ( product_attribute_id, product_template_id )
SELECT attribute_id, product_tmpl_id FROM public.product_template_attribute_line
WHERE NOT EXISTS (SELECT 1 FROM product_attribute_product_template_rel WHERE product_attribute_id=public.product_template_attribute_line.attribute_id AND product_template_id=public.product_template_attribute_line.product_tmpl_id);
ALTER TABLE product_attribute_product_template_rel ENABLE TRIGGER ALL;


UPDATE public.product_template_attribute_value
     SET attribute_id = public.product_attribute_value.attribute_id FROM public.product_attribute_value
WHERE public.product_attribute_value.id=public.product_template_attribute_value.product_attribute_value_id;


UPDATE public.product_template_attribute_value
     SET attribute_line_id = public.product_template_attribute_line.id FROM public.product_template_attribute_line
WHERE public.product_template_attribute_line.product_tmpl_id=public.product_template_attribute_value.product_tmpl_id and public.product_template_attribute_line.attribute_id=public.product_template_attribute_value.attribute_id;

ALTER TABLE product_template_attribute_value ALTER COLUMN attribute_line_id SET NOT NULL;

UPDATE public.product_template_attribute_line
     SET active = True;
UPDATE public.product_template_attribute_value
     SET ptav_active = True;

create TABLE
    public.product_attribute_value_product_product_migrate_rel AS (
select
    migrate.product_attribute_value_product_product_rel.product_product_id,
    migrate.product_attribute_value_product_product_rel.product_attribute_value_id,
    migrate.product_product.product_tmpl_id
from
    migrate.product_attribute_value_product_product_rel
inner join
    migrate.product_product on migrate.product_attribute_value_product_product_rel.product_product_id = migrate.product_product.id);

create TABLE
    public.product_variant_combination_migrate AS (
select
    public.product_attribute_value_product_product_migrate_rel.product_product_id,
    public.product_template_attribute_value.id
from
    public.product_template_attribute_value
inner join
    public.product_attribute_value_product_product_migrate_rel on public.product_attribute_value_product_product_migrate_rel.product_tmpl_id = public.product_template_attribute_value.product_tmpl_id and public.product_attribute_value_product_product_migrate_rel.product_attribute_value_id = public.product_template_attribute_value.product_attribute_value_id);



ALTER TABLE product_variant_combination DISABLE TRIGGER ALL;
INSERT INTO product_variant_combination ( product_product_id, product_template_attribute_value_id )
SELECT product_product_id, id FROM public.product_variant_combination_migrate
WHERE NOT EXISTS (SELECT 1 FROM product_variant_combination WHERE product_product_id=public.product_variant_combination_migrate.product_product_id AND product_template_attribute_value_id=public.product_variant_combination_migrate.id);
ALTER TABLE product_variant_combination ENABLE TRIGGER ALL;

DROP TABLE public.product_variant_combination_migrate, public.product_attribute_value_product_product_migrate_rel;

ALTER TABLE product_category DISABLE TRIGGER ALL;
INSERT INTO product_category ( id, name, complete_name, parent_id, parent_path, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, complete_name, parent_id, parent_path, create_uid, create_date, write_uid, write_date FROM migrate.product_category 
WHERE NOT EXISTS (SELECT 1 FROM product_category WHERE id=migrate.product_category.id);
SELECT pg_catalog.setval('product_category_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_category) x;
ALTER TABLE product_category ENABLE TRIGGER ALL;


ALTER TABLE res_partner DISABLE TRIGGER ALL;
INSERT INTO res_partner ( id, name, company_id, create_date, display_name, date, title, parent_id, ref, lang, tz, user_id, vat, website, comment, credit_limit, active, employee, function, type, street, street2, zip, city, state_id, country_id, email, phone, mobile, is_company, industry_id, color, partner_share, commercial_partner_id, commercial_company_name, company_name, create_uid, write_uid, write_date, message_main_attachment_id, message_bounce, signup_token, signup_type, signup_expiration, calendar_last_notif_ack, team_id, ocn_token, debit_limit, last_time_entries_checked, invoice_warn, invoice_warn_msg, website_id, is_published, online_partner_vendor_name, online_partner_bank_account, purchase_warn, purchase_warn_msg, sale_warn, sale_warn_msg ) 
SELECT id, name, company_id, create_date, display_name, date, title, parent_id, ref, lang, tz, user_id, vat, website, comment, credit_limit, active, employee, function, type, street, street2, zip, city, state_id, country_id, email, phone, mobile, is_company, industry_id, color, partner_share, commercial_partner_id, commercial_company_name, company_name, create_uid, write_uid, write_date, message_main_attachment_id, message_bounce, signup_token, signup_type, signup_expiration, calendar_last_notif_ack, team_id, ocn_token,debit_limit, last_time_entries_checked, invoice_warn, invoice_warn_msg, website_id, is_published, online_partner_vendor_name, online_partner_bank_account, purchase_warn, purchase_warn_msg, sale_warn, sale_warn_msg FROM migrate.res_partner 
WHERE NOT EXISTS (SELECT 1 FROM res_partner WHERE id=migrate.res_partner.id);
SELECT pg_catalog.setval('res_partner_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner) x;
ALTER TABLE res_partner ENABLE TRIGGER ALL;


ALTER TABLE res_users DISABLE TRIGGER ALL;
INSERT INTO res_users ( id, active, login, password, company_id, partner_id, create_date, signature, action_id, share, create_uid, write_uid, write_date, notification_type, odoobot_state, sale_team_id, target_sales_won, target_sales_done, website_id, target_sales_invoiced ) 
SELECT id, active, login, password, company_id, partner_id, create_date, signature, action_id, False, create_uid, write_uid, write_date, notification_type, odoobot_state, sale_team_id, target_sales_won, target_sales_done, website_id, target_sales_invoiced FROM migrate.res_users 
WHERE NOT EXISTS (SELECT 1 FROM res_users WHERE id=migrate.res_users.id);
SELECT pg_catalog.setval('res_users_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_users) x;
ALTER TABLE res_users ENABLE TRIGGER ALL;


ALTER TABLE product_supplierinfo DISABLE TRIGGER ALL;
DELETE FROM product_supplierinfo;
INSERT INTO product_supplierinfo ( id, name, product_name, product_code, sequence, min_qty, price, company_id, currency_id, date_start, date_end, product_id, product_tmpl_id, delay, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, product_name, product_code, sequence, min_qty, price, company_id, currency_id, date_start, date_end, product_id, product_tmpl_id, delay, create_uid, create_date, write_uid, write_date FROM migrate.product_supplierinfo 
WHERE NOT EXISTS (SELECT 1 FROM product_supplierinfo WHERE id=migrate.product_supplierinfo.id);
SELECT pg_catalog.setval('product_supplierinfo_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_supplierinfo) x;
ALTER TABLE product_supplierinfo ENABLE TRIGGER ALL;


ALTER TABLE res_company DISABLE TRIGGER ALL;
update res_company set (partner_id,name, currency_id, sequence, create_date, parent_id, report_header, report_footer, logo_web, email, phone, company_registry, paperformat_id, external_report_layout_id, base_onboarding_company_state, create_uid, write_uid, write_date, social_twitter, social_facebook, social_github, social_linkedin, social_youtube, social_instagram, resource_calendar_id, snailmail_color, snailmail_duplex, fiscalyear_last_day, fiscalyear_last_month, period_lock_date, fiscalyear_lock_date, transfer_account_id, expects_chart_of_accounts, chart_template_id, bank_account_code_prefix, cash_account_code_prefix, transfer_account_code_prefix, account_sale_tax_id, account_purchase_tax_id, tax_calculation_rounding_method, currency_exchange_journal_id, anglo_saxon_accounting, property_stock_account_input_categ_id, property_stock_account_output_categ_id, property_stock_valuation_account_id, tax_exigibility, incoterm_id, qr_code, invoice_is_email, invoice_is_print, account_opening_move_id, account_setup_bank_data_state, account_setup_fy_data_state, account_setup_coa_state, account_onboarding_invoice_layout_state, account_onboarding_sale_tax_state, account_invoice_onboarding_state, account_dashboard_onboarding_state, tax_cash_basis_journal_id, extract_show_ocr_option_selection, currency_interval_unit, currency_next_execution_date, currency_provider, payment_acquirer_onboarding_state, payment_onboarding_payment_method, po_lead, po_lock, po_double_validation, po_double_validation_amount, invoice_is_snailmail, yodlee_access_token, yodlee_user_login, yodlee_user_password, yodlee_user_access_token, portal_confirmation_sign, portal_confirmation_pay, quotation_validity_days, sale_quotation_onboarding_state, sale_onboarding_order_confirmation_state, sale_onboarding_sample_quotation_state, sale_onboarding_payment_method) = 
(SELECT partner_id,name, currency_id, sequence, create_date, parent_id, report_header, report_footer, logo_web, email, phone, company_registry, paperformat_id, external_report_layout_id, base_onboarding_company_state, create_uid, write_uid, write_date, social_twitter, social_facebook, social_github, social_linkedin, social_youtube, social_instagram, resource_calendar_id, snailmail_color, snailmail_duplex, fiscalyear_last_day, fiscalyear_last_month, period_lock_date, fiscalyear_lock_date, transfer_account_id, expects_chart_of_accounts, chart_template_id, bank_account_code_prefix, cash_account_code_prefix, transfer_account_code_prefix, account_sale_tax_id, account_purchase_tax_id, tax_calculation_rounding_method, currency_exchange_journal_id, anglo_saxon_accounting, property_stock_account_input_categ_id, property_stock_account_output_categ_id, property_stock_valuation_account_id, tax_exigibility, incoterm_id, qr_code, invoice_is_email, invoice_is_print, account_opening_move_id, account_setup_bank_data_state, account_setup_fy_data_state, account_setup_coa_state, account_onboarding_invoice_layout_state, account_onboarding_sale_tax_state, account_invoice_onboarding_state, account_dashboard_onboarding_state,  tax_cash_basis_journal_id, extract_show_ocr_option_selection, currency_interval_unit, currency_next_execution_date, currency_provider, payment_acquirer_onboarding_state, payment_onboarding_payment_method, po_lead, po_lock, po_double_validation, po_double_validation_amount, invoice_is_snailmail, yodlee_access_token, yodlee_user_login, yodlee_user_password, yodlee_user_access_token, portal_confirmation_sign, portal_confirmation_pay, quotation_validity_days, sale_quotation_onboarding_state, sale_onboarding_order_confirmation_state, sale_onboarding_sample_quotation_state, sale_onboarding_payment_method FROM migrate.res_company);
SELECT pg_catalog.setval('res_company_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_company) x;
ALTER TABLE res_company ENABLE TRIGGER ALL;


ALTER TABLE coupon_program DISABLE TRIGGER ALL;
INSERT INTO coupon_program ( id, name, active, rule_id, reward_id, sequence, maximum_use_number, program_type, promo_code_usage, promo_code, promo_applicability, company_id, validity_duration, create_uid, create_date, write_uid, write_date, website_id ) 
SELECT id, name, active, rule_id, reward_id, sequence, maximum_use_number, program_type, promo_code_usage, promo_code, promo_applicability, company_id, validity_duration, create_uid, create_date, write_uid, write_date, website_id FROM migrate.sale_coupon_program 
WHERE NOT EXISTS (SELECT 1 FROM coupon_program WHERE id=migrate.sale_coupon_program.id);
SELECT pg_catalog.setval('coupon_program_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM coupon_program) x;
ALTER TABLE coupon_program ENABLE TRIGGER ALL;


ALTER TABLE coupon_rule DISABLE TRIGGER ALL;
INSERT INTO coupon_rule ( id, rule_date_from, rule_date_to, rule_partners_domain, rule_products_domain, rule_min_quantity, rule_minimum_amount, rule_minimum_amount_tax_inclusion, create_uid, create_date, write_uid, write_date ) 
SELECT id, rule_date_from, rule_date_to, rule_partners_domain, rule_products_domain, rule_min_quantity, rule_minimum_amount, rule_minimum_amount_tax_inclusion, create_uid, create_date, write_uid, write_date FROM migrate.sale_coupon_rule 
WHERE NOT EXISTS (SELECT 1 FROM coupon_rule WHERE id=migrate.sale_coupon_rule.id);
SELECT pg_catalog.setval('coupon_rule_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM coupon_rule) x;
ALTER TABLE coupon_rule ENABLE TRIGGER ALL;


ALTER TABLE coupon_reward DISABLE TRIGGER ALL;
INSERT INTO coupon_reward ( id, reward_description, reward_type, reward_product_id, reward_product_quantity, discount_type, discount_percentage, discount_apply_on, discount_max_amount, discount_fixed_amount, discount_line_product_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, reward_description, reward_type, reward_product_id, reward_product_quantity, discount_type, discount_percentage, discount_apply_on, discount_max_amount, discount_fixed_amount, discount_line_product_id, create_uid, create_date, write_uid, write_date FROM migrate.sale_coupon_reward 
WHERE NOT EXISTS (SELECT 1 FROM coupon_reward WHERE id=migrate.sale_coupon_reward.id);
SELECT pg_catalog.setval('coupon_reward_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM coupon_reward) x;
ALTER TABLE coupon_reward ENABLE TRIGGER ALL;

ALTER TABLE uom_category DISABLE TRIGGER ALL;
INSERT INTO uom_category ( id, name, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, create_uid, create_date, write_uid, write_date FROM migrate.uom_category 
WHERE NOT EXISTS (SELECT 1 FROM uom_category WHERE id=migrate.uom_category.id);
SELECT pg_catalog.setval('uom_category_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM uom_category) x;
ALTER TABLE uom_category ENABLE TRIGGER ALL;

ALTER TABLE uom_uom DISABLE TRIGGER ALL;
DELETE FROM uom_uom;
INSERT INTO uom_uom ( id, name, category_id, factor, rounding, active, uom_type, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, category_id, factor, rounding, active, uom_type, create_uid, create_date, write_uid, write_date FROM migrate.uom_uom 
WHERE NOT EXISTS (SELECT 1 FROM uom_uom WHERE id=migrate.uom_uom.id);
SELECT pg_catalog.setval('uom_uom_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM uom_uom) x;
ALTER TABLE uom_uom ENABLE TRIGGER ALL;

ALTER TABLE crm_team DISABLE TRIGGER ALL;
INSERT INTO crm_team ( id, message_main_attachment_id, name, active, company_id, user_id, color, create_uid, create_date, write_uid, write_date, use_leads, use_opportunities, alias_id, use_quotations, invoiced_target ) 
SELECT id, message_main_attachment_id, name, active, company_id, user_id, color, create_uid, create_date, write_uid, write_date, use_leads, use_opportunities, alias_id, use_quotations, invoiced_target FROM migrate.crm_team 
WHERE NOT EXISTS (SELECT 1 FROM crm_team WHERE id=migrate.crm_team.id);
SELECT pg_catalog.setval('crm_team_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_team) x;
ALTER TABLE crm_team ENABLE TRIGGER ALL;

ALTER TABLE sale_order DISABLE TRIGGER ALL;
INSERT INTO sale_order ( id, campaign_id,picking_policy,warehouse_id, source_id, medium_id, message_main_attachment_id, access_token, name, origin, client_order_ref, reference, state, date_order, validity_date, require_signature, require_payment, create_date, user_id, partner_id, partner_invoice_id, partner_shipping_id, pricelist_id, analytic_account_id, invoice_status, note, amount_untaxed, amount_tax, amount_total, currency_rate, payment_term_id, fiscal_position_id, company_id, team_id, signed_by, commitment_date, create_uid, write_uid, write_date, sale_order_template_id, opportunity_id ) 
SELECT id, campaign_id,picking_policy,warehouse_id, source_id, medium_id, message_main_attachment_id, access_token, name, origin, client_order_ref, reference, state, date_order, validity_date, require_signature, require_payment, create_date, user_id, partner_id, partner_invoice_id, partner_shipping_id, pricelist_id, analytic_account_id, invoice_status, note, amount_untaxed, amount_tax, amount_total, currency_rate, payment_term_id, fiscal_position_id, company_id, team_id, signed_by, commitment_date, create_uid, write_uid, write_date, sale_order_template_id, opportunity_id FROM migrate.sale_order 
WHERE NOT EXISTS (SELECT 1 FROM sale_order WHERE id=migrate.sale_order.id);
SELECT pg_catalog.setval('sale_order_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM sale_order) x;
ALTER TABLE sale_order ENABLE TRIGGER ALL;

ALTER TABLE sale_order_line DISABLE TRIGGER ALL;
INSERT INTO sale_order_line ( id, order_id, name, sequence, invoice_status, price_unit, price_subtotal, price_tax, price_total, price_reduce, price_reduce_taxinc, price_reduce_taxexcl, discount, product_id, product_uom_qty, product_uom, qty_delivered_method, qty_delivered, qty_delivered_manual, qty_to_invoice, qty_invoiced, untaxed_amount_invoiced, untaxed_amount_to_invoice, salesman_id, currency_id, company_id, order_partner_id, is_expense, is_downpayment, state, customer_lead, display_type, create_uid, create_date, write_uid, write_date ) 
SELECT id, order_id, name, sequence, invoice_status, price_unit, price_subtotal, price_tax, price_total, price_reduce, price_reduce_taxinc, price_reduce_taxexcl, discount, product_id, product_uom_qty, product_uom, qty_delivered_method, qty_delivered, qty_delivered_manual, qty_to_invoice, qty_invoiced, untaxed_amount_invoiced, untaxed_amount_to_invoice, salesman_id, currency_id, company_id, order_partner_id, is_expense, is_downpayment, state, customer_lead, display_type, create_uid, create_date, write_uid, write_date FROM migrate.sale_order_line 
WHERE NOT EXISTS (SELECT 1 FROM sale_order_line WHERE id=migrate.sale_order_line.id);
SELECT pg_catalog.setval('sale_order_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM sale_order_line) x;
ALTER TABLE sale_order_line ENABLE TRIGGER ALL;

ALTER TABLE sale_order_tag_rel DISABLE TRIGGER ALL;
INSERT INTO sale_order_tag_rel ( order_id, tag_id ) 
SELECT order_id, tag_id FROM migrate.sale_order_tag_rel 
WHERE NOT EXISTS (SELECT 1 FROM sale_order_tag_rel WHERE order_id=migrate.sale_order_tag_rel.order_id AND tag_id=migrate.sale_order_tag_rel.tag_id);
ALTER TABLE sale_order_tag_rel ENABLE TRIGGER ALL;


ALTER TABLE account_tax_sale_order_line_rel DISABLE TRIGGER ALL;
INSERT INTO account_tax_sale_order_line_rel ( sale_order_line_id, account_tax_id ) 
SELECT sale_order_line_id, account_tax_id FROM migrate.account_tax_sale_order_line_rel 
WHERE NOT EXISTS (SELECT 1 FROM account_tax_sale_order_line_rel WHERE sale_order_line_id=migrate.account_tax_sale_order_line_rel.sale_order_line_id AND account_tax_id=migrate.account_tax_sale_order_line_rel.account_tax_id);
ALTER TABLE account_tax_sale_order_line_rel ENABLE TRIGGER ALL;

ALTER TABLE purchase_order DISABLE TRIGGER ALL;
INSERT INTO purchase_order ( id, message_main_attachment_id,picking_count,picking_type_id, access_token, name, origin, partner_ref, date_order, date_approve, partner_id, dest_address_id, currency_id, state, notes, invoice_count, invoice_status, date_planned, amount_untaxed, amount_tax, amount_total, fiscal_position_id, payment_term_id, incoterm_id, user_id, company_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, message_main_attachment_id,picking_count,picking_type_id, access_token, name, origin, partner_ref, date_order, date_approve, partner_id, dest_address_id, currency_id, state, notes, invoice_count, invoice_status, date_planned, amount_untaxed, amount_tax, amount_total, fiscal_position_id, payment_term_id, incoterm_id, user_id, company_id, create_uid, create_date, write_uid, write_date FROM migrate.purchase_order 
WHERE NOT EXISTS (SELECT 1 FROM purchase_order WHERE id=migrate.purchase_order.id);
SELECT pg_catalog.setval('purchase_order_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM purchase_order) x;
ALTER TABLE purchase_order ENABLE TRIGGER ALL;

ALTER TABLE account_tax_purchase_order_line_rel DISABLE TRIGGER ALL;
INSERT INTO account_tax_purchase_order_line_rel ( purchase_order_line_id, account_tax_id ) 
SELECT purchase_order_line_id, account_tax_id FROM migrate.account_tax_purchase_order_line_rel 
WHERE NOT EXISTS (SELECT 1 FROM account_tax_purchase_order_line_rel WHERE purchase_order_line_id=migrate.account_tax_purchase_order_line_rel.purchase_order_line_id AND account_tax_id=migrate.account_tax_purchase_order_line_rel.account_tax_id);
ALTER TABLE account_tax_purchase_order_line_rel ENABLE TRIGGER ALL;

ALTER TABLE account_analytic_tag_purchase_order_line_rel DISABLE TRIGGER ALL;
INSERT INTO account_analytic_tag_purchase_order_line_rel ( purchase_order_line_id, account_analytic_tag_id ) 
SELECT purchase_order_line_id, account_analytic_tag_id FROM migrate.account_analytic_tag_purchase_order_line_rel 
WHERE NOT EXISTS (SELECT 1 FROM account_analytic_tag_purchase_order_line_rel WHERE purchase_order_line_id=migrate.account_analytic_tag_purchase_order_line_rel.purchase_order_line_id AND account_analytic_tag_id=migrate.account_analytic_tag_purchase_order_line_rel.account_analytic_tag_id);
ALTER TABLE account_analytic_tag_purchase_order_line_rel ENABLE TRIGGER ALL;

ALTER TABLE purchase_order_line DISABLE TRIGGER ALL;
INSERT INTO purchase_order_line ( id, name, sequence, product_qty, product_uom_qty, date_planned, product_uom, product_id, price_unit, price_subtotal, price_total, price_tax, order_id, account_analytic_id, company_id, state, qty_invoiced, qty_received, partner_id, currency_id, create_uid, create_date, write_uid, write_date, sale_order_id, sale_line_id ) 
SELECT id, name, sequence, product_qty, product_uom_qty, date_planned, product_uom, product_id, price_unit, price_subtotal, price_total, price_tax, order_id, account_analytic_id, company_id, state, qty_invoiced, qty_received, partner_id, currency_id, create_uid, create_date, write_uid, write_date, sale_order_id, sale_line_id FROM migrate.purchase_order_line 
WHERE NOT EXISTS (SELECT 1 FROM purchase_order_line WHERE id=migrate.purchase_order_line.id);
SELECT pg_catalog.setval('purchase_order_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM purchase_order_line) x;
ALTER TABLE purchase_order_line ENABLE TRIGGER ALL;


ALTER TABLE stock_production_lot DISABLE TRIGGER ALL;
INSERT INTO stock_production_lot ( id, message_main_attachment_id,company_id, name, ref, product_id, product_uom_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, message_main_attachment_id,1, name, ref, product_id, product_uom_id, create_uid, create_date, write_uid, write_date FROM migrate.stock_production_lot 
WHERE NOT EXISTS (SELECT 1 FROM stock_production_lot WHERE id=migrate.stock_production_lot.id);
SELECT pg_catalog.setval('stock_production_lot_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_production_lot) x;
ALTER TABLE stock_production_lot ENABLE TRIGGER ALL;

ALTER TABLE stock_move_move_rel DISABLE TRIGGER ALL;
INSERT INTO stock_move_move_rel ( move_orig_id, move_dest_id ) 
SELECT move_orig_id, move_dest_id FROM migrate.stock_move_move_rel 
WHERE NOT EXISTS (SELECT 1 FROM stock_move_move_rel WHERE move_orig_id=migrate.stock_move_move_rel.move_orig_id AND move_dest_id=migrate.stock_move_move_rel.move_dest_id);
ALTER TABLE stock_move_move_rel ENABLE TRIGGER ALL;

ALTER TABLE stock_picking_type DISABLE TRIGGER ALL;
INSERT INTO stock_picking_type ( id, name, color, sequence, sequence_id,sequence_code,company_id, default_location_src_id, default_location_dest_id, code, return_picking_type_id, show_entire_packs, warehouse_id, active, use_create_lots, use_existing_lots, show_operations, show_reserved, barcode, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, color, sequence, sequence_id,'OUT',1, default_location_src_id, default_location_dest_id, code, return_picking_type_id, show_entire_packs, warehouse_id, active, use_create_lots, use_existing_lots, show_operations, show_reserved, barcode, create_uid, create_date, write_uid, write_date FROM migrate.stock_picking_type 
WHERE NOT EXISTS (SELECT 1 FROM stock_picking_type WHERE id=migrate.stock_picking_type.id);
SELECT pg_catalog.setval('stock_picking_type_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_picking_type) x;
ALTER TABLE stock_picking_type ENABLE TRIGGER ALL;

ALTER TABLE stock_move DISABLE TRIGGER ALL;
INSERT INTO stock_move (  id,name,sequence,priority,create_date,date,company_id,product_id,product_qty,product_uom_qty,product_uom,location_id,location_dest_id,partner_id,picking_id,note,state,price_unit,origin,procure_method,scrapped,group_id,rule_id,picking_type_id,inventory_id,origin_returned_move_id,restrict_partner_id,warehouse_id,additional,reference,package_level_id,create_uid,write_uid,write_date,to_refund,purchase_line_id,created_purchase_line_id,sale_line_id) 
SELECT  id,name,sequence,priority,create_date,date,company_id,product_id,product_qty,product_uom_qty,product_uom,location_id,location_dest_id,partner_id,picking_id,note,state,price_unit,origin,procure_method,scrapped,group_id,rule_id,picking_type_id,inventory_id,origin_returned_move_id,restrict_partner_id,warehouse_id,additional,reference,package_level_id,create_uid,write_uid,write_date,to_refund,purchase_line_id,created_purchase_line_id,sale_line_id FROM migrate.stock_move 
WHERE NOT EXISTS (SELECT 1 FROM stock_move WHERE id=migrate.stock_move.id);
SELECT pg_catalog.setval('stock_move_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_move) x;
ALTER TABLE stock_move ENABLE TRIGGER ALL;


ALTER TABLE stock_move_line DISABLE TRIGGER ALL;
INSERT INTO stock_move_line ( id, picking_id, move_id, company_id, product_id, product_uom_id, product_qty, product_uom_qty, qty_done, package_id, package_level_id, lot_id, lot_name, result_package_id, date, owner_id, location_id, location_dest_id, state, reference, create_uid, create_date, write_uid, write_date ) 
SELECT id, picking_id, move_id, 1, product_id, product_uom_id, product_qty, product_uom_qty, qty_done, package_id, package_level_id, lot_id, lot_name, result_package_id, date, owner_id, location_id, location_dest_id, state, reference, create_uid, create_date, write_uid, write_date FROM migrate.stock_move_line 
WHERE NOT EXISTS (SELECT 1 FROM stock_move_line WHERE id=migrate.stock_move_line.id);
SELECT pg_catalog.setval('stock_move_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_move_line) x;
ALTER TABLE stock_move_line ENABLE TRIGGER ALL;

ALTER TABLE stock_move_line_consume_rel DISABLE TRIGGER ALL;
INSERT INTO stock_move_line_consume_rel ( consume_line_id, produce_line_id ) 
SELECT consume_line_id, produce_line_id FROM migrate.stock_move_line_consume_rel 
WHERE NOT EXISTS (SELECT 1 FROM stock_move_line_consume_rel WHERE consume_line_id=migrate.stock_move_line_consume_rel.consume_line_id AND produce_line_id=migrate.stock_move_line_consume_rel.produce_line_id);
ALTER TABLE stock_move_line_consume_rel ENABLE TRIGGER ALL;

ALTER TABLE stock_quant DISABLE TRIGGER ALL;
INSERT INTO stock_quant ( id, product_id, company_id, location_id, lot_id, package_id, owner_id, quantity, reserved_quantity, in_date, create_uid, create_date, write_uid, write_date ) 
SELECT id, product_id, company_id, location_id, lot_id, package_id, owner_id, quantity, reserved_quantity, in_date, create_uid, create_date, write_uid, write_date FROM migrate.stock_quant 
WHERE NOT EXISTS (SELECT 1 FROM stock_quant WHERE id=migrate.stock_quant.id);
SELECT pg_catalog.setval('stock_quant_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_quant) x;
ALTER TABLE stock_quant ENABLE TRIGGER ALL;


ALTER TABLE stock_scrap DISABLE TRIGGER ALL;
INSERT INTO stock_scrap ( id, name, company_id, origin, product_id, product_uom_id, lot_id, package_id, owner_id, move_id, picking_id, location_id, scrap_location_id, scrap_qty, state, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, 1, origin, product_id, product_uom_id, lot_id, package_id, owner_id, move_id, picking_id, location_id, scrap_location_id, scrap_qty, state, create_uid, create_date, write_uid, write_date FROM migrate.stock_scrap 
WHERE NOT EXISTS (SELECT 1 FROM stock_scrap WHERE id=migrate.stock_scrap.id);
SELECT pg_catalog.setval('stock_scrap_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_scrap) x;
ALTER TABLE stock_scrap ENABLE TRIGGER ALL;

ALTER TABLE stock_picking_transfer_rel DISABLE TRIGGER ALL;
INSERT INTO stock_picking_transfer_rel ( stock_immediate_transfer_id, stock_picking_id ) 
SELECT stock_immediate_transfer_id, stock_picking_id FROM migrate.stock_picking_transfer_rel 
WHERE NOT EXISTS (SELECT 1 FROM stock_picking_transfer_rel WHERE stock_immediate_transfer_id=migrate.stock_picking_transfer_rel.stock_immediate_transfer_id AND stock_picking_id=migrate.stock_picking_transfer_rel.stock_picking_id);
ALTER TABLE stock_picking_transfer_rel ENABLE TRIGGER ALL;

ALTER TABLE stock_picking_transfer_rel DISABLE TRIGGER ALL;
INSERT INTO stock_picking_transfer_rel ( stock_immediate_transfer_id, stock_picking_id ) 
SELECT stock_immediate_transfer_id, stock_picking_id FROM migrate.stock_picking_transfer_rel 
WHERE NOT EXISTS (SELECT 1 FROM stock_picking_transfer_rel WHERE stock_immediate_transfer_id=migrate.stock_picking_transfer_rel.stock_immediate_transfer_id AND stock_picking_id=migrate.stock_picking_transfer_rel.stock_picking_id);
ALTER TABLE stock_picking_transfer_rel ENABLE TRIGGER ALL;

ALTER TABLE stock_backorder_confirmation DISABLE TRIGGER ALL;
INSERT INTO stock_backorder_confirmation ( id, create_uid, create_date, write_uid, write_date ) 
SELECT id, create_uid, create_date, write_uid, write_date FROM migrate.stock_backorder_confirmation 
WHERE NOT EXISTS (SELECT 1 FROM stock_backorder_confirmation WHERE id=migrate.stock_backorder_confirmation.id);
SELECT pg_catalog.setval('stock_backorder_confirmation_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_backorder_confirmation) x;
ALTER TABLE stock_backorder_confirmation ENABLE TRIGGER ALL;

ALTER TABLE stock_picking_backorder_rel DISABLE TRIGGER ALL;
INSERT INTO stock_picking_backorder_rel ( stock_backorder_confirmation_id, stock_picking_id ) 
SELECT stock_backorder_confirmation_id, stock_picking_id FROM migrate.stock_picking_backorder_rel 
WHERE NOT EXISTS (SELECT 1 FROM stock_picking_backorder_rel WHERE stock_backorder_confirmation_id=migrate.stock_picking_backorder_rel.stock_backorder_confirmation_id AND stock_picking_id=migrate.stock_picking_backorder_rel.stock_picking_id);
ALTER TABLE stock_picking_backorder_rel ENABLE TRIGGER ALL;

ALTER TABLE stock_location DISABLE TRIGGER ALL;
INSERT INTO stock_location ( id,name,complete_name,active,usage,location_id,comment,posx,posy,posz,parent_path,company_id,scrap_location,return_location,removal_strategy_id,barcode,create_uid,create_date,write_uid,write_date,valuation_in_account_id
,valuation_out_account_id ) 
SELECT id,name,complete_name,active,usage,location_id,comment,posx,posy,posz,parent_path,company_id,scrap_location,return_location,removal_strategy_id,barcode,create_uid,create_date,write_uid,write_date,valuation_in_account_id
,valuation_out_account_id FROM migrate.stock_location 
WHERE NOT EXISTS (SELECT 1 FROM stock_location WHERE id=migrate.stock_location.id);
SELECT pg_catalog.setval('stock_location_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_location) x;
ALTER TABLE stock_location ENABLE TRIGGER ALL;

ALTER TABLE stock_warehouse DISABLE TRIGGER ALL;
INSERT INTO stock_warehouse ( id, name, active, company_id, partner_id, view_location_id, lot_stock_id, code, reception_steps, delivery_steps, wh_input_stock_loc_id, wh_qc_stock_loc_id, wh_output_stock_loc_id, wh_pack_stock_loc_id, mto_pull_id, pick_type_id, pack_type_id, out_type_id, in_type_id, int_type_id, crossdock_route_id, reception_route_id, delivery_route_id, create_uid, create_date, write_uid, write_date, buy_to_resupply, buy_pull_id ) 
SELECT id, name, active, company_id, partner_id, view_location_id, lot_stock_id, code, reception_steps, delivery_steps, wh_input_stock_loc_id, wh_qc_stock_loc_id, wh_output_stock_loc_id, wh_pack_stock_loc_id, mto_pull_id, pick_type_id, pack_type_id, out_type_id, in_type_id, int_type_id, crossdock_route_id, reception_route_id, delivery_route_id, create_uid, create_date, write_uid, write_date, buy_to_resupply, buy_pull_id FROM migrate.stock_warehouse 
WHERE NOT EXISTS (SELECT 1 FROM stock_warehouse WHERE id=migrate.stock_warehouse.id);
SELECT pg_catalog.setval('stock_warehouse_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_warehouse) x;
ALTER TABLE stock_warehouse ENABLE TRIGGER ALL;

ALTER TABLE stock_picking DISABLE TRIGGER ALL;
INSERT INTO stock_picking ( id, message_main_attachment_id, name, origin, note, backorder_id, move_type, state, group_id, priority, scheduled_date, date, date_done, location_id, location_dest_id, picking_type_id, partner_id, company_id, owner_id, printed, is_locked, immediate_transfer, create_uid, create_date, write_uid, write_date, sale_id ) 
SELECT id, message_main_attachment_id, name, origin, note, backorder_id, move_type, state, group_id, priority, scheduled_date, date, date_done, location_id, location_dest_id, picking_type_id, partner_id, company_id, owner_id, printed, is_locked, immediate_transfer, create_uid, create_date, write_uid, write_date, sale_id FROM migrate.stock_picking 
WHERE NOT EXISTS (SELECT 1 FROM stock_picking WHERE id=migrate.stock_picking.id);
SELECT pg_catalog.setval('stock_picking_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_picking) x;
ALTER TABLE stock_picking ENABLE TRIGGER ALL;

ALTER TABLE stock_picking_stage DISABLE TRIGGER ALL;
INSERT INTO stock_picking_stage ( id, name) 
SELECT id,x_name FROM migrate.x_stock_picking_stage 
WHERE NOT EXISTS (SELECT 1 FROM stock_picking_stage WHERE id=migrate.x_stock_picking_stage.id);
SELECT pg_catalog.setval('stock_picking_stage_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_picking_stage) x;
ALTER TABLE stock_picking_stage ENABLE TRIGGER ALL;

ALTER TABLE delivery_carrier DISABLE TRIGGER ALL;
INSERT INTO delivery_carrier ( id, name, active,invoice_policy, sequence, integration_level, prod_environment, debug_logging, company_id, product_id, zip_from, zip_to, margin, free_over, amount, fixed_price, delivery_type, create_uid, create_date, write_uid, write_date, website_id, is_published ) 
SELECT id, name, active,'estimated', sequence, integration_level, prod_environment, debug_logging, company_id, product_id, zip_from, zip_to, margin, free_over, amount, fixed_price, delivery_type, create_uid, create_date, write_uid, write_date, website_id, is_published FROM migrate.delivery_carrier 
WHERE NOT EXISTS (SELECT 1 FROM delivery_carrier WHERE id=migrate.delivery_carrier.id);
SELECT pg_catalog.setval('delivery_carrier_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM delivery_carrier) x;
ALTER TABLE delivery_carrier ENABLE TRIGGER ALL;

ALTER TABLE delivery_carrier_country_rel DISABLE TRIGGER ALL;
INSERT INTO delivery_carrier_country_rel ( carrier_id, country_id ) 
SELECT carrier_id, country_id FROM migrate.delivery_carrier_country_rel 
WHERE NOT EXISTS (SELECT 1 FROM delivery_carrier_country_rel WHERE carrier_id=migrate.delivery_carrier_country_rel.carrier_id AND country_id=migrate.delivery_carrier_country_rel.country_id);
ALTER TABLE delivery_carrier_country_rel ENABLE TRIGGER ALL;

ALTER TABLE delivery_carrier_state_rel DISABLE TRIGGER ALL;
INSERT INTO delivery_carrier_state_rel ( carrier_id, state_id ) 
SELECT carrier_id, state_id FROM migrate.delivery_carrier_state_rel 
WHERE NOT EXISTS (SELECT 1 FROM delivery_carrier_state_rel WHERE carrier_id=migrate.delivery_carrier_state_rel.carrier_id AND state_id=migrate.delivery_carrier_state_rel.state_id);
ALTER TABLE delivery_carrier_state_rel ENABLE TRIGGER ALL;


ALTER TABLE procurement_group DISABLE TRIGGER ALL;
INSERT INTO procurement_group ( id, partner_id, name, move_type, create_uid, create_date, write_uid, write_date, sale_id ) 
SELECT id, partner_id, name, move_type, create_uid, create_date, write_uid, write_date, sale_id FROM migrate.procurement_group 
WHERE NOT EXISTS (SELECT 1 FROM procurement_group WHERE id=migrate.procurement_group.id);
SELECT pg_catalog.setval('procurement_group_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM procurement_group) x;
ALTER TABLE procurement_group ENABLE TRIGGER ALL;

ALTER TABLE res_partner_title DISABLE TRIGGER ALL;
INSERT INTO res_partner_title ( id, name, shortcut, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, shortcut, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_title 
WHERE NOT EXISTS (SELECT 1 FROM res_partner_title WHERE id=migrate.res_partner_title.id);
SELECT pg_catalog.setval('res_partner_title_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_title) x;
ALTER TABLE res_partner_title ENABLE TRIGGER ALL;

ALTER TABLE product_public_category DISABLE TRIGGER ALL;
INSERT INTO product_public_category ( id, website_meta_title, website_meta_description, website_meta_keywords, website_meta_og_img, website_id, name, parent_id, sequence, create_uid, create_date, write_uid, write_date ) 
SELECT id, website_meta_title, website_meta_description, website_meta_keywords, website_meta_og_img, website_id, name, parent_id, sequence, create_uid, create_date, write_uid, write_date FROM migrate.product_public_category 
WHERE NOT EXISTS (SELECT 1 FROM product_public_category WHERE id=migrate.product_public_category.id);
SELECT pg_catalog.setval('product_public_category_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_public_category) x;
ALTER TABLE product_public_category ENABLE TRIGGER ALL;

-----------Mail
ALTER TABLE mail_message DISABLE TRIGGER ALL;
INSERT INTO mail_message ( id, subject, date, body, parent_id, model, res_id, record_name, message_type, subtype_id, mail_activity_type_id, email_from, author_id, no_auto_thread, message_id, reply_to, mail_server_id, moderation_status, moderator_id, email_layout_xmlid, add_sign, create_uid, create_date, write_uid, write_date ) 
SELECT id, subject, date, body, parent_id, model, res_id, record_name, message_type, subtype_id, mail_activity_type_id, email_from, author_id, no_auto_thread, message_id, reply_to, mail_server_id, moderation_status, moderator_id, layout, add_sign, create_uid, create_date, write_uid, write_date FROM migrate.mail_message 
WHERE NOT EXISTS (SELECT 1 FROM mail_message WHERE id=migrate.mail_message.id);
SELECT pg_catalog.setval('mail_message_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_message) x;
ALTER TABLE mail_message ENABLE TRIGGER ALL;

ALTER TABLE mail_alias DISABLE TRIGGER ALL;
INSERT INTO mail_alias ( id, alias_name, alias_model_id, alias_user_id, alias_defaults, alias_force_thread_id, alias_parent_model_id, alias_parent_thread_id, alias_contact, create_uid, create_date, write_uid, write_date ) 
SELECT id, alias_name, alias_model_id, alias_user_id, alias_defaults, alias_force_thread_id, alias_parent_model_id, alias_parent_thread_id, alias_contact, create_uid, create_date, write_uid, write_date FROM migrate.mail_alias 
WHERE NOT EXISTS (SELECT 1 FROM mail_alias WHERE id=migrate.mail_alias.id);
SELECT pg_catalog.setval('mail_alias_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_alias) x;
ALTER TABLE mail_alias ENABLE TRIGGER ALL;

ALTER TABLE mail_followers DISABLE TRIGGER ALL;
INSERT INTO mail_followers ( id, res_model, res_id, partner_id, channel_id ) 
SELECT id, res_model, res_id, partner_id, channel_id FROM migrate.mail_followers 
WHERE NOT EXISTS (SELECT 1 FROM mail_followers WHERE id=migrate.mail_followers.id);
SELECT pg_catalog.setval('mail_followers_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_followers) x;
ALTER TABLE mail_followers ENABLE TRIGGER ALL;

ALTER TABLE mail_channel DISABLE TRIGGER ALL;
INSERT INTO mail_channel ( id, name, channel_type, description, uuid, email_send, public, group_public_id, moderation, moderation_notify, moderation_notify_msg, moderation_guidelines, moderation_guidelines_msg, alias_id, message_main_attachment_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, channel_type, description, uuid, email_send, public, group_public_id, moderation, moderation_notify, moderation_notify_msg, moderation_guidelines, moderation_guidelines_msg, alias_id, message_main_attachment_id, create_uid, create_date, write_uid, write_date FROM migrate.mail_channel 
WHERE NOT EXISTS (SELECT 1 FROM mail_channel WHERE id=migrate.mail_channel.id);
SELECT pg_catalog.setval('mail_channel_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_channel) x;
ALTER TABLE mail_channel ENABLE TRIGGER ALL;

ALTER TABLE mail_followers_mail_message_subtype_rel DISABLE TRIGGER ALL;
INSERT INTO mail_followers_mail_message_subtype_rel ( mail_followers_id, mail_message_subtype_id ) 
SELECT mail_followers_id, mail_message_subtype_id FROM migrate.mail_followers_mail_message_subtype_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_followers_mail_message_subtype_rel WHERE mail_followers_id=migrate.mail_followers_mail_message_subtype_rel.mail_followers_id AND mail_message_subtype_id=migrate.mail_followers_mail_message_subtype_rel.mail_message_subtype_id);
ALTER TABLE mail_followers_mail_message_subtype_rel ENABLE TRIGGER ALL;

ALTER TABLE message_attachment_rel DISABLE TRIGGER ALL;
INSERT INTO message_attachment_rel ( message_id, attachment_id ) 
SELECT message_id, attachment_id FROM migrate.message_attachment_rel 
WHERE NOT EXISTS (SELECT 1 FROM message_attachment_rel WHERE message_id=migrate.message_attachment_rel.message_id AND attachment_id=migrate.message_attachment_rel.attachment_id);
ALTER TABLE message_attachment_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_activity_type DISABLE TRIGGER ALL;
INSERT INTO mail_activity_type ( id, name, summary, sequence, active, create_uid, delay_count, delay_unit, delay_from, icon, decoration_type, res_model_id, default_next_type_id, force_next, category, create_date, write_uid, write_date ) 
SELECT id, name, summary, sequence, active, create_uid, delay_count, delay_unit, delay_from, icon, decoration_type, res_model_id, default_next_type_id, force_next, category, create_date, write_uid, write_date FROM migrate.mail_activity_type 
WHERE NOT EXISTS (SELECT 1 FROM mail_activity_type WHERE id=migrate.mail_activity_type.id);
SELECT pg_catalog.setval('mail_activity_type_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_activity_type) x;
ALTER TABLE mail_activity_type ENABLE TRIGGER ALL;

ALTER TABLE mail_message_res_partner_rel DISABLE TRIGGER ALL;
INSERT INTO mail_message_res_partner_rel ( mail_message_id, res_partner_id ) 
SELECT mail_message_id, res_partner_id FROM migrate.mail_message_res_partner_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_message_res_partner_rel WHERE mail_message_id=migrate.mail_message_res_partner_rel.mail_message_id AND res_partner_id=migrate.mail_message_res_partner_rel.res_partner_id);
ALTER TABLE mail_message_res_partner_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_message_mail_channel_rel DISABLE TRIGGER ALL;
INSERT INTO mail_message_mail_channel_rel ( mail_message_id, mail_channel_id ) 
SELECT mail_message_id, mail_channel_id FROM migrate.mail_message_mail_channel_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_message_mail_channel_rel WHERE mail_message_id=migrate.mail_message_mail_channel_rel.mail_message_id AND mail_channel_id=migrate.mail_message_mail_channel_rel.mail_channel_id);
ALTER TABLE mail_message_mail_channel_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_message_res_partner_starred_rel DISABLE TRIGGER ALL;
INSERT INTO mail_message_res_partner_starred_rel ( mail_message_id, res_partner_id ) 
SELECT mail_message_id, res_partner_id FROM migrate.mail_message_res_partner_starred_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_message_res_partner_starred_rel WHERE mail_message_id=migrate.mail_message_res_partner_starred_rel.mail_message_id AND res_partner_id=migrate.mail_message_res_partner_starred_rel.res_partner_id);
ALTER TABLE mail_message_res_partner_starred_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_activity_rel DISABLE TRIGGER ALL;
INSERT INTO mail_activity_rel ( activity_id, recommended_id ) 
SELECT activity_id, recommended_id FROM migrate.mail_activity_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_activity_rel WHERE activity_id=migrate.mail_activity_rel.activity_id AND recommended_id=migrate.mail_activity_rel.recommended_id);
ALTER TABLE mail_activity_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_activity_type_mail_template_rel DISABLE TRIGGER ALL;
INSERT INTO mail_activity_type_mail_template_rel ( mail_activity_type_id, mail_template_id ) 
SELECT mail_activity_type_id, mail_template_id FROM migrate.mail_activity_type_mail_template_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_activity_type_mail_template_rel WHERE mail_activity_type_id=migrate.mail_activity_type_mail_template_rel.mail_activity_type_id AND mail_template_id=migrate.mail_activity_type_mail_template_rel.mail_template_id);
ALTER TABLE mail_activity_type_mail_template_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_template DISABLE TRIGGER ALL;
INSERT INTO mail_template ( id, name, model_id, model, subject, email_from, use_default_to, email_to, partner_to, email_cc, reply_to, body_html, report_name, report_template, mail_server_id, scheduled_date, auto_delete, ref_ir_act_window, lang, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, model_id, model, subject, email_from, use_default_to, email_to, partner_to, email_cc, reply_to, body_html, report_name, report_template, mail_server_id, scheduled_date, auto_delete, ref_ir_act_window, lang, create_uid, create_date, write_uid, write_date FROM migrate.mail_template 
WHERE NOT EXISTS (SELECT 1 FROM mail_template WHERE id=migrate.mail_template.id);
SELECT pg_catalog.setval('mail_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_template) x;
ALTER TABLE mail_template ENABLE TRIGGER ALL;

ALTER TABLE mail_mail_res_partner_rel DISABLE TRIGGER ALL;
INSERT INTO mail_mail_res_partner_rel ( mail_mail_id, res_partner_id ) 
SELECT mail_mail_id, res_partner_id FROM migrate.mail_mail_res_partner_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_mail_res_partner_rel WHERE mail_mail_id=migrate.mail_mail_res_partner_rel.mail_mail_id AND res_partner_id=migrate.mail_mail_res_partner_rel.res_partner_id);
ALTER TABLE mail_mail_res_partner_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_blacklist DISABLE TRIGGER ALL;
INSERT INTO mail_blacklist ( id, email, active, message_main_attachment_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, email, active, message_main_attachment_id, create_uid, create_date, write_uid, write_date FROM migrate.mail_blacklist 
WHERE NOT EXISTS (SELECT 1 FROM mail_blacklist WHERE id=migrate.mail_blacklist.id);
SELECT pg_catalog.setval('mail_blacklist_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_blacklist) x;
ALTER TABLE mail_blacklist ENABLE TRIGGER ALL;

ALTER TABLE mail_channel_partner DISABLE TRIGGER ALL;
INSERT INTO mail_channel_partner ( id, partner_id, channel_id, seen_message_id, fold_state, is_minimized, is_pinned, create_uid, create_date, write_uid, write_date ) 
SELECT id, partner_id, channel_id, seen_message_id, fold_state, is_minimized, is_pinned, create_uid, create_date, write_uid, write_date FROM migrate.mail_channel_partner 
WHERE NOT EXISTS (SELECT 1 FROM mail_channel_partner WHERE id=migrate.mail_channel_partner.id);
SELECT pg_catalog.setval('mail_channel_partner_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_channel_partner) x;
ALTER TABLE mail_channel_partner ENABLE TRIGGER ALL;

ALTER TABLE mail_moderation DISABLE TRIGGER ALL;
INSERT INTO mail_moderation ( id, email, status, channel_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, email, status, channel_id, create_uid, create_date, write_uid, write_date FROM migrate.mail_moderation 
WHERE NOT EXISTS (SELECT 1 FROM mail_moderation WHERE id=migrate.mail_moderation.id);
SELECT pg_catalog.setval('mail_moderation_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_moderation) x;
ALTER TABLE mail_moderation ENABLE TRIGGER ALL;

ALTER TABLE mail_channel_res_groups_rel DISABLE TRIGGER ALL;
INSERT INTO mail_channel_res_groups_rel ( mail_channel_id, res_groups_id ) 
SELECT mail_channel_id, res_groups_id FROM migrate.mail_channel_res_groups_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_channel_res_groups_rel WHERE mail_channel_id=migrate.mail_channel_res_groups_rel.mail_channel_id AND res_groups_id=migrate.mail_channel_res_groups_rel.res_groups_id);
ALTER TABLE mail_channel_res_groups_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_channel_moderator_rel DISABLE TRIGGER ALL;
INSERT INTO mail_channel_moderator_rel ( mail_channel_id, res_users_id ) 
SELECT mail_channel_id, res_users_id FROM migrate.mail_channel_moderator_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_channel_moderator_rel WHERE mail_channel_id=migrate.mail_channel_moderator_rel.mail_channel_id AND res_users_id=migrate.mail_channel_moderator_rel.res_users_id);
ALTER TABLE mail_channel_moderator_rel ENABLE TRIGGER ALL;


ALTER TABLE email_template_attachment_rel DISABLE TRIGGER ALL;
INSERT INTO email_template_attachment_rel ( email_template_id, attachment_id ) 
SELECT email_template_id, attachment_id FROM migrate.email_template_attachment_rel 
WHERE NOT EXISTS (SELECT 1 FROM email_template_attachment_rel WHERE email_template_id=migrate.email_template_attachment_rel.email_template_id AND attachment_id=migrate.email_template_attachment_rel.attachment_id);
ALTER TABLE email_template_attachment_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_shortcode DISABLE TRIGGER ALL;
INSERT INTO mail_shortcode ( id, source, substitution, description, create_uid, create_date, write_uid, write_date ) 
SELECT id, source, substitution, description, create_uid, create_date, write_uid, write_date FROM migrate.mail_shortcode 
WHERE NOT EXISTS (SELECT 1 FROM mail_shortcode WHERE id=migrate.mail_shortcode.id);
SELECT pg_catalog.setval('mail_shortcode_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_shortcode) x;
ALTER TABLE mail_shortcode ENABLE TRIGGER ALL;

ALTER TABLE mail_mail DISABLE TRIGGER ALL;
INSERT INTO mail_mail ( id, mail_message_id, body_html, headers, notification, email_to, email_cc, state, auto_delete, failure_reason, scheduled_date, create_uid, create_date, write_uid, write_date, fetchmail_server_id ) 
SELECT id, mail_message_id, body_html, headers, notification, email_to, email_cc, state, auto_delete, failure_reason, scheduled_date, create_uid, create_date, write_uid, write_date, fetchmail_server_id FROM migrate.mail_mail 
WHERE NOT EXISTS (SELECT 1 FROM mail_mail WHERE id=migrate.mail_mail.id);
SELECT pg_catalog.setval('mail_mail_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_mail) x;
ALTER TABLE mail_mail ENABLE TRIGGER ALL;

ALTER TABLE mail_compose_message DISABLE TRIGGER ALL;
INSERT INTO mail_compose_message ( id, subject, body, parent_id, template_id, layout, add_sign, email_from, author_id, composition_mode, model, res_id, record_name, use_active_domain, active_domain, message_type, subtype_id, mail_activity_type_id, reply_to, no_auto_thread, is_log, notify, auto_delete, auto_delete_message, mail_server_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, subject, body, parent_id, template_id, layout, add_sign, email_from, author_id, composition_mode, model, res_id, record_name, use_active_domain, active_domain, message_type, subtype_id, mail_activity_type_id, reply_to, no_auto_thread, is_log, notify, auto_delete, auto_delete_message, mail_server_id, create_uid, create_date, write_uid, write_date FROM migrate.mail_compose_message 
WHERE NOT EXISTS (SELECT 1 FROM mail_compose_message WHERE id=migrate.mail_compose_message.id);
SELECT pg_catalog.setval('mail_compose_message_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_compose_message) x;
ALTER TABLE mail_compose_message ENABLE TRIGGER ALL;

ALTER TABLE mail_compose_message_ir_attachments_rel DISABLE TRIGGER ALL;
INSERT INTO mail_compose_message_ir_attachments_rel ( wizard_id, attachment_id ) 
SELECT wizard_id, attachment_id FROM migrate.mail_compose_message_ir_attachments_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_compose_message_ir_attachments_rel WHERE wizard_id=migrate.mail_compose_message_ir_attachments_rel.wizard_id AND attachment_id=migrate.mail_compose_message_ir_attachments_rel.attachment_id);
ALTER TABLE mail_compose_message_ir_attachments_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_compose_message_res_partner_rel DISABLE TRIGGER ALL;
INSERT INTO mail_compose_message_res_partner_rel ( wizard_id, partner_id ) 
SELECT wizard_id, partner_id FROM migrate.mail_compose_message_res_partner_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_compose_message_res_partner_rel WHERE wizard_id=migrate.mail_compose_message_res_partner_rel.wizard_id AND partner_id=migrate.mail_compose_message_res_partner_rel.partner_id);
ALTER TABLE mail_compose_message_res_partner_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_resend_cancel DISABLE TRIGGER ALL;
INSERT INTO mail_resend_cancel ( id, model, create_uid, create_date, write_uid, write_date ) 
SELECT id, model, create_uid, create_date, write_uid, write_date FROM migrate.mail_resend_cancel 
WHERE NOT EXISTS (SELECT 1 FROM mail_resend_cancel WHERE id=migrate.mail_resend_cancel.id);
SELECT pg_catalog.setval('mail_resend_cancel_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_resend_cancel) x;
ALTER TABLE mail_resend_cancel ENABLE TRIGGER ALL;

ALTER TABLE mail_resend_message DISABLE TRIGGER ALL;
INSERT INTO mail_resend_message ( id, mail_message_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, mail_message_id, create_uid, create_date, write_uid, write_date FROM migrate.mail_resend_message 
WHERE NOT EXISTS (SELECT 1 FROM mail_resend_message WHERE id=migrate.mail_resend_message.id);
SELECT pg_catalog.setval('mail_resend_message_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_resend_message) x;
ALTER TABLE mail_resend_message ENABLE TRIGGER ALL;

ALTER TABLE mail_message_res_partner_needaction_rel_mail_resend_message_rel DISABLE TRIGGER ALL;
INSERT INTO mail_message_res_partner_needaction_rel_mail_resend_message_rel ( mail_resend_message_id, mail_message_res_partner_needaction_rel_id ) 
SELECT mail_resend_message_id, mail_message_res_partner_needaction_rel_id FROM migrate.mail_message_res_partner_needaction_rel_mail_resend_message_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_message_res_partner_needaction_rel_mail_resend_message_rel WHERE mail_resend_message_id=migrate.mail_message_res_partner_needaction_rel_mail_resend_message_rel.mail_resend_message_id AND mail_message_res_partner_needaction_rel_id=migrate.mail_message_res_partner_needaction_rel_mail_resend_message_rel.mail_message_res_partner_needaction_rel_id);
ALTER TABLE mail_message_res_partner_needaction_rel_mail_resend_message_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_resend_partner DISABLE TRIGGER ALL;
INSERT INTO mail_resend_partner ( id, partner_id, resend, resend_wizard_id, message, create_uid, create_date, write_uid, write_date ) 
SELECT id, partner_id, resend, resend_wizard_id, message, create_uid, create_date, write_uid, write_date FROM migrate.mail_resend_partner 
WHERE NOT EXISTS (SELECT 1 FROM mail_resend_partner WHERE id=migrate.mail_resend_partner.id);
SELECT pg_catalog.setval('mail_resend_partner_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_resend_partner) x;
ALTER TABLE mail_resend_partner ENABLE TRIGGER ALL;

INSERT INTO public.res_groups_users_rel(uid, gid) 
SELECT DISTINCT pu.id, pg.id FROM public.res_groups pg 
INNER JOIN migrate.res_groups mg ON pg.name = mg.name and COALESCE(pg.comment, '') = COALESCE(mg.comment, '') 
INNER JOIN public.res_users pu ON TRUE 
INNER JOIN migrate.res_users mu ON pu.login = mu.login 
INNER JOIN migrate.res_groups_users_rel mgu ON mg.id = mgu.gid AND mu.id = mgu.uid 
WHERE NOT EXISTS (SELECT 1 FROM public.res_groups_users_rel e WHERE e.uid = pu.id AND e.gid = pg.id);

ALTER TABLE res_groups_implied_rel DISABLE TRIGGER ALL;
INSERT INTO res_groups_implied_rel ( gid, hid ) 
SELECT gid, hid FROM migrate.res_groups_implied_rel 
WHERE NOT EXISTS (SELECT 1 FROM res_groups_implied_rel WHERE gid=migrate.res_groups_implied_rel.gid AND hid=migrate.res_groups_implied_rel.hid);
ALTER TABLE res_groups_implied_rel ENABLE TRIGGER ALL;




