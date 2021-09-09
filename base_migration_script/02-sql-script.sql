ALTER TABLE product_product DISABLE TRIGGER ALL;
INSERT INTO product_product ( id,  default_code, active, product_tmpl_id, barcode, volume, weight, create_uid, create_date, write_uid, write_date )
SELECT id,  default_code, active, product_tmpl_id, barcode, volume, weight, create_uid, create_date, write_uid, write_date FROM migrate.product_product
WHERE NOT EXISTS (SELECT 1 FROM product_product WHERE id=migrate.product_product.id);
SELECT pg_catalog.setval('product_product_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_product) x;
ALTER TABLE product_product ENABLE TRIGGER ALL;

ALTER TABLE product_taxes_rel DISABLE TRIGGER ALL;
INSERT INTO product_taxes_rel ( prod_id, tax_id ) 
SELECT prod_id, tax_id FROM migrate.product_taxes_rel 
WHERE NOT EXISTS (SELECT 1 FROM product_taxes_rel WHERE prod_id=migrate.product_taxes_rel.prod_id AND tax_id=migrate.product_taxes_rel.tax_id);
ALTER TABLE product_taxes_rel ENABLE TRIGGER ALL;

ALTER TABLE product_supplier_taxes_rel DISABLE TRIGGER ALL;
INSERT INTO product_supplier_taxes_rel ( prod_id, tax_id ) 
SELECT prod_id, tax_id FROM migrate.product_supplier_taxes_rel 
WHERE NOT EXISTS (SELECT 1 FROM product_supplier_taxes_rel WHERE prod_id=migrate.product_supplier_taxes_rel.prod_id AND tax_id=migrate.product_supplier_taxes_rel.tax_id);
ALTER TABLE product_supplier_taxes_rel ENABLE TRIGGER ALL;

ALTER TABLE product_public_category_product_template_rel DISABLE TRIGGER ALL;
INSERT INTO product_public_category_product_template_rel ( product_template_id, product_public_category_id ) 
SELECT product_template_id, product_public_category_id FROM migrate.product_public_category_product_template_rel 
WHERE NOT EXISTS (SELECT 1 FROM product_public_category_product_template_rel WHERE product_template_id=migrate.product_public_category_product_template_rel.product_template_id AND product_public_category_id=migrate.product_public_category_product_template_rel.product_public_category_id);
ALTER TABLE product_public_category_product_template_rel ENABLE TRIGGER ALL;

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

ALTER TABLE product_alternative_rel DISABLE TRIGGER ALL;
INSERT INTO product_alternative_rel ( src_id, dest_id ) 
SELECT src_id, dest_id FROM migrate.product_alternative_rel 
WHERE NOT EXISTS (SELECT 1 FROM product_alternative_rel WHERE src_id=migrate.product_alternative_rel.src_id AND dest_id=migrate.product_alternative_rel.dest_id);
ALTER TABLE product_alternative_rel ENABLE TRIGGER ALL;


ALTER TABLE product_accessory_rel DISABLE TRIGGER ALL;
INSERT INTO product_accessory_rel ( src_id, dest_id ) 
SELECT src_id, dest_id FROM migrate.product_accessory_rel 
WHERE NOT EXISTS (SELECT 1 FROM product_accessory_rel WHERE src_id=migrate.product_accessory_rel.src_id AND dest_id=migrate.product_accessory_rel.dest_id);
ALTER TABLE product_accessory_rel ENABLE TRIGGER ALL;


ALTER TABLE res_partner DISABLE TRIGGER ALL;
INSERT INTO res_partner ( id, name, company_id, create_date, display_name, date, title, parent_id, ref, lang, tz, user_id, vat, website, comment, credit_limit, active, employee, function, type, street, street2, zip, city, state_id, country_id, email, phone, mobile, is_company, industry_id, color, partner_share, commercial_partner_id, commercial_company_name, company_name, create_uid, write_uid, write_date, message_main_attachment_id, message_bounce, signup_token, signup_type, signup_expiration, calendar_last_notif_ack, team_id, ocn_token, debit_limit, last_time_entries_checked, invoice_warn, invoice_warn_msg, website_id, is_published, online_partner_vendor_name, online_partner_bank_account, purchase_warn, purchase_warn_msg, sale_warn, sale_warn_msg ) 
SELECT id, name, company_id, create_date, display_name, date, title, parent_id, ref, lang, tz, user_id, vat, website, comment, credit_limit, active, employee, function, type, street, street2, zip, city, state_id, country_id, email, phone, mobile, is_company, industry_id, color, partner_share, commercial_partner_id, commercial_company_name, company_name, create_uid, write_uid, write_date, message_main_attachment_id, message_bounce, signup_token, signup_type, signup_expiration, calendar_last_notif_ack, team_id, ocn_token,debit_limit, last_time_entries_checked, invoice_warn, invoice_warn_msg, website_id, is_published, online_partner_vendor_name, online_partner_bank_account, purchase_warn, purchase_warn_msg, sale_warn, sale_warn_msg FROM migrate.res_partner 
WHERE NOT EXISTS (SELECT 1 FROM res_partner WHERE id=migrate.res_partner.id);
SELECT pg_catalog.setval('res_partner_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner) x;
ALTER TABLE res_partner ENABLE TRIGGER ALL;

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
DELETE FROM stock_picking_type;
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

ALTER TABLE stock_inventory DISABLE TRIGGER ALL;
INSERT INTO stock_inventory ( id, name, date, state, company_id, exhausted, create_uid, create_date, write_uid, write_date, accounting_date ) 
SELECT id, name, date, state, company_id, exhausted, create_uid, create_date, write_uid, write_date, accounting_date FROM migrate.stock_inventory 
WHERE NOT EXISTS (SELECT 1 FROM stock_inventory WHERE id=migrate.stock_inventory.id);
SELECT pg_catalog.setval('stock_inventory_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_inventory) x;
ALTER TABLE stock_inventory ENABLE TRIGGER ALL;

ALTER TABLE stock_inventory_line DISABLE TRIGGER ALL;
INSERT INTO stock_inventory_line ( id, inventory_id, partner_id, product_id, product_uom_id, product_qty, location_id, package_id, prod_lot_id, company_id, theoretical_qty, create_uid, create_date, write_uid, write_date ) 
SELECT id, inventory_id, partner_id, product_id, product_uom_id, product_qty, location_id, package_id, prod_lot_id, company_id, theoretical_qty, create_uid, create_date, write_uid, write_date FROM migrate.stock_inventory_line 
WHERE NOT EXISTS (SELECT 1 FROM stock_inventory_line WHERE id=migrate.stock_inventory_line.id);
SELECT pg_catalog.setval('stock_inventory_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_inventory_line) x;
ALTER TABLE stock_inventory_line ENABLE TRIGGER ALL;

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
DELETE FROM stock_location;
INSERT INTO stock_location ( id,name,complete_name,active,usage,location_id,comment,posx,posy,posz,parent_path,company_id,scrap_location,return_location,removal_strategy_id,barcode,create_uid,create_date,write_uid,write_date,valuation_in_account_id
,valuation_out_account_id ) 
SELECT id,name,complete_name,active,usage,location_id,comment,posx,posy,posz,parent_path,company_id,scrap_location,return_location,removal_strategy_id,barcode,create_uid,create_date,write_uid,write_date,valuation_in_account_id
,valuation_out_account_id FROM migrate.stock_location 
WHERE NOT EXISTS (SELECT 1 FROM stock_location WHERE id=migrate.stock_location.id);
SELECT pg_catalog.setval('stock_location_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_location) x;
ALTER TABLE stock_location ENABLE TRIGGER ALL;

ALTER TABLE stock_warehouse DISABLE TRIGGER ALL;
DELETE FROM stock_warehouse;
INSERT INTO stock_warehouse ( id, name, active, company_id, partner_id, view_location_id, lot_stock_id, code, reception_steps, delivery_steps, wh_input_stock_loc_id, wh_qc_stock_loc_id, wh_output_stock_loc_id, wh_pack_stock_loc_id, mto_pull_id, pick_type_id, pack_type_id, out_type_id, in_type_id, int_type_id, crossdock_route_id, reception_route_id, delivery_route_id, create_uid, create_date, write_uid, write_date, buy_to_resupply, buy_pull_id ) 
SELECT id, name, active, company_id, partner_id, view_location_id, lot_stock_id, code, reception_steps, delivery_steps, wh_input_stock_loc_id, wh_qc_stock_loc_id, wh_output_stock_loc_id, wh_pack_stock_loc_id, mto_pull_id, pick_type_id, pack_type_id, out_type_id, in_type_id, int_type_id, crossdock_route_id, reception_route_id, delivery_route_id, create_uid, create_date, write_uid, write_date, buy_to_resupply, buy_pull_id FROM migrate.stock_warehouse 
WHERE NOT EXISTS (SELECT 1 FROM stock_warehouse WHERE id=migrate.stock_warehouse.id);
SELECT pg_catalog.setval('stock_warehouse_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_warehouse) x;
ALTER TABLE stock_warehouse ENABLE TRIGGER ALL;

ALTER TABLE stock_rule DISABLE TRIGGER ALL;
DELETE FROM stock_rule;
INSERT INTO stock_rule ( id, name, active, group_propagation_option, group_id, action, sequence, company_id, location_id, location_src_id, route_id, procure_method, route_sequence, picking_type_id, delay, partner_address_id, warehouse_id, propagate_warehouse_id, auto, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, active, group_propagation_option, group_id, action, sequence, company_id, location_id, location_src_id, route_id, procure_method, route_sequence, picking_type_id, delay, partner_address_id, warehouse_id, propagate_warehouse_id, auto, create_uid, create_date, write_uid, write_date FROM migrate.stock_rule 
WHERE NOT EXISTS (SELECT 1 FROM stock_rule WHERE id=migrate.stock_rule.id);
SELECT pg_catalog.setval('stock_rule_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_rule) x;
ALTER TABLE stock_rule ENABLE TRIGGER ALL;

ALTER TABLE stock_location_route DISABLE TRIGGER ALL;
DELETE FROM stock_location_route;
INSERT INTO stock_location_route ( id, name, active, sequence, product_selectable, product_categ_selectable, warehouse_selectable, supplied_wh_id, supplier_wh_id, company_id, create_uid, create_date, write_uid, write_date, sale_selectable ) 
SELECT id, name, active, sequence, product_selectable, product_categ_selectable, warehouse_selectable, supplied_wh_id, supplier_wh_id, company_id, create_uid, create_date, write_uid, write_date, sale_selectable FROM migrate.stock_location_route 
WHERE NOT EXISTS (SELECT 1 FROM stock_location_route WHERE id=migrate.stock_location_route.id);
SELECT pg_catalog.setval('stock_location_route_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_location_route) x;
ALTER TABLE stock_location_route ENABLE TRIGGER ALL;

ALTER TABLE stock_route_product DISABLE TRIGGER ALL;
INSERT INTO stock_route_product ( route_id, product_id ) 
SELECT route_id, product_id FROM migrate.stock_route_product 
WHERE NOT EXISTS (SELECT 1 FROM stock_route_product WHERE route_id=migrate.stock_route_product.route_id AND product_id=migrate.stock_route_product.product_id);
ALTER TABLE stock_route_product ENABLE TRIGGER ALL;

ALTER TABLE stock_route_warehouse DISABLE TRIGGER ALL;
DELETE FROM stock_route_warehouse;
INSERT INTO stock_route_warehouse ( route_id, warehouse_id ) 
SELECT route_id, warehouse_id FROM migrate.stock_route_warehouse 
WHERE NOT EXISTS (SELECT 1 FROM stock_route_warehouse WHERE route_id=migrate.stock_route_warehouse.route_id AND warehouse_id=migrate.stock_route_warehouse.warehouse_id);
ALTER TABLE stock_route_warehouse ENABLE TRIGGER ALL;

ALTER TABLE stock_location_route_move DISABLE TRIGGER ALL;
DELETE FROM stock_location_route_move;
INSERT INTO stock_location_route_move ( move_id, route_id ) 
SELECT move_id, route_id FROM migrate.stock_location_route_move 
WHERE NOT EXISTS (SELECT 1 FROM stock_location_route_move WHERE move_id=migrate.stock_location_route_move.move_id AND route_id=migrate.stock_location_route_move.route_id);
ALTER TABLE stock_location_route_move ENABLE TRIGGER ALL;

ALTER TABLE stock_picking DISABLE TRIGGER ALL;
DELETE FROM stock_picking;
INSERT INTO stock_picking ( id, message_main_attachment_id, name, origin, note, backorder_id, move_type, state, group_id, priority, scheduled_date, date, date_done, location_id, location_dest_id, picking_type_id, partner_id, company_id, owner_id, printed, is_locked, immediate_transfer, create_uid, create_date, write_uid, write_date, sale_id ) 
SELECT id, message_main_attachment_id, name, origin, note, backorder_id, move_type, state, group_id, priority, scheduled_date, date, date_done, location_id, location_dest_id, picking_type_id, partner_id, company_id, owner_id, printed, is_locked, immediate_transfer, create_uid, create_date, write_uid, write_date, sale_id FROM migrate.stock_picking 
WHERE NOT EXISTS (SELECT 1 FROM stock_picking WHERE id=migrate.stock_picking.id);
SELECT pg_catalog.setval('stock_picking_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_picking) x;
ALTER TABLE stock_picking ENABLE TRIGGER ALL;

ALTER TABLE stock_picking_stage DISABLE TRIGGER ALL;
DELETE FROM stock_picking_stage;
INSERT INTO stock_picking_stage ( id, name)
SELECT id,x_name FROM migrate.x_stock_picking_stage
WHERE NOT EXISTS (SELECT 1 FROM stock_picking_stage WHERE id=migrate.x_stock_picking_stage.id);
SELECT pg_catalog.setval('stock_picking_stage_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_picking_stage) x;
ALTER TABLE stock_picking_stage ENABLE TRIGGER ALL;

ALTER TABLE delivery_carrier DISABLE TRIGGER ALL;
DELETE FROM delivery_carrier;
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
INSERT INTO mail_alias ( id, alias_name, alias_model_id, alias_user_id, alias_defaults, alias_force_thread_id, alias_parent_thread_id, alias_contact, create_uid, create_date, write_uid, write_date ) 
SELECT id, alias_name, alias_model_id, alias_user_id, alias_defaults, alias_force_thread_id, alias_parent_thread_id, alias_contact, create_uid, create_date, write_uid, write_date FROM migrate.mail_alias 
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

-- ALTER TABLE res_groups_implied_rel DISABLE TRIGGER ALL;
-- INSERT INTO res_groups_implied_rel ( gid, hid ) 
-- SELECT gid, hid FROM migrate.res_groups_implied_rel 
-- WHERE NOT EXISTS (SELECT 1 FROM res_groups_implied_rel WHERE gid=migrate.res_groups_implied_rel.gid AND hid=migrate.res_groups_implied_rel.hid);
-- ALTER TABLE res_groups_implied_rel ENABLE TRIGGER ALL;

-----Krishna


ALTER TABLE res_company_users_rel DISABLE TRIGGER ALL;
INSERT INTO res_company_users_rel ( cid, user_id ) 
SELECT cid, user_id FROM migrate.res_company_users_rel 
WHERE NOT EXISTS (SELECT 1 FROM res_company_users_rel WHERE cid=migrate.res_company_users_rel.cid AND user_id=migrate.res_company_users_rel.user_id);
ALTER TABLE res_company_users_rel ENABLE TRIGGER ALL;

ALTER TABLE res_country DISABLE TRIGGER ALL;
INSERT INTO res_country ( id, name, code, address_format, address_view_id, currency_id, phone_code, name_position, vat_label, state_required, zip_required, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, code, address_format, address_view_id, currency_id, phone_code, name_position, vat_label, False, False, create_uid, create_date, write_uid, write_date FROM migrate.res_country 
WHERE NOT EXISTS (SELECT 1 FROM res_country WHERE code=migrate.res_country.code);
SELECT pg_catalog.setval('res_country_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_country) x;
ALTER TABLE res_country ENABLE TRIGGER ALL;

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

ALTER TABLE mail_compose_message_ir_attachments_rel DISABLE TRIGGER ALL;
INSERT INTO mail_compose_message_ir_attachments_rel ( wizard_id, attachment_id ) 
SELECT wizard_id, attachment_id FROM migrate.mail_compose_message_ir_attachments_rel 
WHERE NOT EXISTS (SELECT 1 FROM mail_compose_message_ir_attachments_rel WHERE wizard_id=migrate.mail_compose_message_ir_attachments_rel.wizard_id AND attachment_id=migrate.mail_compose_message_ir_attachments_rel.attachment_id);
ALTER TABLE mail_compose_message_ir_attachments_rel ENABLE TRIGGER ALL;


-- ALTER TABLE ir_attachment DISABLE TRIGGER ALL;
-- INSERT INTO ir_attachment ( id, name, description, res_model, res_field, res_id, company_id, type, url, public, access_token, db_datas, store_fname, file_size, checksum, mimetype, index_content, create_uid, create_date, write_uid, write_date, website_id, key, theme_template_id ) 
-- SELECT id, name, description, res_model, res_field, res_id, company_id, type, url, public, access_token, db_datas, store_fname, file_size, checksum, mimetype, index_content, create_uid, create_date, write_uid, write_date, website_id, key, theme_template_id FROM migrate.ir_attachment 
-- WHERE NOT EXISTS (SELECT 1 FROM ir_attachment WHERE id=migrate.ir_attachment.id);
-- SELECT pg_catalog.setval('ir_attachment_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_attachment) x;
-- ALTER TABLE ir_attachment ENABLE TRIGGER ALL;

ALTER TABLE res_groups DISABLE TRIGGER ALL;
INSERT INTO res_groups ( id, name, comment, category_id, color, share, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, comment, category_id, color, share, create_uid, create_date, write_uid, write_date FROM migrate.res_groups 
WHERE NOT EXISTS (SELECT 1 FROM res_groups WHERE id=migrate.res_groups.id);
SELECT pg_catalog.setval('res_groups_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_groups) x;
ALTER TABLE res_groups ENABLE TRIGGER ALL;


ALTER TABLE calendar_event DISABLE TRIGGER ALL;
INSERT INTO calendar_event ( id, message_main_attachment_id, name, start, stop, allday, start_date, stop_date, duration, description, privacy, location, show_as, res_id, res_model_id, res_model, user_id, active, recurrency, create_uid, create_date, write_uid, write_date, opportunity_id ) 
SELECT id, message_main_attachment_id, name, start, stop, allday, start_date, stop_date, duration, description, privacy, location, show_as, res_id, res_model_id, res_model, user_id, active, recurrency, create_uid, create_date, write_uid, write_date, opportunity_id FROM migrate.calendar_event 
WHERE NOT EXISTS (SELECT 1 FROM calendar_event WHERE id=migrate.calendar_event.id);
SELECT pg_catalog.setval('calendar_event_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM calendar_event) x;
ALTER TABLE calendar_event ENABLE TRIGGER ALL;

ALTER TABLE digest_digest DISABLE TRIGGER ALL;
INSERT INTO digest_digest ( id, name, periodicity, next_run_date, company_id, state, kpi_res_users_connected, kpi_mail_message_total, create_uid, create_date, write_uid, write_date, kpi_account_total_revenue, kpi_crm_lead_created, kpi_crm_opportunities_won, kpi_account_bank_cash, kpi_all_sale_total, kpi_website_sale_total ) 
SELECT id, name, periodicity, next_run_date, company_id, state, kpi_res_users_connected, kpi_mail_message_total, create_uid, create_date, write_uid, write_date, kpi_account_total_revenue, kpi_crm_lead_created, kpi_crm_opportunities_won, kpi_account_bank_cash, kpi_all_sale_total, kpi_website_sale_total FROM migrate.digest_digest 
WHERE NOT EXISTS (SELECT 1 FROM digest_digest WHERE id=migrate.digest_digest.id);
SELECT pg_catalog.setval('digest_digest_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM digest_digest) x;
ALTER TABLE digest_digest ENABLE TRIGGER ALL;

ALTER TABLE ir_config_parameter DISABLE TRIGGER ALL;
INSERT INTO ir_config_parameter ( id, key, value, create_uid, create_date, write_uid, write_date ) 
SELECT id, key, value, create_uid, create_date, write_uid, write_date FROM migrate.ir_config_parameter 
WHERE NOT EXISTS (SELECT 1 FROM ir_config_parameter WHERE id=migrate.ir_config_parameter.id);
SELECT pg_catalog.setval('ir_config_parameter_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_config_parameter) x;
ALTER TABLE ir_config_parameter ENABLE TRIGGER ALL;

ALTER TABLE res_config_settings DISABLE TRIGGER ALL;
INSERT INTO res_config_settings ( id, create_uid, create_date, write_uid, write_date, company_id, user_default_rights, external_email_server_default, module_base_import, module_google_calendar, module_google_drive, module_google_spreadsheet, module_auth_oauth, module_auth_ldap, module_base_gengo, module_pad, module_voip, module_web_unsplash, module_partner_autocomplete, group_multi_currency, show_effect, fail_counter, alias_domain, auth_signup_reset_password, auth_signup_uninvited, auth_signup_template_user_id, group_discount_per_so_line, group_uom, group_product_variant, group_stock_packaging, group_product_pricelist, group_sale_pricelist, product_weight_in_lbs, digest_emails, digest_id, chart_template_id, module_account_accountant, group_analytic_accounting, group_analytic_tags, group_warning_account, group_cash_rounding, group_show_line_subtotals_tax_excluded, group_show_line_subtotals_tax_included, show_line_subtotals_tax_selection, module_account_budget, module_account_payment, module_account_reports, module_account_check_printing, module_account_batch_payment, module_account_sepa, module_account_sepa_direct_debit, module_account_plaid, module_account_yodlee, module_account_bank_statement_import_qif, module_account_bank_statement_import_ofx, module_account_bank_statement_import_csv, module_account_bank_statement_import_camt, module_currency_rate_live, module_account_intrastat, module_product_margin, module_l10n_eu_service, module_account_taxcloud, module_account_invoice_extract, crm_alias_prefix, generate_lead_from_alias, group_use_lead, website_id, group_multi_website, lock_confirmed_po, po_order_approval, default_purchase_method, group_warning_purchase, module_account_3way_match, module_purchase_requisition, use_po_lead, module_sale_margin, use_quotation_validity_days, group_warning_sale, group_sale_delivery_address, group_proforma_sales, default_invoice_policy, deposit_default_product_id, module_delivery, module_delivery_dhl, module_delivery_fedex, module_delivery_ups, module_delivery_usps, module_delivery_bpost, module_delivery_easypost, module_product_email_template, module_sale_coupon, automatic_invoice, template_id, group_sale_order_template, module_sale_quotation_builder ) 
SELECT id, create_uid, create_date, write_uid, write_date, company_id, user_default_rights, external_email_server_default, module_base_import, module_google_calendar, module_google_drive, module_google_spreadsheet, module_auth_oauth, module_auth_ldap, module_base_gengo, module_pad, module_voip, module_web_unsplash, module_partner_autocomplete, group_multi_currency, show_effect, fail_counter, alias_domain, auth_signup_reset_password, auth_signup_uninvited, auth_signup_template_user_id, group_discount_per_so_line, group_uom, group_product_variant, group_stock_packaging, group_product_pricelist, group_sale_pricelist, product_weight_in_lbs, digest_emails, digest_id, chart_template_id, module_account_accountant, group_analytic_accounting, group_analytic_tags, group_warning_account, group_cash_rounding, group_show_line_subtotals_tax_excluded, group_show_line_subtotals_tax_included, show_line_subtotals_tax_selection, module_account_budget, module_account_payment, module_account_reports, module_account_check_printing, module_account_batch_payment, module_account_sepa, module_account_sepa_direct_debit, module_account_plaid, module_account_yodlee, module_account_bank_statement_import_qif, module_account_bank_statement_import_ofx, module_account_bank_statement_import_csv, module_account_bank_statement_import_camt, module_currency_rate_live, module_account_intrastat, module_product_margin, module_l10n_eu_service, module_account_taxcloud, module_account_invoice_extract, crm_alias_prefix, generate_lead_from_alias, group_use_lead, website_id, group_multi_website, lock_confirmed_po, po_order_approval, default_purchase_method, group_warning_purchase, module_account_3way_match, module_purchase_requisition, use_po_lead, module_sale_margin, use_quotation_validity_days, group_warning_sale, group_sale_delivery_address, group_proforma_sales, default_invoice_policy, deposit_default_product_id, module_delivery, module_delivery_dhl, module_delivery_fedex, module_delivery_ups, module_delivery_usps, module_delivery_bpost, module_delivery_easypost, module_product_email_template, module_sale_coupon, automatic_invoice, template_id, group_sale_order_template, module_sale_quotation_builder FROM migrate.res_config_settings 
WHERE NOT EXISTS (SELECT 1 FROM res_config_settings WHERE id=migrate.res_config_settings.id);
SELECT pg_catalog.setval('res_config_settings_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_config_settings) x;
ALTER TABLE res_config_settings ENABLE TRIGGER ALL;


ALTER TABLE res_config_installer DISABLE TRIGGER ALL;
INSERT INTO res_config_installer ( id, create_uid, create_date, write_uid, write_date ) 
SELECT id, create_uid, create_date, write_uid, write_date FROM migrate.res_config_installer 
WHERE NOT EXISTS (SELECT 1 FROM res_config_installer WHERE id=migrate.res_config_installer.id);
SELECT pg_catalog.setval('res_config_installer_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_config_installer) x;
ALTER TABLE res_config_installer ENABLE TRIGGER ALL;

ALTER TABLE calendar_event DISABLE TRIGGER ALL;
INSERT INTO calendar_event ( id, message_main_attachment_id, name, start, stop, allday, start_date, stop_date, duration, description, privacy, location, show_as, res_id, res_model_id, res_model, user_id, active, recurrency, recurrence_id, create_uid, create_date, write_uid, write_date, opportunity_id ) 
SELECT id, message_main_attachment_id, name, start, stop, allday, start_date, stop_date, duration, description, privacy, location, show_as, res_id, res_model_id, res_model, user_id, active, recurrency, recurrent_id, create_uid, create_date, write_uid, write_date, opportunity_id FROM migrate.calendar_event 
WHERE NOT EXISTS (SELECT 1 FROM calendar_event WHERE id=migrate.calendar_event.id);
SELECT pg_catalog.setval('calendar_event_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM calendar_event) x;
ALTER TABLE calendar_event ENABLE TRIGGER ALL;

ALTER TABLE crm_team DISABLE TRIGGER ALL;
INSERT INTO crm_team ( id, message_main_attachment_id, name, active, company_id, user_id, color, create_uid, create_date, write_uid, write_date, use_leads, use_opportunities, use_quotations, invoiced_target ) 
SELECT id, message_main_attachment_id, name, active, company_id, user_id, color, create_uid, create_date, write_uid, write_date, use_leads, use_opportunities, use_quotations, invoiced_target FROM migrate.crm_team 
WHERE NOT EXISTS (SELECT 1 FROM crm_team WHERE id=migrate.crm_team.id);
SELECT pg_catalog.setval('crm_team_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_team) x;
ALTER TABLE crm_team ENABLE TRIGGER ALL;

ALTER TABLE crm_stage DISABLE TRIGGER ALL;
INSERT INTO crm_stage ( id, name, sequence, requirements, team_id, fold, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, sequence, requirements, team_id, fold, create_uid, create_date, write_uid, write_date FROM migrate.crm_stage 
WHERE NOT EXISTS (SELECT 1 FROM crm_stage WHERE id=migrate.crm_stage.id);
SELECT pg_catalog.setval('crm_stage_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_stage) x;
ALTER TABLE crm_stage ENABLE TRIGGER ALL;

ALTER TABLE crm_lost_reason DISABLE TRIGGER ALL;
INSERT INTO crm_lost_reason ( id, name, active, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, active, create_uid, create_date, write_uid, write_date FROM migrate.crm_lost_reason 
WHERE NOT EXISTS (SELECT 1 FROM crm_lost_reason WHERE id=migrate.crm_lost_reason.id);
SELECT pg_catalog.setval('crm_lost_reason_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_lost_reason) x;
ALTER TABLE crm_lost_reason ENABLE TRIGGER ALL;

ALTER TABLE crm_lead_lost DISABLE TRIGGER ALL;
INSERT INTO crm_lead_lost ( id, lost_reason_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, lost_reason_id, create_uid, create_date, write_uid, write_date FROM migrate.crm_lead_lost 
WHERE NOT EXISTS (SELECT 1 FROM crm_lead_lost WHERE id=migrate.crm_lead_lost.id);
SELECT pg_catalog.setval('crm_lead_lost_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_lead_lost) x;
ALTER TABLE crm_lead_lost ENABLE TRIGGER ALL;

ALTER TABLE crm_lead2opportunity_partner DISABLE TRIGGER ALL;
INSERT INTO crm_lead2opportunity_partner ( id, name, action, partner_id, user_id, team_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, action, partner_id, user_id, team_id, create_uid, create_date, write_uid, write_date FROM migrate.crm_lead2opportunity_partner 
WHERE NOT EXISTS (SELECT 1 FROM crm_lead2opportunity_partner WHERE id=migrate.crm_lead2opportunity_partner.id);
SELECT pg_catalog.setval('crm_lead2opportunity_partner_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_lead2opportunity_partner) x;
ALTER TABLE crm_lead2opportunity_partner ENABLE TRIGGER ALL;


ALTER TABLE crm_lead_crm_lead2opportunity_partner_rel DISABLE TRIGGER ALL;
INSERT INTO crm_lead_crm_lead2opportunity_partner_rel ( crm_lead2opportunity_partner_id, crm_lead_id ) 
SELECT crm_lead2opportunity_partner_id, crm_lead_id FROM migrate.crm_lead_crm_lead2opportunity_partner_rel 
WHERE NOT EXISTS (SELECT 1 FROM crm_lead_crm_lead2opportunity_partner_rel WHERE crm_lead2opportunity_partner_id=migrate.crm_lead_crm_lead2opportunity_partner_rel.crm_lead2opportunity_partner_id AND crm_lead_id=migrate.crm_lead_crm_lead2opportunity_partner_rel.crm_lead_id);
ALTER TABLE crm_lead_crm_lead2opportunity_partner_rel ENABLE TRIGGER ALL;

ALTER TABLE crm_lead2opportunity_partner_mass DISABLE TRIGGER ALL;
INSERT INTO crm_lead2opportunity_partner_mass ( id, deduplicate, action, name, partner_id, user_id, team_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, deduplicate, action, name, partner_id, user_id, team_id, create_uid, create_date, write_uid, write_date FROM migrate.crm_lead2opportunity_partner_mass 
WHERE NOT EXISTS (SELECT 1 FROM crm_lead2opportunity_partner_mass WHERE id=migrate.crm_lead2opportunity_partner_mass.id);
SELECT pg_catalog.setval('crm_lead2opportunity_partner_mass_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_lead2opportunity_partner_mass) x;
ALTER TABLE crm_lead2opportunity_partner_mass ENABLE TRIGGER ALL;

ALTER TABLE crm_lead2opportunity_partner_mass_res_users_rel DISABLE TRIGGER ALL;
INSERT INTO crm_lead2opportunity_partner_mass_res_users_rel ( crm_lead2opportunity_partner_mass_id, res_users_id ) 
SELECT crm_lead2opportunity_partner_mass_id, res_users_id FROM migrate.crm_lead2opportunity_partner_mass_res_users_rel 
WHERE NOT EXISTS (SELECT 1 FROM crm_lead2opportunity_partner_mass_res_users_rel WHERE crm_lead2opportunity_partner_mass_id=migrate.crm_lead2opportunity_partner_mass_res_users_rel.crm_lead2opportunity_partner_mass_id AND res_users_id=migrate.crm_lead2opportunity_partner_mass_res_users_rel.res_users_id);
ALTER TABLE crm_lead2opportunity_partner_mass_res_users_rel ENABLE TRIGGER ALL;

ALTER TABLE crm_lead_crm_lead2opportunity_partner_mass_rel DISABLE TRIGGER ALL;
INSERT INTO crm_lead_crm_lead2opportunity_partner_mass_rel ( crm_lead2opportunity_partner_mass_id, crm_lead_id ) 
SELECT crm_lead2opportunity_partner_mass_id, crm_lead_id FROM migrate.crm_lead_crm_lead2opportunity_partner_mass_rel 
WHERE NOT EXISTS (SELECT 1 FROM crm_lead_crm_lead2opportunity_partner_mass_rel WHERE crm_lead2opportunity_partner_mass_id=migrate.crm_lead_crm_lead2opportunity_partner_mass_rel.crm_lead2opportunity_partner_mass_id AND crm_lead_id=migrate.crm_lead_crm_lead2opportunity_partner_mass_rel.crm_lead_id);
ALTER TABLE crm_lead_crm_lead2opportunity_partner_mass_rel ENABLE TRIGGER ALL;

ALTER TABLE crm_merge_opportunity DISABLE TRIGGER ALL;
INSERT INTO crm_merge_opportunity ( id, user_id, team_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, user_id, team_id, create_uid, create_date, write_uid, write_date FROM migrate.crm_merge_opportunity 
WHERE NOT EXISTS (SELECT 1 FROM crm_merge_opportunity WHERE id=migrate.crm_merge_opportunity.id);
SELECT pg_catalog.setval('crm_merge_opportunity_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_merge_opportunity) x;
ALTER TABLE crm_merge_opportunity ENABLE TRIGGER ALL;

ALTER TABLE merge_opportunity_rel DISABLE TRIGGER ALL;
INSERT INTO merge_opportunity_rel ( merge_id, opportunity_id ) 
SELECT merge_id, opportunity_id FROM migrate.merge_opportunity_rel 
WHERE NOT EXISTS (SELECT 1 FROM merge_opportunity_rel WHERE merge_id=migrate.merge_opportunity_rel.merge_id AND opportunity_id=migrate.merge_opportunity_rel.opportunity_id);
ALTER TABLE merge_opportunity_rel ENABLE TRIGGER ALL;

ALTER TABLE crm_lead DISABLE TRIGGER ALL;
INSERT INTO crm_lead ( id, campaign_id, source_id, medium_id, message_bounce, email_cc, message_main_attachment_id, name, user_id, company_id, referred, description, active, type, priority, team_id, stage_id, color, date_closed, date_action_last, date_open, day_open, day_close, date_last_stage_update, date_conversion, date_deadline, partner_id, contact_name, partner_name, function, title, email_from, phone, mobile, website, street, street2, zip, city, state_id, country_id, probability, lost_reason, create_uid, create_date, write_uid, write_date, won_status, days_to_convert, days_exceeding_closing ) 
SELECT id, campaign_id, source_id, medium_id, message_bounce, email_cc, message_main_attachment_id, name, user_id, company_id, referred, description, active, type, priority, team_id, stage_id, color, date_closed, date_action_last, date_open, day_open, day_close, date_last_stage_update, date_conversion, date_deadline, partner_id, contact_name, partner_name, function, title, email_from, phone, mobile, website, street, street2, zip, city, state_id, country_id, probability, lost_reason, create_uid, create_date, write_uid, write_date, won_status, days_to_convert, days_exceeding_closing FROM migrate.crm_lead 
WHERE NOT EXISTS (SELECT 1 FROM crm_lead WHERE id=migrate.crm_lead.id);
SELECT pg_catalog.setval('crm_lead_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_lead) x;
ALTER TABLE crm_lead ENABLE TRIGGER ALL;

ALTER TABLE res_bank DISABLE TRIGGER ALL;
INSERT INTO res_bank ( id, name, street, street2, zip, city, state, country, email, phone, active, bic, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, street, street2, zip, city, state, country, email, phone, active, bic, create_uid, create_date, write_uid, write_date FROM migrate.res_bank 
WHERE NOT EXISTS (SELECT 1 FROM res_bank WHERE id=migrate.res_bank.id);
SELECT pg_catalog.setval('res_bank_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_bank) x;
ALTER TABLE res_bank ENABLE TRIGGER ALL;


ALTER TABLE account_fiscal_position DISABLE TRIGGER ALL;
INSERT INTO account_fiscal_position ( id, sequence, name, active, company_id, note, auto_apply, vat_required, country_id, country_group_id, zip_from, zip_to, create_uid, create_date, write_uid, write_date ) 
SELECT id, sequence, name, active, 1, note, auto_apply, vat_required, country_id, country_group_id, zip_from, zip_to, create_uid, create_date, write_uid, write_date FROM migrate.account_fiscal_position 
WHERE NOT EXISTS (SELECT 1 FROM account_fiscal_position WHERE id=migrate.account_fiscal_position.id);
SELECT pg_catalog.setval('account_fiscal_position_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_fiscal_position) x;
ALTER TABLE account_fiscal_position ENABLE TRIGGER ALL;

-----
--sujata
-----

CREATE TABLE IF NOT EXISTS public.account_invoice_move
(
    invoice_id integer NOT NULL,
    move_id integer NOT NULL);

CREATE TABLE IF NOT EXISTS public.account_invoice_move_line
(
    invoice_line_id integer NOT NULL,
    move_line_id integer NOT NULL);


ALTER TABLE account_account_tag DISABLE TRIGGER ALL;
DELETE FROM account_account_tag;
INSERT INTO account_account_tag ( id, name, applicability, color, active, create_uid, create_date, write_uid, write_date )
SELECT id, name, applicability, color, active, create_uid, create_date, write_uid, write_date FROM migrate.account_account_tag
WHERE NOT EXISTS (SELECT 1 FROM account_account_tag WHERE id=migrate.account_account_tag.id);
SELECT pg_catalog.setval('account_account_tag_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_account_tag) x;
ALTER TABLE account_account_tag ENABLE TRIGGER ALL;

ALTER TABLE account_payment_term DISABLE TRIGGER ALL;
DELETE FROM account_payment_term;
INSERT INTO account_payment_term ( id, name, active, note, company_id, sequence, create_uid, create_date, write_uid, write_date )
SELECT id, name, active, note, company_id, sequence, create_uid, create_date, write_uid, write_date FROM migrate.account_payment_term
WHERE NOT EXISTS (SELECT 1 FROM account_payment_term WHERE id=migrate.account_payment_term.id);
SELECT pg_catalog.setval('account_payment_term_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_payment_term) x;
ALTER TABLE account_payment_term ENABLE TRIGGER ALL;

ALTER TABLE account_payment_term_line DISABLE TRIGGER ALL;
DELETE FROM account_payment_term_line;
INSERT INTO account_payment_term_line ( id, value, value_amount, days, day_of_the_month, option, payment_id, sequence, create_uid, create_date, write_uid, write_date )
SELECT id, value, value_amount, days, day_of_the_month, option, payment_id, sequence, create_uid, create_date, write_uid, write_date FROM migrate.account_payment_term_line
WHERE NOT EXISTS (SELECT 1 FROM account_payment_term_line WHERE id=migrate.account_payment_term_line.id);
SELECT pg_catalog.setval('account_payment_term_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_payment_term_line) x;
ALTER TABLE account_payment_term_line ENABLE TRIGGER ALL;

ALTER TABLE account_incoterms DISABLE TRIGGER ALL;
DELETE FROM account_incoterms;
INSERT INTO account_incoterms ( id, name, code, active, create_uid, create_date, write_uid, write_date )
SELECT id, name, code, active, create_uid, create_date, write_uid, write_date FROM migrate.account_incoterms
WHERE NOT EXISTS (SELECT 1 FROM account_incoterms WHERE id=migrate.account_incoterms.id);
SELECT pg_catalog.setval('account_incoterms_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_incoterms) x;
ALTER TABLE account_incoterms ENABLE TRIGGER ALL;

ALTER TABLE res_partner_bank DISABLE TRIGGER ALL;
DELETE FROM res_partner_bank;
INSERT INTO res_partner_bank ( id, acc_number, sanitized_acc_number, acc_holder_name, partner_id, bank_id, sequence, currency_id, company_id, create_uid, create_date, write_uid, write_date )
SELECT id, acc_number, sanitized_acc_number, acc_holder_name, partner_id, bank_id, sequence, currency_id, company_id, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_bank
WHERE NOT EXISTS (SELECT 1 FROM res_partner_bank WHERE id=migrate.res_partner_bank.id);
SELECT pg_catalog.setval('res_partner_bank_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_bank) x;
ALTER TABLE res_partner_bank ENABLE TRIGGER ALL;

ALTER TABLE account_payment DISABLE TRIGGER ALL;
DELETE FROM account_payment;
INSERT INTO account_payment ( id, message_main_attachment_id, payment_method_id, amount, payment_type, partner_type, payment_reference, currency_id, partner_id, create_uid, create_date, write_uid, write_date, payment_transaction_id, payment_token_id, move_id)
SELECT ap.id, ap.message_main_attachment_id, ap.payment_method_id, ap.amount, ap.payment_type, ap.partner_type, ap.payment_reference, ap.currency_id, ap.partner_id, ap.create_uid, ap.create_date, ap.write_uid, ap.write_date, ap.payment_transaction_id, ap.payment_token_id, am.id
from
    migrate.account_payment as ap
inner join
    migrate.account_move as am on am.name = ap.move_name and NOT EXISTS (SELECT 1 FROM account_payment WHERE id=ap.id);
SELECT pg_catalog.setval('account_payment_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_payment) x;
ALTER TABLE account_payment ENABLE TRIGGER ALL;

ALTER TABLE account_payment_method DISABLE TRIGGER ALL;
DELETE FROM account_payment_method;
INSERT INTO account_payment_method ( id, name, code, payment_type, create_uid, create_date, write_uid, write_date )
SELECT id, name, code, payment_type, create_uid, create_date, write_uid, write_date FROM migrate.account_payment_method
WHERE NOT EXISTS (SELECT 1 FROM account_payment_method WHERE id=migrate.account_payment_method.id);
SELECT pg_catalog.setval('account_payment_method_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_payment_method) x;
ALTER TABLE account_payment_method ENABLE TRIGGER ALL;

ALTER TABLE account_move DISABLE TRIGGER ALL;
INSERT INTO account_move ( id,access_token,mes_id,name,date,move_type,ref,state,journal_id,company_id,currency_id,partner_id,commercial_partner_id,partner_bank_id,amount_untaxed,amount_tax,amount_total,amount_residual,amount_untaxed_signed,amount_total_signed,invoice_date,invoice_date_due,invoice_origin,invoice_payment_term_id,invoice_incoterm_id,invoice_source_email,invoice_partner_display_name,invoice_cash_rounding_id,message_main_attachment_id,create_uid,create_date,write_uid,write_date,extract_state,extract_remote_id,campaign_id,source_id,medium_id,team_id,partner_shipping_id
 )
SELECT am.id,access_token,ai.id,am.name,am.date,type,reference,am.state,am.journal_id,am.company_id,am.currency_id,am.partner_id,commercial_partner_id,partner_bank_id,amount_untaxed,amount_tax,amount_total,residual,amount_untaxed_signed,amount_total_signed,date_invoice,date_due,origin,payment_term_id,incoterm_id,source_email,vendor_display_name,cash_rounding_id,message_main_attachment_id,am.create_uid,am.create_date,am.write_uid,am.write_date,extract_state,extract_remoteid,campaign_id,source_id,medium_id,team_id,partner_shipping_id
 from
    migrate.account_invoice as ai
inner join
    migrate.account_move as am on am.id = ai.move_id and am.state='posted' and NOT EXISTS (SELECT 1 FROM account_move WHERE id=am.id);
SELECT pg_catalog.setval('account_move_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_move) x;
ALTER TABLE account_move ENABLE TRIGGER ALL;

INSERT INTO account_invoice_move (move_id, invoice_id)
SELECT am.id,ai.id
 from
    migrate.account_invoice as ai
inner join
    migrate.account_move as am on am.id = ai.move_id and am.state='posted';

ALTER TABLE account_move DISABLE TRIGGER ALL;
INSERT INTO account_move ( id,name,date,move_type,ref,state,journal_id,company_id,currency_id,partner_id,commercial_partner_id,create_uid,create_date,write_uid,write_date,extract_state
 )
SELECT am.id,am.name,am.date,'entry',am.ref,am.state,am.journal_id,am.company_id,am.currency_id,am.partner_id,am.partner_id,am.create_uid,am.create_date,am.write_uid,am.write_date, 'no_extract_requested'
 from
    migrate.account_move as am
 inner join
    migrate.account_payment as ap on am.name = ap.move_name and NOT EXISTS (SELECT 1 FROM account_move WHERE id=am.id) and am.state = 'posted';
SELECT pg_catalog.setval('account_move_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_move) x;
ALTER TABLE account_move ENABLE TRIGGER ALL;

ALTER TABLE mail_message_subtype DISABLE TRIGGER ALL;
INSERT INTO mail_message_subtype ( id, name, description, internal, parent_id, relation_field, res_model, sequence, hidden, create_uid, create_date, write_uid, write_date )
SELECT id, name, description, internal, parent_id, relation_field, res_model, sequence, hidden, create_uid, create_date, write_uid, write_date FROM migrate.mail_message_subtype
WHERE NOT EXISTS (SELECT 1 FROM mail_message_subtype WHERE id=migrate.mail_message_subtype.id);
SELECT pg_catalog.setval('mail_message_subtype_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_message_subtype) x;
ALTER TABLE mail_message_subtype ENABLE TRIGGER ALL;


ALTER TABLE account_move_line DISABLE TRIGGER ALL;
INSERT INTO account_move_line ( id, move_id, date, ref, journal_id, company_id, company_currency_id, account_id, name, quantity, debit, credit, balance, amount_currency, reconciled, blocked, date_maturity, currency_id, partner_id, product_uom_id, product_id, payment_id, statement_line_id, statement_id, tax_line_id, tax_base_amount, tax_exigible, amount_residual, amount_residual_currency, full_reconcile_id, analytic_account_id, create_uid, create_date, write_uid, write_date, expected_pay_date, internal_note, next_action_date, followup_line_id, followup_date,parent_state )
SELECT aml.id, aml.move_id, aml.date, aml.ref, aml.journal_id, aml.company_id, aml.company_currency_id, aml.account_id, aml.name, aml.quantity, aml.debit, aml.credit, aml.balance, aml.balance, aml.reconciled, aml.blocked, aml.date_maturity, am.currency_id, aml.partner_id, aml.product_uom_id, aml.product_id, aml.payment_id, aml.statement_line_id, aml.statement_id, aml.tax_line_id, aml.tax_base_amount, aml.tax_exigible, aml.amount_residual, aml.amount_residual_currency, aml.full_reconcile_id, aml.analytic_account_id, aml.create_uid, aml.create_date, aml.write_uid, aml.write_date, aml.expected_pay_date, aml.internal_note, aml.next_action_date, aml.followup_line_id, aml.followup_date, am.state
FROM migrate.account_move_line as aml
inner join
    public.account_move as am on am.id = aml.move_id and NOT EXISTS (SELECT 1 FROM account_move_line WHERE id=aml.id);
SELECT pg_catalog.setval('account_move_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_move_line) x;
ALTER TABLE account_move_line ENABLE TRIGGER ALL;

ALTER TABLE account_followup_followup_line DISABLE TRIGGER ALL;
INSERT INTO account_followup_followup_line ( id,company_id, name, delay, description, send_email, print_letter, manual_action, manual_action_note, manual_action_type_id, manual_action_responsible_id, create_uid, create_date, write_uid, write_date, send_letter ) 
SELECT id,1, name, delay, description, send_email, print_letter, manual_action, manual_action_note, manual_action_type_id, manual_action_responsible_id, create_uid, create_date, write_uid, write_date, send_letter FROM migrate.account_followup_followup_line 
WHERE NOT EXISTS (SELECT 1 FROM account_followup_followup_line WHERE id=migrate.account_followup_followup_line.id);
SELECT pg_catalog.setval('account_followup_followup_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_followup_followup_line) x;
ALTER TABLE account_followup_followup_line ENABLE TRIGGER ALL;

ALTER TABLE account_journal DISABLE TRIGGER ALL;
DELETE FROM account_journal;
INSERT INTO account_journal ( id, name, code, active, type, sequence, currency_id, company_id, refund_sequence, at_least_one_inbound, at_least_one_outbound, profit_account_id, loss_account_id, bank_account_id, bank_statements_source, alias_id, show_on_dashboard, color, create_uid, create_date, write_uid, write_date, account_online_journal_id, bank_statement_creation,invoice_reference_type,invoice_reference_model, payment_credit_account_id, payment_debit_account_id, default_account_id)
SELECT id, name, code, active, type, sequence, currency_id, company_id, refund_sequence, at_least_one_inbound, at_least_one_outbound, profit_account_id, loss_account_id, bank_account_id, bank_statements_source, alias_id, show_on_dashboard, color, create_uid, create_date, write_uid, write_date, account_online_journal_id, bank_statement_creation,'invoice','odoo', default_credit_account_id, default_debit_account_id, default_debit_account_id FROM migrate.account_journal
WHERE NOT EXISTS (SELECT 1 FROM account_journal WHERE id=migrate.account_journal.id);
SELECT pg_catalog.setval('account_journal_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_journal) x;
ALTER TABLE account_journal ENABLE TRIGGER ALL;

ALTER TABLE account_account DISABLE TRIGGER ALL;
DELETE FROM account_account;
INSERT INTO account_account ( id, name, currency_id, code, deprecated, user_type_id, internal_type, internal_group, reconcile, note, company_id, group_id, create_uid, create_date, write_uid, write_date,create_asset)
SELECT id, name, currency_id, code, deprecated, user_type_id, internal_type, internal_group, reconcile, note, company_id, group_id, create_uid, create_date, write_uid, write_date, 'no' FROM migrate.account_account
WHERE NOT EXISTS (SELECT 1 FROM account_account WHERE id=migrate.account_account.id);
SELECT pg_catalog.setval('account_account_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_account) x;
ALTER TABLE account_account ENABLE TRIGGER ALL;

ALTER TABLE account_tax DISABLE TRIGGER ALL;
DELETE FROM account_tax;
INSERT INTO account_tax ( id, name, type_tax_use, amount_type, active, company_id, sequence, amount, description, price_include, include_base_amount, analytic, tax_group_id, tax_exigibility, create_uid, create_date, write_uid, write_date )
SELECT id, name, type_tax_use, amount_type, active, company_id, sequence, amount, description, price_include, include_base_amount, analytic, tax_group_id, tax_exigibility, create_uid, create_date, write_uid, write_date FROM migrate.account_tax
WHERE NOT EXISTS (SELECT 1 FROM account_tax WHERE id=migrate.account_tax.id);
SELECT pg_catalog.setval('account_tax_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_tax) x;
ALTER TABLE account_tax ENABLE TRIGGER ALL;

ALTER TABLE account_tax_group DISABLE TRIGGER ALL;
DELETE FROM account_tax_group;
INSERT INTO account_tax_group ( id, name, sequence, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, sequence, create_uid, create_date, write_uid, write_date FROM migrate.account_tax_group 
WHERE NOT EXISTS (SELECT 1 FROM account_tax_group WHERE id=migrate.account_tax_group.id);
SELECT pg_catalog.setval('account_tax_group_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_tax_group) x;
ALTER TABLE account_tax_group ENABLE TRIGGER ALL;

ALTER TABLE account_account_account_tag DISABLE TRIGGER ALL;
DELETE FROM account_account_account_tag;
INSERT INTO account_account_account_tag ( account_account_id, account_account_tag_id ) 
SELECT account_account_id, account_account_tag_id FROM migrate.account_account_account_tag 
WHERE NOT EXISTS (SELECT 1 FROM account_account_account_tag WHERE account_account_id=migrate.account_account_account_tag.account_account_id AND account_account_tag_id=migrate.account_account_account_tag.account_account_tag_id);
ALTER TABLE account_account_account_tag ENABLE TRIGGER ALL;

ALTER TABLE account_full_reconcile DISABLE TRIGGER ALL;
INSERT INTO account_full_reconcile ( id, name, exchange_move_id, create_uid, create_date, write_uid, write_date ) 
SELECT id, name, exchange_move_id, create_uid, create_date, write_uid, write_date FROM migrate.account_full_reconcile 
WHERE NOT EXISTS (SELECT 1 FROM account_full_reconcile WHERE id=migrate.account_full_reconcile.id);
SELECT pg_catalog.setval('account_full_reconcile_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_full_reconcile) x;
ALTER TABLE account_full_reconcile ENABLE TRIGGER ALL;

ALTER TABLE account_move_line_account_tax_rel DISABLE TRIGGER ALL;
INSERT INTO account_move_line_account_tax_rel ( account_move_line_id, account_tax_id )
SELECT account_move_line_id, account_tax_id FROM migrate.account_move_line_account_tax_rel
WHERE NOT EXISTS (SELECT 1 FROM account_move_line_account_tax_rel WHERE account_move_line_id=migrate.account_move_line_account_tax_rel.account_move_line_id AND account_tax_id=migrate.account_move_line_account_tax_rel.account_tax_id);
ALTER TABLE account_move_line_account_tax_rel ENABLE TRIGGER ALL;


ALTER TABLE ir_sequence_date_range DISABLE TRIGGER ALL;
DELETE FROM ir_sequence_date_range;
INSERT INTO ir_sequence_date_range ( id, date_from, date_to, sequence_id, number_next, create_uid, create_date, write_uid, write_date )
SELECT id, date_from, date_to, sequence_id, number_next, create_uid, create_date, write_uid, write_date FROM migrate.ir_sequence_date_range
WHERE NOT EXISTS (SELECT 1 FROM ir_sequence_date_range WHERE id=migrate.ir_sequence_date_range.id);
SELECT pg_catalog.setval('ir_sequence_date_range_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_sequence_date_range) x;
ALTER TABLE ir_sequence_date_range ENABLE TRIGGER ALL;

ALTER TABLE ir_sequence DISABLE TRIGGER ALL;
DELETE FROM ir_sequence;
INSERT INTO ir_sequence ( id, name, code, implementation, active, prefix, suffix, number_next, number_increment, padding, company_id, use_date_range, create_uid, create_date, write_uid, write_date )
SELECT id, name, code, implementation, active, prefix, suffix, number_next, number_increment, padding, company_id, use_date_range, create_uid, create_date, write_uid, write_date FROM migrate.ir_sequence
WHERE NOT EXISTS (SELECT 1 FROM ir_sequence WHERE id=migrate.ir_sequence.id);
SELECT pg_catalog.setval('ir_sequence_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_sequence) x;
ALTER TABLE ir_sequence ENABLE TRIGGER ALL;

ALTER TABLE ir_property DISABLE TRIGGER ALL;
DELETE FROM ir_property;
INSERT INTO ir_property ( id, name, res_id, company_id, fields_id, value_float, value_integer, value_text, value_binary, value_reference, value_datetime, type, create_uid, create_date, write_uid, write_date )
SELECT id, name, res_id, company_id, fields_id, value_float, value_integer, value_text, value_binary, value_reference, value_datetime, type, create_uid, create_date, write_uid, write_date FROM migrate.ir_property
WHERE NOT EXISTS (SELECT 1 FROM ir_property WHERE id=migrate.ir_property.id);
SELECT pg_catalog.setval('ir_property_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_property) x;
ALTER TABLE ir_property ENABLE TRIGGER ALL;


