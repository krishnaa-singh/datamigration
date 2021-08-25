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

-- krishna

ALTER TABLE res_lang DISABLE TRIGGER ALL;
INSERT INTO res_lang ( id,name,code,iso_code,active,direction,date_format,time_format,week_start,grouping,decimal_point,thousands_sep,create_uid,create_date,write_uid,write_date) 
SELECT id,name,code,iso_code,active,direction,date_format,time_format,week_start,grouping,decimal_point,thousands_sep,create_uid,create_date,write_uid,write_date FROM migrate.res_lang 
WHERE NOT EXISTS (SELECT 1 FROM res_lang WHERE id=migrate.res_lang.id);
SELECT pg_catalog.setval('res_lang_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_lang) x;
ALTER TABLE res_lang ENABLE TRIGGER ALL;

ALTER TABLE ir_logging DISABLE TRIGGER ALL;
INSERT INTO ir_logging ( id, create_uid, create_date, write_uid, write_date, name, type, dbname, level, message, path, func, line ) 
SELECT id, create_uid, create_date, write_uid, write_date, name, type, dbname, level, message, path, func, line FROM migrate.ir_logging 
WHERE NOT EXISTS (SELECT 1 FROM ir_logging WHERE id=migrate.ir_logging.id);
SELECT pg_catalog.setval('ir_logging_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_logging) x;
ALTER TABLE ir_logging ENABLE TRIGGER ALL;

-- 


ALTER TABLE report_paperformat DISABLE TRIGGER ALL;
DELETE FROM report_paperformat;
INSERT INTO report_paperformat ( id, name, format, margin_top, margin_bottom, margin_left, margin_right, page_height, page_width, orientation, header_line, header_spacing, dpi, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, format, margin_top, margin_bottom, margin_left, margin_right, page_height, page_width, orientation, header_line, header_spacing, dpi, create_uid, create_date, write_uid, write_date FROM migrate.report_paperformat 
WHERE NOT EXISTS (SELECT 1 FROM report_paperformat WHERE id=migrate.report_paperformat.id);
SELECT pg_catalog.setval('report_paperformat_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM report_paperformat) x;
ALTER TABLE report_paperformat ENABLE TRIGGER ALL;

ALTER TABLE ir_cron DISABLE TRIGGER ALL;
INSERT INTO ir_cron ( id, ir_actions_server_id, cron_name, user_id, active, interval_number, interval_type, numbercall, doall, nextcall, priority, create_uid, create_date, write_uid, write_date ) 
SELECT id, ir_actions_server_id, cron_name, user_id, active, interval_number, interval_type, numbercall, doall, nextcall, priority, create_uid, create_date, write_uid, write_date FROM migrate.ir_cron 
WHERE NOT EXISTS (SELECT 1 FROM ir_cron WHERE id=migrate.ir_cron.id);
SELECT pg_catalog.setval('ir_cron_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_cron) x;
ALTER TABLE ir_cron ENABLE TRIGGER ALL;

ALTER TABLE rule_group_rel DISABLE TRIGGER ALL;
INSERT INTO rule_group_rel ( rule_group_id, group_id ) 
SELECT rule_group_id, group_id FROM migrate.rule_group_rel 
WHERE NOT EXISTS (SELECT 1 FROM rule_group_rel WHERE rule_group_id=migrate.rule_group_rel.rule_group_id AND group_id=migrate.rule_group_rel.group_id);
ALTER TABLE rule_group_rel ENABLE TRIGGER ALL;

ALTER TABLE report_layout DISABLE TRIGGER ALL;
INSERT INTO report_layout ( id, view_id, image, pdf,create_uid, create_date, write_uid, write_date ) 
SELECT id, view_id, image, pdf,create_uid, create_date, write_uid, write_date FROM migrate.report_layout 
WHERE NOT EXISTS (SELECT 1 FROM report_layout WHERE id=migrate.report_layout.id);
SELECT pg_catalog.setval('report_layout_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM report_layout) x;
ALTER TABLE report_layout ENABLE TRIGGER ALL;

ALTER TABLE res_country DISABLE TRIGGER ALL;
DELETE FROM res_country;
INSERT INTO res_country ( id, name, code, address_format, address_view_id, currency_id, phone_code, name_position, vat_label,create_uid, create_date, write_uid, write_date ) 
SELECT id, name, code, address_format, address_view_id, currency_id, phone_code, name_position, vat_label,create_uid, create_date, write_uid, write_date FROM migrate.res_country 
WHERE NOT EXISTS (SELECT 1 FROM res_country WHERE code=migrate.res_country.code);
SELECT pg_catalog.setval('res_country_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_country) x;
ALTER TABLE res_country ENABLE TRIGGER ALL;

ALTER TABLE res_currency DISABLE TRIGGER ALL;
INSERT INTO res_currency ( id, name, symbol, rounding, decimal_places, active, position, currency_unit_label, currency_subunit_label, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, symbol, rounding, decimal_places, active, position, currency_unit_label, currency_subunit_label, create_uid, create_date, write_uid, write_date FROM migrate.res_currency 
WHERE NOT EXISTS (SELECT 1 FROM res_currency WHERE id=migrate.res_currency.id);
SELECT pg_catalog.setval('res_currency_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_currency) x;
ALTER TABLE res_currency ENABLE TRIGGER ALL;

ALTER TABLE res_country_res_country_group_rel DISABLE TRIGGER ALL;
INSERT INTO res_country_res_country_group_rel ( res_country_id, res_country_group_id ) 
SELECT res_country_id, res_country_group_id FROM migrate.res_country_res_country_group_rel 
WHERE NOT EXISTS (SELECT 1 FROM res_country_res_country_group_rel WHERE res_country_id=migrate.res_country_res_country_group_rel.res_country_id AND res_country_group_id=migrate.res_country_res_country_group_rel.res_country_group_id);
ALTER TABLE res_country_res_country_group_rel ENABLE TRIGGER ALL;

ALTER TABLE res_country_group DISABLE TRIGGER ALL;
INSERT INTO res_country_group ( id, name, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, create_uid, create_date, write_uid, write_date FROM migrate.res_country_group 
WHERE NOT EXISTS (SELECT 1 FROM res_country_group WHERE id=migrate.res_country_group.id);
SELECT pg_catalog.setval('res_country_group_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_country_group) x;
ALTER TABLE res_country_group ENABLE TRIGGER ALL;

ALTER TABLE res_country_state DISABLE TRIGGER ALL;
DELETE FROM res_country_state;
INSERT INTO res_country_state ( id, country_id, name, code, create_uid, create_date, write_uid, write_date ) 
SELECT id, country_id, name, code, create_uid, create_date, write_uid, write_date FROM migrate.res_country_state 
WHERE NOT EXISTS (SELECT 1 FROM res_country_state WHERE code=migrate.res_country_state.code);
SELECT pg_catalog.setval('res_country_state_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_country_state) x;
ALTER TABLE res_country_state ENABLE TRIGGER ALL;

ALTER TABLE res_partner_category DISABLE TRIGGER ALL;
INSERT INTO res_partner_category ( id, name, color, parent_id, active, parent_path, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, color, parent_id, active, parent_path, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_category 
WHERE NOT EXISTS (SELECT 1 FROM res_partner_category WHERE id=migrate.res_partner_category.id);
SELECT pg_catalog.setval('res_partner_category_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_category) x;
ALTER TABLE res_partner_category ENABLE TRIGGER ALL;

ALTER TABLE res_partner_res_partner_category_rel DISABLE TRIGGER ALL;
INSERT INTO res_partner_res_partner_category_rel ( category_id, partner_id ) 
SELECT category_id, partner_id FROM migrate.res_partner_res_partner_category_rel 
WHERE NOT EXISTS (SELECT 1 FROM res_partner_res_partner_category_rel WHERE category_id=migrate.res_partner_res_partner_category_rel.category_id AND partner_id=migrate.res_partner_res_partner_category_rel.partner_id);
ALTER TABLE res_partner_res_partner_category_rel ENABLE TRIGGER ALL;


ALTER TABLE res_partner_title DISABLE TRIGGER ALL;
INSERT INTO res_partner_title ( id, name, shortcut, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, shortcut, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_title 
WHERE NOT EXISTS (SELECT 1 FROM res_partner_title WHERE id=migrate.res_partner_title.id);
SELECT pg_catalog.setval('res_partner_title_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_title) x;
ALTER TABLE res_partner_title ENABLE TRIGGER ALL;

ALTER TABLE res_partner_industry DISABLE TRIGGER ALL;
INSERT INTO res_partner_industry ( id, name, full_name, active, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, full_name, active, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_industry 
WHERE NOT EXISTS (SELECT 1 FROM res_partner_industry WHERE id=migrate.res_partner_industry.id);
SELECT pg_catalog.setval('res_partner_industry_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_industry) x;
ALTER TABLE res_partner_industry ENABLE TRIGGER ALL;

ALTER TABLE res_bank DISABLE TRIGGER ALL;
INSERT INTO res_bank ( id, name, street, street2, zip, city, state, country, email, phone, active, bic, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, street, street2, zip, city, state, country, email, phone, active, bic, create_uid, create_date, write_uid, write_date FROM migrate.res_bank 
WHERE NOT EXISTS (SELECT 1 FROM res_bank WHERE id=migrate.res_bank.id);
SELECT pg_catalog.setval('res_bank_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_bank) x;
ALTER TABLE res_bank ENABLE TRIGGER ALL;

ALTER TABLE res_partner_bank DISABLE TRIGGER ALL;
INSERT INTO res_partner_bank ( id, active, acc_number, sanitized_acc_number, acc_holder_name, partner_id, bank_id, sequence, currency_id, company_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, True, acc_number, sanitized_acc_number, acc_holder_name, partner_id, bank_id, sequence, currency_id, company_id, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_bank 
WHERE NOT EXISTS (SELECT 1 FROM res_partner_bank WHERE id=migrate.res_partner_bank.id);
SELECT pg_catalog.setval('res_partner_bank_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_bank) x;
ALTER TABLE res_partner_bank ENABLE TRIGGER ALL;

ALTER TABLE res_company_users_rel DISABLE TRIGGER ALL;
INSERT INTO res_company_users_rel ( cid, user_id ) 
SELECT cid, user_id FROM migrate.res_company_users_rel 
WHERE NOT EXISTS (SELECT 1 FROM res_company_users_rel WHERE cid=migrate.res_company_users_rel.cid AND user_id=migrate.res_company_users_rel.user_id);
ALTER TABLE res_company_users_rel ENABLE TRIGGER ALL;

INSERT INTO public.res_groups_users_rel(uid, gid) 
SELECT DISTINCT pu.id, pg.id FROM public.res_groups pg 
INNER JOIN migrate.res_groups mg ON pg.name = mg.name and COALESCE(pg.comment, '') = COALESCE(mg.comment, '') 
INNER JOIN public.res_users pu ON TRUE 
INNER JOIN migrate.res_users mu ON pu.login = mu.login 
INNER JOIN migrate.res_groups_users_rel mgu ON mg.id = mgu.gid AND mu.id = mgu.uid 
WHERE NOT EXISTS (SELECT 1 FROM public.res_groups_users_rel e WHERE e.uid = pu.id AND e.gid = pg.id);

-- ALTER TABLE res_groups_implied_rel DISABLE TRIGGER ALL;
-- INSERT INTO res_groups_implied_rel ( gid, hid ) 
-- SELECT gid, hid FROM migrate.res_groups_implied_rel 
-- WHERE NOT EXISTS (SELECT 1 FROM res_groups_implied_rel WHERE gid=migrate.res_groups_implied_rel.gid AND hid=migrate.res_groups_implied_rel.hid);
-- ALTER TABLE res_groups_implied_rel ENABLE TRIGGER ALL;

ALTER TABLE res_users_log DISABLE TRIGGER ALL;
INSERT INTO res_users_log ( id, create_uid, create_date, write_uid, write_date ) 
SELECT id, create_uid, create_date, write_uid, write_date FROM migrate.res_users_log 
WHERE NOT EXISTS (SELECT 1 FROM res_users_log WHERE id=migrate.res_users_log.id);
SELECT pg_catalog.setval('res_users_log_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_users_log) x;
ALTER TABLE res_users_log ENABLE TRIGGER ALL;


ALTER TABLE decimal_precision DISABLE TRIGGER ALL;
INSERT INTO decimal_precision ( id, name, digits, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, digits, create_uid, create_date, write_uid, write_date FROM migrate.decimal_precision 
WHERE NOT EXISTS (SELECT 1 FROM decimal_precision WHERE id=migrate.decimal_precision.id);
SELECT pg_catalog.setval('decimal_precision_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM decimal_precision) x;
ALTER TABLE decimal_precision ENABLE TRIGGER ALL;

ALTER TABLE bus_presence DISABLE TRIGGER ALL;
INSERT INTO bus_presence ( id, user_id, last_poll, last_presence, status ) 
SELECT id, user_id, last_poll, last_presence, status FROM migrate.bus_presence 
WHERE NOT EXISTS (SELECT 1 FROM bus_presence WHERE id=migrate.bus_presence.id);
SELECT pg_catalog.setval('bus_presence_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM bus_presence) x;
ALTER TABLE bus_presence ENABLE TRIGGER ALL;

ALTER TABLE resource_calendar DISABLE TRIGGER ALL;
INSERT INTO resource_calendar ( id, name, company_id, hours_per_day, tz, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, company_id, hours_per_day, tz, create_uid, create_date, write_uid, write_date FROM migrate.resource_calendar 
WHERE NOT EXISTS (SELECT 1 FROM resource_calendar WHERE id=migrate.resource_calendar.id);
SELECT pg_catalog.setval('resource_calendar_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM resource_calendar) x;
ALTER TABLE resource_calendar ENABLE TRIGGER ALL;

ALTER TABLE resource_calendar_attendance DISABLE TRIGGER ALL;
INSERT INTO resource_calendar_attendance ( id, name, dayofweek, date_from, date_to, hour_from, hour_to, calendar_id,create_uid, create_date, write_uid, write_date ) 
SELECT id, name, dayofweek, date_from, date_to, hour_from, hour_to, calendar_id, create_uid, create_date, write_uid, write_date FROM migrate.resource_calendar_attendance 
WHERE NOT EXISTS (SELECT 1 FROM resource_calendar_attendance WHERE id=migrate.resource_calendar_attendance.id);
SELECT pg_catalog.setval('resource_calendar_attendance_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM resource_calendar_attendance) x;
ALTER TABLE resource_calendar_attendance ENABLE TRIGGER ALL;

ALTER TABLE utm_medium DISABLE TRIGGER ALL;
INSERT INTO utm_medium ( id, name, active, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, active, create_uid, create_date, write_uid, write_date FROM migrate.utm_medium 
WHERE NOT EXISTS (SELECT 1 FROM utm_medium WHERE id=migrate.utm_medium.id);
SELECT pg_catalog.setval('utm_medium_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM utm_medium) x;
ALTER TABLE utm_medium ENABLE TRIGGER ALL;

ALTER TABLE utm_source DISABLE TRIGGER ALL;
INSERT INTO utm_source ( id, name, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, create_uid, create_date, write_uid, write_date FROM migrate.utm_source 
WHERE NOT EXISTS (SELECT 1 FROM utm_source WHERE id=migrate.utm_source.id);
SELECT pg_catalog.setval('utm_source_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM utm_source) x;
ALTER TABLE utm_source ENABLE TRIGGER ALL;

ALTER TABLE web_tour_tour DISABLE TRIGGER ALL;
INSERT INTO web_tour_tour ( id, name, user_id ) 
SELECT id, name, user_id FROM migrate.web_tour_tour 
WHERE NOT EXISTS (SELECT 1 FROM web_tour_tour WHERE id=migrate.web_tour_tour.id);
SELECT pg_catalog.setval('web_tour_tour_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM web_tour_tour) x;
ALTER TABLE web_tour_tour ENABLE TRIGGER ALL;

ALTER TABLE utm_campaign DISABLE TRIGGER ALL;
INSERT INTO utm_campaign ( id, name, user_id,stage_id,create_uid, create_date, write_uid, write_date ) 
SELECT id, name, 2,1, create_uid, create_date, write_uid, write_date FROM migrate.utm_campaign 
WHERE NOT EXISTS (SELECT 1 FROM utm_campaign WHERE id=migrate.utm_campaign.id);
SELECT pg_catalog.setval('utm_campaign_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM utm_campaign) x;
ALTER TABLE utm_campaign ENABLE TRIGGER ALL;

ALTER TABLE mail_message_subtype DISABLE TRIGGER ALL;
INSERT INTO mail_message_subtype ( id, name, description, internal, parent_id, relation_field, res_model, sequence, hidden, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, description, internal, parent_id, relation_field, res_model, sequence, hidden, create_uid, create_date, write_uid, write_date FROM migrate.mail_message_subtype 
WHERE NOT EXISTS (SELECT 1 FROM mail_message_subtype WHERE id=migrate.mail_message_subtype.id);
SELECT pg_catalog.setval('mail_message_subtype_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_message_subtype) x;
ALTER TABLE mail_message_subtype ENABLE TRIGGER ALL;

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

ALTER TABLE mail_channel_partner DISABLE TRIGGER ALL;
INSERT INTO mail_channel_partner ( id, partner_id, channel_id, seen_message_id, fold_state, is_minimized, is_pinned, create_uid, create_date, write_uid, write_date ) 
SELECT id, partner_id, channel_id, seen_message_id, fold_state, is_minimized, is_pinned, create_uid, create_date, write_uid, write_date FROM migrate.mail_channel_partner 
WHERE NOT EXISTS (SELECT 1 FROM mail_channel_partner WHERE id=migrate.mail_channel_partner.id);
SELECT pg_catalog.setval('mail_channel_partner_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_channel_partner) x;
ALTER TABLE mail_channel_partner ENABLE TRIGGER ALL;

ALTER TABLE mail_channel_res_groups_rel DISABLE TRIGGER ALL;
INSERT INTO mail_channel_res_groups_rel ( mail_channel_id, res_groups_id ) 
SELECT mail_channel_id, res_groups_id FROM migrate.mail_channel_res_groups_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_channel_res_groups_rel WHERE mail_channel_id=migrate.mail_channel_res_groups_rel.mail_channel_id AND res_groups_id=migrate.mail_channel_res_groups_rel.res_groups_id);
ALTER TABLE mail_channel_res_groups_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_mail DISABLE TRIGGER ALL;
INSERT INTO mail_mail ( id, mail_message_id, body_html, headers, notification, email_to, email_cc, state, auto_delete, failure_reason, scheduled_date, create_uid, create_date, write_uid, write_date, fetchmail_server_id ) 
SELECT id, mail_message_id, body_html, headers, notification, email_to, email_cc, state, auto_delete, failure_reason, scheduled_date, create_uid, create_date, write_uid, write_date, fetchmail_server_id FROM migrate.mail_mail 
WHERE NOT EXISTS (SELECT 1 FROM mail_mail WHERE id=migrate.mail_mail.id);
SELECT pg_catalog.setval('mail_mail_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_mail) x;
ALTER TABLE mail_mail ENABLE TRIGGER ALL;

ALTER TABLE calendar_attendee DISABLE TRIGGER ALL;
INSERT INTO calendar_attendee ( id, event_id, partner_id, state, common_name, availability, access_token, create_uid, create_date, write_uid, write_date ) 
SELECT id, event_id, partner_id, state, common_name, availability, access_token, create_uid, create_date, write_uid, write_date FROM migrate.calendar_attendee 
WHERE NOT EXISTS (SELECT 1 FROM calendar_attendee WHERE id=migrate.calendar_attendee.id);
SELECT pg_catalog.setval('calendar_attendee_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM calendar_attendee) x;
ALTER TABLE calendar_attendee ENABLE TRIGGER ALL;

ALTER TABLE calendar_event_res_partner_rel DISABLE TRIGGER ALL;
INSERT INTO calendar_event_res_partner_rel ( calendar_event_id, res_partner_id ) 
SELECT calendar_event_id, res_partner_id FROM migrate.calendar_event_res_partner_rel 
WHERE NOT EXISTS (SELECT 1 FROM calendar_event_res_partner_rel WHERE calendar_event_id=migrate.calendar_event_res_partner_rel.calendar_event_id AND res_partner_id=migrate.calendar_event_res_partner_rel.res_partner_id);
ALTER TABLE calendar_event_res_partner_rel ENABLE TRIGGER ALL;

ALTER TABLE calendar_alarm DISABLE TRIGGER ALL;
INSERT INTO calendar_alarm ( id, name, alarm_type, duration, interval, duration_minutes, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, type, duration, interval, duration_minutes, create_uid, create_date, write_uid, write_date FROM migrate.calendar_alarm 
WHERE NOT EXISTS (SELECT 1 FROM calendar_alarm WHERE id=migrate.calendar_alarm.id);
SELECT pg_catalog.setval('calendar_alarm_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM calendar_alarm) x;
ALTER TABLE calendar_alarm ENABLE TRIGGER ALL;


ALTER TABLE calendar_event DISABLE TRIGGER ALL;
INSERT INTO calendar_event ( id, message_main_attachment_id, name, start, stop, allday, start_date, stop_date, duration, description, privacy, location, show_as, res_id, res_model_id, res_model, user_id, active, recurrency, recurrence_id, create_uid, create_date, write_uid, write_date, opportunity_id ) 
SELECT id, message_main_attachment_id, name, start, stop, allday, start_date, stop_date, duration, description, privacy, location, show_as, res_id, res_model_id, res_model, user_id, active, recurrency, recurrent_id, create_uid, create_date, write_uid, write_date, opportunity_id FROM migrate.calendar_event 
WHERE NOT EXISTS (SELECT 1 FROM calendar_event WHERE id=migrate.calendar_event.id);
SELECT pg_catalog.setval('calendar_event_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM calendar_event) x;
ALTER TABLE calendar_event ENABLE TRIGGER ALL;

ALTER TABLE product_packaging DISABLE TRIGGER ALL;
INSERT INTO product_packaging ( id, name, sequence, product_id, qty, barcode, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, sequence, product_id, qty, barcode, create_uid, create_date, write_uid, write_date FROM migrate.product_packaging 
WHERE NOT EXISTS (SELECT 1 FROM product_packaging WHERE id=migrate.product_packaging.id);
SELECT pg_catalog.setval('product_packaging_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_packaging) x;
ALTER TABLE product_packaging ENABLE TRIGGER ALL;

ALTER TABLE team_favorite_user_rel DISABLE TRIGGER ALL;
INSERT INTO team_favorite_user_rel ( team_id, user_id ) 
SELECT team_id, user_id FROM migrate.team_favorite_user_rel 
WHERE NOT EXISTS (SELECT 1 FROM team_favorite_user_rel WHERE team_id=migrate.team_favorite_user_rel.team_id AND user_id=migrate.team_favorite_user_rel.user_id);
ALTER TABLE team_favorite_user_rel ENABLE TRIGGER ALL;

ALTER TABLE team_favorite_user_rel DISABLE TRIGGER ALL;
INSERT INTO team_favorite_user_rel ( team_id, user_id ) 
SELECT team_id, user_id FROM migrate.team_favorite_user_rel 
WHERE NOT EXISTS (SELECT 1 FROM team_favorite_user_rel WHERE team_id=migrate.team_favorite_user_rel.team_id AND user_id=migrate.team_favorite_user_rel.user_id);
ALTER TABLE team_favorite_user_rel ENABLE TRIGGER ALL;

