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
DELETE FROM res_users;
INSERT INTO res_users ( id, active, login, password, company_id, partner_id, create_date, signature, action_id, share, create_uid, write_uid, write_date, notification_type, odoobot_state, sale_team_id, target_sales_won, target_sales_done, website_id, target_sales_invoiced )
SELECT id, active, login, password, company_id, partner_id, create_date, signature, action_id, False, create_uid, write_uid, write_date, notification_type, odoobot_state, sale_team_id, target_sales_won, target_sales_done, website_id, target_sales_invoiced FROM migrate.res_users
WHERE NOT EXISTS (SELECT 1 FROM res_users WHERE id=migrate.res_users.id);
SELECT pg_catalog.setval('res_users_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_users) x;
ALTER TABLE res_users ENABLE TRIGGER ALL;

ALTER TABLE res_partner_title DISABLE TRIGGER ALL;
INSERT INTO res_partner_title ( id, name, shortcut, create_uid, create_date, write_uid, write_date )
SELECT id, name, shortcut, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_title
WHERE NOT EXISTS (SELECT 1 FROM res_partner_title WHERE id=migrate.res_partner_title.id);
SELECT pg_catalog.setval('res_partner_title_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_title) x;
ALTER TABLE res_partner_title ENABLE TRIGGER ALL;

ALTER TABLE uom_uom DISABLE TRIGGER ALL;
DELETE FROM uom_uom;
INSERT INTO uom_uom ( id, name, category_id, factor, rounding, active, uom_type, create_uid, create_date, write_uid, write_date )
SELECT id, name, category_id, factor, rounding, active, uom_type, create_uid, create_date, write_uid, write_date FROM migrate.uom_uom
WHERE NOT EXISTS (SELECT 1 FROM uom_uom WHERE id=migrate.uom_uom.id);
SELECT pg_catalog.setval('uom_uom_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM uom_uom) x;
ALTER TABLE uom_uom ENABLE TRIGGER ALL;
--------

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
INSERT INTO account_move ( id,access_token,name,date,move_type,ref,state,journal_id,company_id,currency_id,partner_id,commercial_partner_id,partner_bank_id,amount_untaxed,amount_tax,amount_total,amount_residual,amount_untaxed_signed,amount_total_signed,invoice_date,invoice_date_due,invoice_origin,invoice_payment_term_id,invoice_incoterm_id,invoice_source_email,invoice_partner_display_name,invoice_cash_rounding_id,message_main_attachment_id,create_uid,create_date,write_uid,write_date,extract_state,extract_remote_id,campaign_id,source_id,medium_id,team_id,partner_shipping_id
 )
SELECT am.id,access_token,am.name,am.date,type,reference,am.state,am.journal_id,am.company_id,am.currency_id,am.partner_id,commercial_partner_id,partner_bank_id,amount_untaxed,amount_tax,amount_total,ai.residual,amount_untaxed_signed,amount_total_signed,date_invoice,date_due,origin,payment_term_id,incoterm_id,source_email,vendor_display_name,cash_rounding_id,message_main_attachment_id,am.create_uid,am.create_date,am.write_uid,am.write_date,extract_state,extract_remoteid,campaign_id,source_id,medium_id,team_id,partner_shipping_id
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

ALTER TABLE account_move DISABLE TRIGGER ALL;
INSERT INTO account_move ( id,name,date,move_type,ref,state,journal_id,company_id,currency_id,partner_id,commercial_partner_id,create_uid,create_date,write_uid,write_date,extract_state
 )
SELECT am.id,am.name,am.date,'entry',am.ref,am.state,am.journal_id,am.company_id,am.currency_id,am.partner_id,am.partner_id,am.create_uid,am.create_date,am.write_uid,am.write_date, 'no_extract_requested'
 from
    migrate.account_move as am
WHERE NOT EXISTS (SELECT 1 FROM account_move WHERE id=am.id) and am.state = 'posted';
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

ALTER TABLE account_partial_reconcile DISABLE TRIGGER ALL;
INSERT INTO account_partial_reconcile ( id, debit_move_id, credit_move_id, full_reconcile_id, amount, company_id, max_date, create_uid, create_date, write_uid, write_date )
SELECT id, debit_move_id, credit_move_id, full_reconcile_id, amount, company_id, max_date, create_uid, create_date, write_uid, write_date FROM migrate.account_partial_reconcile
WHERE NOT EXISTS (SELECT 1 FROM account_partial_reconcile WHERE id=migrate.account_partial_reconcile.id);
SELECT pg_catalog.setval('account_partial_reconcile_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_partial_reconcile) x;
ALTER TABLE account_partial_reconcile ENABLE TRIGGER ALL;

ALTER TABLE account_full_reconcile DISABLE TRIGGER ALL;
INSERT INTO account_full_reconcile ( id, name, exchange_move_id, create_uid, create_date, write_uid, write_date )
SELECT id, name, exchange_move_id, create_uid, create_date, write_uid, write_date FROM migrate.account_full_reconcile
WHERE NOT EXISTS (SELECT 1 FROM account_full_reconcile WHERE id=migrate.account_full_reconcile.id);
SELECT pg_catalog.setval('account_full_reconcile_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_full_reconcile) x;
ALTER TABLE account_full_reconcile ENABLE TRIGGER ALL;

UPDATE public.account_partial_reconcile
     SET debit_currency_id =  public.account_move_line.currency_id,
         debit_amount_currency = public.account_move_line.amount_currency
     FROM migrate.account_partial_reconcile
     INNER JOIN account_move_line on account_move_line.id = migrate.account_partial_reconcile.debit_move_id
WHERE public.account_partial_reconcile.id=migrate.account_partial_reconcile.id;

UPDATE public.account_partial_reconcile
     SET credit_amount_currency =  public.account_move_line.amount_currency,
         credit_currency_id = public.account_move_line.currency_id
     FROM migrate.account_partial_reconcile
     INNER JOIN account_move_line on account_move_line.id = migrate.account_partial_reconcile.credit_move_id
WHERE public.account_partial_reconcile.id=migrate.account_partial_reconcile.id;

ALTER TABLE account_bank_statement DISABLE TRIGGER ALL;
INSERT INTO account_bank_statement ( id, message_main_attachment_id, name, reference, date, date_done, balance_start, balance_end_real, state, journal_id, company_id, total_entry_encoding, balance_end, difference, user_id, cashbox_start_id, cashbox_end_id, create_uid, create_date, write_uid, write_date )
SELECT id, message_main_attachment_id, name, reference, date, date_done, balance_start, balance_end_real, state, journal_id, company_id, total_entry_encoding, balance_end, difference, user_id, cashbox_start_id, cashbox_end_id, create_uid, create_date, write_uid, write_date FROM migrate.account_bank_statement
WHERE NOT EXISTS (SELECT 1 FROM account_bank_statement WHERE id=migrate.account_bank_statement.id);
SELECT pg_catalog.setval('account_bank_statement_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_bank_statement) x;
ALTER TABLE account_bank_statement ENABLE TRIGGER ALL;

ALTER TABLE account_bank_statement_line DISABLE TRIGGER ALL;
INSERT INTO account_bank_statement_line ( id, statement_id, sequence, account_number, partner_name, amount, amount_currency, currency_id, partner_id, create_uid, create_date, write_uid, write_date, online_identifier, online_partner_vendor_name, online_partner_bank_account, unique_import_id, move_id , payment_ref)
SELECT id, statement_id, sequence, account_number, partner_name, amount, amount_currency, currency_id, partner_id, create_uid, create_date, write_uid, write_date, online_identifier, online_partner_vendor_name, online_partner_bank_account, unique_import_id, 1, 'ref' FROM migrate.account_bank_statement_line
WHERE NOT EXISTS (SELECT 1 FROM account_bank_statement_line WHERE id=migrate.account_bank_statement_line.id);
SELECT pg_catalog.setval('account_bank_statement_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_bank_statement_line) x;
ALTER TABLE account_bank_statement_line ENABLE TRIGGER ALL;

UPDATE public.account_bank_statement_line
     SET move_id =  public.account_move_line.move_id,
         payment_ref = public.account_move_line.ref,
         currency_id = public.account_move_line.currency_id
     FROM migrate.account_bank_statement_line
     INNER JOIN public.account_move_line on migrate.account_bank_statement_line.id = public.account_move_line.statement_line_id
WHERE public.account_bank_statement_line.id=migrate.account_bank_statement_line.id;
