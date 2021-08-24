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

--ALTER TABLE product_attribute_category DISABLE TRIGGER ALL;
--INSERT INTO product_attribute_category ( id, name, sequence, create_uid, create_date, write_uid, write_date )
--SELECT id, name, sequence, create_uid, create_date, write_uid, write_date FROM migrate.product_attribute_category
--WHERE NOT EXISTS (SELECT 1 FROM product_attribute_category WHERE id=migrate.product_attribute_category.id);
--SELECT pg_catalog.setval('product_attribute_category_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_attribute_category) x;
--ALTER TABLE product_attribute_category ENABLE TRIGGER ALL;

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
INSERT INTO product_template ( uom_id, uom_po_id, company_id, active, color, create_uid, create_date, write_uid, write_date, id, sequence, categ_id, list_price, volume, weight, sale_ok, purchase_ok, name, sale_line_warn, description, description_purchase, description_sale, type, sale_line_warn_msg, expense_policy, invoice_policy, default_code,  service_type, tracking, purchase_line_warn)
SELECT uom_id, uom_po_id, company_id, active, color, create_uid, create_date, write_uid, write_date, id, sequence, categ_id, list_price, volume, weight, sale_ok, purchase_ok, name, sale_line_warn, description, description_purchase, description_sale, type, sale_line_warn_msg, expense_policy, invoice_policy, default_code,  service_type, tracking, 'no-message' FROM migrate.product_template
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

ALTER TABLE base_import_mapping DISABLE TRIGGER ALL;
INSERT INTO base_import_mapping ( id, res_model, column_name, field_name, create_uid, create_date, write_uid, write_date ) 
SELECT id, res_model, column_name, field_name, create_uid, create_date, write_uid, write_date FROM migrate.base_import_mapping 
WHERE NOT EXISTS (SELECT 1 FROM base_import_mapping WHERE id=migrate.base_import_mapping.id);
SELECT pg_catalog.setval('base_import_mapping_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM base_import_mapping) x;
ALTER TABLE base_import_mapping ENABLE TRIGGER ALL;