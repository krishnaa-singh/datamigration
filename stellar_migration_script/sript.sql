
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

ALTER TABLE sale_order_line DISABLE TRIGGER ALL;
INSERT INTO sale_order_line ( id, order_id, name, sequence, invoice_status, price_unit, price_subtotal, price_tax, price_total, price_reduce, price_reduce_taxinc, price_reduce_taxexcl, discount, product_id, product_uom_qty, product_uom, qty_delivered_method, qty_delivered, qty_delivered_manual, qty_to_invoice, qty_invoiced, untaxed_amount_invoiced, untaxed_amount_to_invoice, salesman_id, currency_id, company_id, order_partner_id, is_expense, is_downpayment, state, customer_lead, display_type, create_uid, create_date, write_uid, write_date, product_packaging, route_id )
SELECT id, order_id, name, sequence, invoice_status, price_unit, price_subtotal, price_tax, price_total, price_reduce, price_reduce_taxinc, price_reduce_taxexcl, discount, product_id, product_uom_qty, product_uom, qty_delivered_method, qty_delivered, qty_delivered_manual, qty_to_invoice, qty_invoiced, untaxed_amount_invoiced, untaxed_amount_to_invoice, salesman_id, currency_id, company_id, order_partner_id, is_expense, is_downpayment, state, customer_lead, display_type, create_uid, create_date, write_uid, write_date, product_packaging, route_id FROM migrate.sale_order_line
WHERE NOT EXISTS (SELECT 1 FROM sale_order_line WHERE id=migrate.sale_order_line.id);
SELECT pg_catalog.setval('sale_order_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM sale_order_line) x;
ALTER TABLE sale_order_line ENABLE TRIGGER ALL;

ALTER TABLE sale_order DISABLE TRIGGER ALL;
INSERT INTO sale_order ( id, campaign_id, source_id, medium_id, message_main_attachment_id, access_token, name, origin, client_order_ref, reference, state, date_order, validity_date, require_signature, require_payment, create_date, user_id, partner_id, partner_invoice_id, partner_shipping_id, pricelist_id, analytic_account_id, invoice_status, note, amount_untaxed, amount_tax, amount_total, currency_rate, payment_term_id, fiscal_position_id, company_id, team_id, signed_by, commitment_date, create_uid, write_uid, write_date, sale_order_template_id, incoterm, picking_policy, warehouse_id, procurement_group_id, effective_date, opportunity_id )
SELECT id, campaign_id, source_id, medium_id, message_main_attachment_id, access_token, name, origin, client_order_ref, reference, state, date_order, validity_date, require_signature, require_payment, create_date, user_id, partner_id, partner_invoice_id, partner_shipping_id, pricelist_id, analytic_account_id, invoice_status, note, amount_untaxed, amount_tax, amount_total, currency_rate, payment_term_id, fiscal_position_id, company_id, team_id, signed_by, commitment_date, create_uid, write_uid, write_date, sale_order_template_id, incoterm, picking_policy, warehouse_id, procurement_group_id, effective_date, opportunity_id FROM migrate.sale_order
WHERE NOT EXISTS (SELECT 1 FROM sale_order WHERE id=migrate.sale_order.id);
SELECT pg_catalog.setval('sale_order_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM sale_order) x;
ALTER TABLE sale_order ENABLE TRIGGER ALL;

ALTER TABLE ir_logging DISABLE TRIGGER ALL;
INSERT INTO ir_logging ( id, create_uid, create_date, write_uid, write_date, name, type, dbname, level, message, path, func, line )
SELECT id, create_uid, create_date, write_uid, write_date, name, type, dbname, level, message, path, func, line FROM migrate.ir_logging
WHERE NOT EXISTS (SELECT 1 FROM ir_logging WHERE id=migrate.ir_logging.id);
SELECT pg_catalog.setval('ir_logging_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_logging) x;
ALTER TABLE ir_logging ENABLE TRIGGER ALL;

ALTER TABLE account_followup_followup_line DISABLE TRIGGER ALL;
INSERT INTO account_followup_followup_line ( id, company_id, name, delay, description, send_email, print_letter, manual_action, manual_action_note, manual_action_type_id, manual_action_responsible_id, create_uid, create_date, write_uid, write_date, send_letter )
SELECT id, 1, name, delay, description, send_email, print_letter, manual_action, manual_action_note, manual_action_type_id, manual_action_responsible_id, create_uid, create_date, write_uid, write_date, send_letter FROM migrate.account_followup_followup_line
WHERE NOT EXISTS (SELECT 1 FROM account_followup_followup_line WHERE id=migrate.account_followup_followup_line.id);
SELECT pg_catalog.setval('account_followup_followup_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_followup_followup_line) x;
ALTER TABLE account_followup_followup_line ENABLE TRIGGER ALL;

ALTER TABLE crm_lead DISABLE TRIGGER ALL;
INSERT INTO crm_lead ( id, campaign_id, source_id, medium_id, message_bounce, email_cc, message_main_attachment_id, name, user_id, company_id, referred, description, active, type, priority, team_id, stage_id, color, expected_revenue, date_closed, date_action_last, date_open, day_open, day_close, date_last_stage_update, date_conversion, date_deadline, partner_id, contact_name, partner_name, function, title, email_from, phone, mobile, website, street, street2, zip, city, state_id, country_id, probability, lost_reason, create_uid, create_date, write_uid, write_date, won_status, days_to_convert, days_exceeding_closing )
SELECT id, campaign_id, source_id, medium_id, message_bounce, email_cc, message_main_attachment_id, name, user_id, company_id, referred, description, active, type, priority, team_id, stage_id, color, expected_revenue, date_closed, date_action_last, date_open, day_open, day_close, date_last_stage_update, date_conversion, date_deadline, partner_id, contact_name, partner_name, function, title, email_from, phone, mobile, website, street, street2, zip, city, state_id, country_id, probability, lost_reason, create_uid, create_date, write_uid, write_date, won_status, days_to_convert, days_exceeding_closing FROM migrate.crm_lead
WHERE NOT EXISTS (SELECT 1 FROM crm_lead WHERE id=migrate.crm_lead.id);
SELECT pg_catalog.setval('crm_lead_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_lead) x;
ALTER TABLE crm_lead ENABLE TRIGGER ALL;

--ALTER TABLE ir_sequence_date_range DISABLE TRIGGER ALL;
--INSERT INTO ir_sequence_date_range ( id, date_from, date_to, sequence_id, number_next, create_uid, create_date, write_uid, write_date )
--SELECT id, date_from, date_to, sequence_id, number_next, create_uid, create_date, write_uid, write_date FROM migrate.ir_sequence_date_range
--WHERE NOT EXISTS (SELECT 1 FROM ir_sequence_date_range WHERE id=migrate.ir_sequence_date_range.id);
--SELECT pg_catalog.setval('ir_sequence_date_range_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_sequence_date_range) x;
--ALTER TABLE ir_sequence_date_range ENABLE TRIGGER ALL;

ALTER TABLE stock_inventory_line DISABLE TRIGGER ALL;
INSERT INTO stock_inventory_line ( id, inventory_id, partner_id, product_id, product_uom_id, product_qty, location_id, package_id, prod_lot_id, company_id, theoretical_qty, create_uid, create_date, write_uid, write_date )
SELECT id, inventory_id, partner_id, product_id, product_uom_id, product_qty, location_id, package_id, prod_lot_id, company_id, theoretical_qty, create_uid, create_date, write_uid, write_date FROM migrate.stock_inventory_line
WHERE NOT EXISTS (SELECT 1 FROM stock_inventory_line WHERE id=migrate.stock_inventory_line.id);
SELECT pg_catalog.setval('stock_inventory_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_inventory_line) x;
ALTER TABLE stock_inventory_line ENABLE TRIGGER ALL;

ALTER TABLE stock_route_product DISABLE TRIGGER ALL;
INSERT INTO stock_route_product ( route_id, product_id )
SELECT route_id, product_id FROM migrate.stock_route_product
WHERE NOT EXISTS (SELECT 1 FROM stock_route_product WHERE route_id=migrate.stock_route_product.route_id AND product_id=migrate.stock_route_product.product_id);
ALTER TABLE stock_route_product ENABLE TRIGGER ALL;

ALTER TABLE stock_route_warehouse DISABLE TRIGGER ALL;
INSERT INTO stock_route_warehouse ( route_id, warehouse_id )
SELECT route_id, warehouse_id FROM migrate.stock_route_warehouse
WHERE NOT EXISTS (SELECT 1 FROM stock_route_warehouse WHERE route_id=migrate.stock_route_warehouse.route_id AND warehouse_id=migrate.stock_route_warehouse.warehouse_id);
ALTER TABLE stock_route_warehouse ENABLE TRIGGER ALL;

ALTER TABLE stock_move_move_rel DISABLE TRIGGER ALL;
INSERT INTO stock_move_move_rel ( move_orig_id, move_dest_id )
SELECT move_orig_id, move_dest_id FROM migrate.stock_move_move_rel
WHERE NOT EXISTS (SELECT 1 FROM stock_move_move_rel WHERE move_orig_id=migrate.stock_move_move_rel.move_orig_id AND move_dest_id=migrate.stock_move_move_rel.move_dest_id);
ALTER TABLE stock_move_move_rel ENABLE TRIGGER ALL;

ALTER TABLE stock_location_route_move DISABLE TRIGGER ALL;
INSERT INTO stock_location_route_move ( move_id, route_id )
SELECT move_id, route_id FROM migrate.stock_location_route_move
WHERE NOT EXISTS (SELECT 1 FROM stock_location_route_move WHERE move_id=migrate.stock_location_route_move.move_id AND route_id=migrate.stock_location_route_move.route_id);
ALTER TABLE stock_location_route_move ENABLE TRIGGER ALL;

--ALTER TABLE ir_cron DISABLE TRIGGER ALL;
--INSERT INTO ir_cron ( id, ir_actions_server_id, cron_name, user_id, active, interval_number, interval_type, numbercall, doall, nextcall, priority, create_uid, create_date, write_uid, write_date )
--SELECT id, ir_actions_server_id, cron_name, user_id, active, interval_number, interval_type, numbercall, doall, nextcall, priority, create_uid, create_date, write_uid, write_date FROM migrate.ir_cron
--WHERE NOT EXISTS (SELECT 1 FROM ir_cron WHERE id=migrate.ir_cron.id);
--SELECT pg_catalog.setval('ir_cron_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_cron) x;
--ALTER TABLE ir_cron ENABLE TRIGGER ALL;

--ALTER TABLE ir_filters DISABLE TRIGGER ALL;
--INSERT INTO ir_filters ( id, name, user_id, domain, context, sort, model_id, is_default, action_id, active, create_uid, create_date, write_uid, write_date )
--SELECT id, name, user_id, domain, context, sort, model_id, is_default, action_id, active, create_uid, create_date, write_uid, write_date FROM migrate.ir_filters
--WHERE NOT EXISTS (SELECT 1 FROM ir_filters WHERE id=migrate.ir_filters.id);
--SELECT pg_catalog.setval('ir_filters_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_filters) x;
--ALTER TABLE ir_filters ENABLE TRIGGER ALL;

--ALTER TABLE ir_default DISABLE TRIGGER ALL;
--INSERT INTO ir_default ( id, field_id, user_id, company_id, condition, json_value, create_uid, create_date, write_uid, write_date )
--SELECT id, field_id, user_id, company_id, condition, json_value, create_uid, create_date, write_uid, write_date FROM migrate.ir_default
--WHERE NOT EXISTS (SELECT 1 FROM ir_default WHERE id=migrate.ir_default.id);
--SELECT pg_catalog.setval('ir_default_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_default) x;
--ALTER TABLE ir_default ENABLE TRIGGER ALL;
--
--ALTER TABLE ir_exports DISABLE TRIGGER ALL;
--INSERT INTO ir_exports ( id, name, resource, create_uid, create_date, write_uid, write_date )
--SELECT id, name, resource, create_uid, create_date, write_uid, write_date FROM migrate.ir_exports
--WHERE NOT EXISTS (SELECT 1 FROM ir_exports WHERE id=migrate.ir_exports.id);
--SELECT pg_catalog.setval('ir_exports_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_exports) x;
--ALTER TABLE ir_exports ENABLE TRIGGER ALL;

--ALTER TABLE ir_exports_line DISABLE TRIGGER ALL;
--INSERT INTO ir_exports_line ( id, name, export_id, create_uid, create_date, write_uid, write_date )
--SELECT id, name, export_id, create_uid, create_date, write_uid, write_date FROM migrate.ir_exports_line
--WHERE NOT EXISTS (SELECT 1 FROM ir_exports_line WHERE id=migrate.ir_exports_line.id);
--SELECT pg_catalog.setval('ir_exports_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_exports_line) x;
--ALTER TABLE ir_exports_line ENABLE TRIGGER ALL;

ALTER TABLE rule_group_rel DISABLE TRIGGER ALL;
INSERT INTO rule_group_rel ( rule_group_id, group_id )
SELECT rule_group_id, group_id FROM migrate.rule_group_rel
WHERE NOT EXISTS (SELECT 1 FROM rule_group_rel WHERE rule_group_id=migrate.rule_group_rel.rule_group_id AND group_id=migrate.rule_group_rel.group_id);
ALTER TABLE rule_group_rel ENABLE TRIGGER ALL;

ALTER TABLE stock_move_line DISABLE TRIGGER ALL;
INSERT INTO stock_move_line ( id, company_id, picking_id, move_id, product_id, product_uom_id, product_qty, product_uom_qty, qty_done, package_id, package_level_id, lot_id, lot_name, result_package_id, date, owner_id, location_id, location_dest_id, state, reference, create_uid, create_date, write_uid, write_date )
SELECT id, 1, picking_id, move_id, product_id, product_uom_id, product_qty, product_uom_qty, qty_done, package_id, package_level_id, lot_id, lot_name, result_package_id, date, owner_id, location_id, location_dest_id, state, reference, create_uid, create_date, write_uid, write_date FROM migrate.stock_move_line
WHERE NOT EXISTS (SELECT 1 FROM stock_move_line WHERE id=migrate.stock_move_line.id);
SELECT pg_catalog.setval('stock_move_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_move_line) x;
ALTER TABLE stock_move_line ENABLE TRIGGER ALL;

ALTER TABLE ir_rule DISABLE TRIGGER ALL;
INSERT INTO ir_rule ( id, name, active, model_id, domain_force, perm_read, perm_write, perm_create, perm_unlink, global, create_uid, create_date, write_uid, write_date )
SELECT id, name, active, model_id, domain_force, perm_read, perm_write, perm_create, perm_unlink, global, create_uid, create_date, write_uid, write_date FROM migrate.ir_rule
WHERE NOT EXISTS (SELECT 1 FROM ir_rule WHERE id=migrate.ir_rule.id);
SELECT pg_catalog.setval('ir_rule_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_rule) x;
ALTER TABLE ir_rule ENABLE TRIGGER ALL;

--ALTER TABLE ir_config_parameter DISABLE TRIGGER ALL;
--INSERT INTO ir_config_parameter ( id, key, value, create_uid, create_date, write_uid, write_date )
--SELECT id, key, value, create_uid, create_date, write_uid, write_date FROM migrate.ir_config_parameter
--WHERE NOT EXISTS (SELECT 1 FROM ir_config_parameter WHERE id=migrate.ir_config_parameter.id);
--SELECT pg_catalog.setval('ir_config_parameter_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_config_parameter) x;
--ALTER TABLE ir_config_parameter ENABLE TRIGGER ALL;

--ALTER TABLE ir_property DISABLE TRIGGER ALL;
--INSERT INTO ir_property ( id, name, res_id, company_id, fields_id, value_float, value_integer, value_text, value_binary, value_reference, value_datetime, type, create_uid, create_date, write_uid, write_date )
--SELECT id, name, res_id, company_id, fields_id, value_float, value_integer, value_text, value_binary, value_reference, value_datetime, type, create_uid, create_date, write_uid, write_date FROM migrate.ir_property
--WHERE NOT EXISTS (SELECT 1 FROM ir_property WHERE id=migrate.ir_property.id);
--SELECT pg_catalog.setval('ir_property_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_property) x;
--ALTER TABLE ir_property ENABLE TRIGGER ALL;

--ALTER TABLE report_layout DISABLE TRIGGER ALL;
--INSERT INTO report_layout ( id, view_id, image, pdf, create_uid, create_date, write_uid, write_date )
--SELECT id, view_id, image, pdf, create_uid, create_date, write_uid, write_date FROM migrate.report_layout
--WHERE NOT EXISTS (SELECT 1 FROM report_layout WHERE id=migrate.report_layout.id);
--SELECT pg_catalog.setval('report_layout_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM report_layout) x;
--ALTER TABLE report_layout ENABLE TRIGGER ALL;
--
--ALTER TABLE ir_sequence DISABLE TRIGGER ALL;
--INSERT INTO ir_sequence ( id, name, code, implementation, active, prefix, suffix, number_next, number_increment, padding, company_id, use_date_range, create_uid, create_date, write_uid, write_date )
--SELECT id, name, code, implementation, active, prefix, suffix, number_next, number_increment, padding, company_id, use_date_range, create_uid, create_date, write_uid, write_date FROM migrate.ir_sequence
--WHERE NOT EXISTS (SELECT 1 FROM ir_sequence WHERE id=migrate.ir_sequence.id);
--SELECT pg_catalog.setval('ir_sequence_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_sequence) x;
--ALTER TABLE ir_sequence ENABLE TRIGGER ALL;

ALTER TABLE res_country_group DISABLE TRIGGER ALL;
INSERT INTO res_country_group ( id, name, create_uid, create_date, write_uid, write_date )
SELECT id, name, create_uid, create_date, write_uid, write_date FROM migrate.res_country_group
WHERE NOT EXISTS (SELECT 1 FROM res_country_group WHERE id=migrate.res_country_group.id);
SELECT pg_catalog.setval('res_country_group_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_country_group) x;
ALTER TABLE res_country_group ENABLE TRIGGER ALL;

ALTER TABLE procurement_group DISABLE TRIGGER ALL;
INSERT INTO procurement_group ( id, partner_id, name, move_type, create_uid, create_date, write_uid, write_date, sale_id )
SELECT id, partner_id, name, move_type, create_uid, create_date, write_uid, write_date, sale_id FROM migrate.procurement_group
WHERE NOT EXISTS (SELECT 1 FROM procurement_group WHERE id=migrate.procurement_group.id);
SELECT pg_catalog.setval('procurement_group_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM procurement_group) x;
ALTER TABLE procurement_group ENABLE TRIGGER ALL;

ALTER TABLE res_country_res_country_group_rel DISABLE TRIGGER ALL;
INSERT INTO res_country_res_country_group_rel ( res_country_id, res_country_group_id )
SELECT res_country_id, res_country_group_id FROM migrate.res_country_res_country_group_rel
WHERE NOT EXISTS (SELECT 1 FROM res_country_res_country_group_rel WHERE res_country_id=migrate.res_country_res_country_group_rel.res_country_id AND res_country_group_id=migrate.res_country_res_country_group_rel.res_country_group_id);
ALTER TABLE res_country_res_country_group_rel ENABLE TRIGGER ALL;

ALTER TABLE res_partner_title DISABLE TRIGGER ALL;
INSERT INTO res_partner_title ( id, name, shortcut, create_uid, create_date, write_uid, write_date )
SELECT id, name, shortcut, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_title
WHERE NOT EXISTS (SELECT 1 FROM res_partner_title WHERE id=migrate.res_partner_title.id);
SELECT pg_catalog.setval('res_partner_title_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_title) x;
ALTER TABLE res_partner_title ENABLE TRIGGER ALL;

--ALTER TABLE res_lang DISABLE TRIGGER ALL;
--INSERT INTO res_lang ( id, name, code, iso_code, active, direction, date_format, time_format, week_start, grouping, decimal_point, thousands_sep, create_uid, create_date, write_uid, write_date )
--SELECT id, name, code, iso_code, active, direction, date_format, time_format, week_start, grouping, decimal_point, thousands_sep, create_uid, create_date, write_uid, write_date FROM migrate.res_lang
--WHERE NOT EXISTS (SELECT 1 FROM res_lang WHERE id=migrate.res_lang.id);
--SELECT pg_catalog.setval('res_lang_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_lang) x;
--ALTER TABLE res_lang ENABLE TRIGGER ALL;

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

ALTER TABLE stock_quant DISABLE TRIGGER ALL;
INSERT INTO stock_quant ( id, product_id, company_id, location_id, lot_id, package_id, owner_id, quantity, reserved_quantity, in_date, create_uid, create_date, write_uid, write_date )
SELECT id, product_id, company_id, location_id, lot_id, package_id, owner_id, quantity, reserved_quantity, in_date, create_uid, create_date, write_uid, write_date FROM migrate.stock_quant
WHERE NOT EXISTS (SELECT 1 FROM stock_quant WHERE id=migrate.stock_quant.id);
SELECT pg_catalog.setval('stock_quant_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_quant) x;
ALTER TABLE stock_quant ENABLE TRIGGER ALL;

--ALTER TABLE res_country_state DISABLE TRIGGER ALL;
--INSERT INTO res_country_state ( id, country_id, name, code, create_uid, create_date, write_uid, write_date )
--SELECT id, country_id, name, code, create_uid, create_date, write_uid, write_date FROM migrate.res_country_state
--WHERE NOT EXISTS (SELECT 1 FROM res_country_state WHERE code=migrate.res_country_state.code);
--SELECT pg_catalog.setval('res_country_state_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_country_state) x;
--ALTER TABLE res_country_state ENABLE TRIGGER ALL;

ALTER TABLE res_partner_industry DISABLE TRIGGER ALL;
INSERT INTO res_partner_industry ( id, name, full_name, active, create_uid, create_date, write_uid, write_date )
SELECT id, name, full_name, active, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_industry
WHERE NOT EXISTS (SELECT 1 FROM res_partner_industry WHERE id=migrate.res_partner_industry.id);
SELECT pg_catalog.setval('res_partner_industry_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_industry) x;
ALTER TABLE res_partner_industry ENABLE TRIGGER ALL;

--ALTER TABLE res_country DISABLE TRIGGER ALL;
--INSERT INTO res_country ( id, name, code, address_format, address_view_id, currency_id, phone_code, name_position, vat_label, create_uid, create_date, write_uid, write_date )
--SELECT id, name, code, address_format, address_view_id, currency_id, phone_code, name_position, vat_label, create_uid, create_date, write_uid, write_date FROM migrate.res_country
--WHERE NOT EXISTS (SELECT 1 FROM res_country WHERE code=migrate.res_country.code);
--SELECT pg_catalog.setval('res_country_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_country) x;
--ALTER TABLE res_country ENABLE TRIGGER ALL;

ALTER TABLE res_bank DISABLE TRIGGER ALL;
INSERT INTO res_bank ( id, name, street, street2, zip, city, state, country, email, phone, active, bic, create_uid, create_date, write_uid, write_date )
SELECT id, name, street, street2, zip, city, state, country, email, phone, active, bic, create_uid, create_date, write_uid, write_date FROM migrate.res_bank
WHERE NOT EXISTS (SELECT 1 FROM res_bank WHERE id=migrate.res_bank.id);
SELECT pg_catalog.setval('res_bank_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_bank) x;
ALTER TABLE res_bank ENABLE TRIGGER ALL;

ALTER TABLE stock_picking_type DISABLE TRIGGER ALL;
INSERT INTO stock_picking_type ( id, name, color, sequence, sequence_id,sequence_code,company_id, default_location_src_id, default_location_dest_id, code, return_picking_type_id, show_entire_packs, warehouse_id, active, use_create_lots, use_existing_lots, show_operations, show_reserved, barcode, create_uid, create_date, write_uid, write_date )
SELECT id, name, color, sequence, sequence_id,'OUT',1, default_location_src_id, default_location_dest_id, code, return_picking_type_id, show_entire_packs, warehouse_id, active, use_create_lots, use_existing_lots, show_operations, show_reserved, barcode, create_uid, create_date, write_uid, write_date FROM migrate.stock_picking_type
WHERE NOT EXISTS (SELECT 1 FROM stock_picking_type WHERE id=migrate.stock_picking_type.id);
SELECT pg_catalog.setval('stock_picking_type_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_picking_type) x;
ALTER TABLE stock_picking_type ENABLE TRIGGER ALL;

ALTER TABLE stock_rule DISABLE TRIGGER ALL;
INSERT INTO stock_rule ( id, name, active, group_propagation_option, group_id, action, sequence, company_id, location_id, location_src_id, route_id, procure_method, route_sequence, picking_type_id, delay, partner_address_id, warehouse_id, propagate_warehouse_id, auto, create_uid, create_date, write_uid, write_date )
SELECT id, name, active, group_propagation_option, group_id, action, sequence, company_id, location_id, location_src_id, route_id, procure_method, route_sequence, picking_type_id, delay, partner_address_id, warehouse_id, propagate_warehouse_id, auto, create_uid, create_date, write_uid, write_date FROM migrate.stock_rule
WHERE NOT EXISTS (SELECT 1 FROM stock_rule WHERE id=migrate.stock_rule.id);
SELECT pg_catalog.setval('stock_rule_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_rule) x;
ALTER TABLE stock_rule ENABLE TRIGGER ALL;

ALTER TABLE res_partner_bank DISABLE TRIGGER ALL;
INSERT INTO res_partner_bank ( id, acc_number, sanitized_acc_number, acc_holder_name, partner_id, bank_id, sequence, currency_id, company_id, create_uid, create_date, write_uid, write_date )
SELECT id, acc_number, sanitized_acc_number, acc_holder_name, partner_id, bank_id, sequence, currency_id, company_id, create_uid, create_date, write_uid, write_date FROM migrate.res_partner_bank
WHERE NOT EXISTS (SELECT 1 FROM res_partner_bank WHERE id=migrate.res_partner_bank.id);
SELECT pg_catalog.setval('res_partner_bank_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner_bank) x;
ALTER TABLE res_partner_bank ENABLE TRIGGER ALL;

--ALTER TABLE ir_attachment DISABLE TRIGGER ALL;
--INSERT INTO ir_attachment ( id, name, description, res_model, res_field, res_id, company_id, type, url, public, access_token, db_datas, store_fname, file_size, checksum, mimetype, index_content, create_uid, create_date, write_uid, write_date, website_id, key, theme_template_id )
--SELECT id, name, description, res_model, res_field, res_id, company_id, type, url, public, access_token, db_datas, store_fname, file_size, checksum, mimetype, index_content, create_uid, create_date, write_uid, write_date, website_id, key, theme_template_id FROM migrate.ir_attachment
--WHERE NOT EXISTS (SELECT 1 FROM ir_attachment WHERE id=migrate.ir_attachment.id);
--SELECT pg_catalog.setval('ir_attachment_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_attachment) x;
--ALTER TABLE ir_attachment ENABLE TRIGGER ALL;

ALTER TABLE stock_production_lot DISABLE TRIGGER ALL;
INSERT INTO stock_production_lot ( id, company_id, message_main_attachment_id, name, ref, product_id, product_uom_id, create_uid, create_date, write_uid, write_date )
SELECT id, 1, message_main_attachment_id, name, ref, product_id, product_uom_id, create_uid, create_date, write_uid, write_date FROM migrate.stock_production_lot
WHERE NOT EXISTS (SELECT 1 FROM stock_production_lot WHERE id=migrate.stock_production_lot.id);
SELECT pg_catalog.setval('stock_production_lot_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_production_lot) x;
ALTER TABLE stock_production_lot ENABLE TRIGGER ALL;

ALTER TABLE res_company_users_rel DISABLE TRIGGER ALL;
INSERT INTO res_company_users_rel ( cid, user_id )
SELECT cid, user_id FROM migrate.res_company_users_rel
WHERE NOT EXISTS (SELECT 1 FROM res_company_users_rel WHERE cid=migrate.res_company_users_rel.cid AND user_id=migrate.res_company_users_rel.user_id);
ALTER TABLE res_company_users_rel ENABLE TRIGGER ALL;

--ALTER TABLE report_paperformat DISABLE TRIGGER ALL;
--INSERT INTO report_paperformat ( id, name, format, margin_top, margin_bottom, margin_left, margin_right, page_height, page_width, orientation, header_line, header_spacing, dpi, create_uid, create_date, write_uid, write_date )
--SELECT id, name, format, margin_top, margin_bottom, margin_left, margin_right, page_height, page_width, orientation, header_line, header_spacing, dpi, create_uid, create_date, write_uid, write_date FROM migrate.report_paperformat
--WHERE NOT EXISTS (SELECT 1 FROM report_paperformat WHERE id=migrate.report_paperformat.id);
--SELECT pg_catalog.setval('report_paperformat_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM report_paperformat) x;
--ALTER TABLE report_paperformat ENABLE TRIGGER ALL;

ALTER TABLE product_removal DISABLE TRIGGER ALL;
INSERT INTO product_removal ( id, name, method, create_uid, create_date, write_uid, write_date )
SELECT id, name, method, create_uid, create_date, write_uid, write_date FROM migrate.product_removal
WHERE NOT EXISTS (SELECT 1 FROM product_removal WHERE id=migrate.product_removal.id);
SELECT pg_catalog.setval('product_removal_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_removal) x;
ALTER TABLE product_removal ENABLE TRIGGER ALL;

INSERT INTO public.res_groups_users_rel(uid, gid)
SELECT DISTINCT pu.id, pg.id FROM public.res_groups pg
INNER JOIN migrate.res_groups mg ON pg.name = mg.name and COALESCE(pg.comment, '') = COALESCE(mg.comment, '')
INNER JOIN public.res_users pu ON TRUE
INNER JOIN migrate.res_users mu ON pu.login = mu.login
INNER JOIN migrate.res_groups_users_rel mgu ON mg.id = mgu.gid AND mu.id = mgu.uid
WHERE NOT EXISTS (SELECT 1 FROM public.res_groups_users_rel e WHERE e.uid = pu.id AND e.gid = pg.id);

--ALTER TABLE ir_ui_view DISABLE TRIGGER ALL;
--INSERT INTO ir_ui_view ( id, name, model, key, priority, type, arch_db, arch_fs, inherit_id, field_parent, mode, active, create_uid, create_date, write_uid, write_date, customize_show, website_meta_title, website_meta_description, website_meta_keywords, website_meta_og_img, website_id, theme_template_id )
--SELECT id, name, model, key, priority, type, arch_db, arch_fs, inherit_id, field_parent, mode, active, create_uid, create_date, write_uid, write_date, customize_show, website_meta_title, website_meta_description, website_meta_keywords, website_meta_og_img, website_id, theme_template_id FROM migrate.ir_ui_view
--WHERE NOT EXISTS (SELECT 1 FROM ir_ui_view WHERE id=migrate.ir_ui_view.id);
--SELECT pg_catalog.setval('ir_ui_view_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM ir_ui_view) x;
--ALTER TABLE ir_ui_view ENABLE TRIGGER ALL;

ALTER TABLE res_groups_implied_rel DISABLE TRIGGER ALL;
INSERT INTO res_groups_implied_rel ( gid, hid )
SELECT gid, hid FROM migrate.res_groups_implied_rel
WHERE NOT EXISTS (SELECT 1 FROM res_groups_implied_rel WHERE gid=migrate.res_groups_implied_rel.gid AND hid=migrate.res_groups_implied_rel.hid);
ALTER TABLE res_groups_implied_rel ENABLE TRIGGER ALL;

ALTER TABLE res_groups DISABLE TRIGGER ALL;
INSERT INTO res_groups ( id, name, comment, category_id, color, share, create_uid, create_date, write_uid, write_date )
SELECT id, name, comment, category_id, color, share, create_uid, create_date, write_uid, write_date FROM migrate.res_groups
WHERE NOT EXISTS (SELECT 1 FROM res_groups WHERE id=migrate.res_groups.id);
SELECT pg_catalog.setval('res_groups_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_groups) x;
ALTER TABLE res_groups ENABLE TRIGGER ALL;

ALTER TABLE stock_move DISABLE TRIGGER ALL;
INSERT INTO stock_move ( id, name, sequence, priority, create_date, date, company_id, product_id, product_qty, product_uom_qty, product_uom, location_id, location_dest_id, partner_id, picking_id, note, state, price_unit, origin, procure_method, scrapped, group_id, rule_id, picking_type_id, inventory_id, origin_returned_move_id, restrict_partner_id, warehouse_id, additional, reference, package_level_id, create_uid, write_uid, write_date, to_refund, purchase_line_id, created_purchase_line_id, sale_line_id )
SELECT id, name, sequence, priority, create_date, date, company_id, product_id, product_qty, product_uom_qty, product_uom, location_id, location_dest_id, partner_id, picking_id, note, state, price_unit, origin, procure_method, scrapped, group_id, rule_id, picking_type_id, inventory_id, origin_returned_move_id, restrict_partner_id, warehouse_id, additional, reference, package_level_id, create_uid, write_uid, write_date, to_refund, purchase_line_id, created_purchase_line_id, sale_line_id FROM migrate.stock_move
WHERE NOT EXISTS (SELECT 1 FROM stock_move WHERE id=migrate.stock_move.id);
SELECT pg_catalog.setval('stock_move_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_move) x;
ALTER TABLE stock_move ENABLE TRIGGER ALL;

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

ALTER TABLE uom_category DISABLE TRIGGER ALL;
INSERT INTO uom_category ( id, name, create_uid, create_date, write_uid, write_date )
SELECT id, name, create_uid, create_date, write_uid, write_date FROM migrate.uom_category
WHERE NOT EXISTS (SELECT 1 FROM uom_category WHERE id=migrate.uom_category.id);
SELECT pg_catalog.setval('uom_category_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM uom_category) x;
ALTER TABLE uom_category ENABLE TRIGGER ALL;

ALTER TABLE barcode_rule DISABLE TRIGGER ALL;
INSERT INTO barcode_rule ( id, name, barcode_nomenclature_id, sequence, encoding, type, pattern, alias, create_uid, create_date, write_uid, write_date )
SELECT id, name, barcode_nomenclature_id, sequence, encoding, type, pattern, alias, create_uid, create_date, write_uid, write_date FROM migrate.barcode_rule
WHERE NOT EXISTS (SELECT 1 FROM barcode_rule WHERE id=migrate.barcode_rule.id);
SELECT pg_catalog.setval('barcode_rule_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM barcode_rule) x;
ALTER TABLE barcode_rule ENABLE TRIGGER ALL;

ALTER TABLE barcode_nomenclature DISABLE TRIGGER ALL;
INSERT INTO barcode_nomenclature ( id, name, upc_ean_conv, create_uid, create_date, write_uid, write_date )
SELECT id, name, upc_ean_conv, create_uid, create_date, write_uid, write_date FROM migrate.barcode_nomenclature
WHERE NOT EXISTS (SELECT 1 FROM barcode_nomenclature WHERE id=migrate.barcode_nomenclature.id);
SELECT pg_catalog.setval('barcode_nomenclature_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM barcode_nomenclature) x;
ALTER TABLE barcode_nomenclature ENABLE TRIGGER ALL;

--ALTER TABLE base_import_mapping DISABLE TRIGGER ALL;
--INSERT INTO base_import_mapping ( id, res_model, column_name, field_name, create_uid, create_date, write_uid, write_date )
--SELECT id, res_model, column_name, field_name, create_uid, create_date, write_uid, write_date FROM migrate.base_import_mapping
--WHERE NOT EXISTS (SELECT 1 FROM base_import_mapping WHERE id=migrate.base_import_mapping.id);
--SELECT pg_catalog.setval('base_import_mapping_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM base_import_mapping) x;
--ALTER TABLE base_import_mapping ENABLE TRIGGER ALL;

ALTER TABLE stock_scrap DISABLE TRIGGER ALL;
INSERT INTO stock_scrap ( id, company_id, name, origin, product_id, product_uom_id, lot_id, package_id, owner_id, move_id, picking_id, location_id, scrap_location_id, scrap_qty, state, create_uid, create_date, write_uid, write_date )
SELECT id, 1, name, origin, product_id, product_uom_id, lot_id, package_id, owner_id, move_id, picking_id, location_id, scrap_location_id, scrap_qty, state, create_uid, create_date, write_uid, write_date FROM migrate.stock_scrap
WHERE NOT EXISTS (SELECT 1 FROM stock_scrap WHERE id=migrate.stock_scrap.id);
SELECT pg_catalog.setval('stock_scrap_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_scrap) x;
ALTER TABLE stock_scrap ENABLE TRIGGER ALL;

ALTER TABLE uom_uom DISABLE TRIGGER ALL;
INSERT INTO uom_uom ( id, name, category_id, factor, rounding, active, uom_type, create_uid, create_date, write_uid, write_date )
SELECT id, name, category_id, factor, rounding, active, uom_type, create_uid, create_date, write_uid, write_date FROM migrate.uom_uom
WHERE NOT EXISTS (SELECT 1 FROM uom_uom WHERE id=migrate.uom_uom.id);
SELECT pg_catalog.setval('uom_uom_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM uom_uom) x;
ALTER TABLE uom_uom ENABLE TRIGGER ALL;

ALTER TABLE product_template DISABLE TRIGGER ALL;
INSERT INTO product_template ( id, message_main_attachment_id, name, sequence, description, description_purchase, description_sale, type, categ_id, list_price, volume, weight, sale_ok, purchase_ok, uom_id, uom_po_id, company_id, active, color, default_code, create_uid, create_date, write_uid, write_date, sale_delay, tracking, description_picking, description_pickingout, description_pickingin, purchase_method, purchase_line_warn, purchase_line_warn_msg, service_type, sale_line_warn, sale_line_warn_msg, expense_policy, invoice_policy, service_to_purchase )
SELECT id, message_main_attachment_id, name, sequence, description, description_purchase, description_sale, type, categ_id, list_price, volume, weight, sale_ok, purchase_ok, uom_id, uom_po_id, company_id, active, color, default_code, create_uid, create_date, write_uid, write_date, sale_delay, tracking, description_picking, description_pickingout, description_pickingin, purchase_method, purchase_line_warn, purchase_line_warn_msg, service_type, sale_line_warn, sale_line_warn_msg, expense_policy, invoice_policy, service_to_purchase FROM migrate.product_template
WHERE NOT EXISTS (SELECT 1 FROM product_template WHERE id=migrate.product_template.id);
SELECT pg_catalog.setval('product_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_template) x;
ALTER TABLE product_template ENABLE TRIGGER ALL;

ALTER TABLE stock_warehouse DISABLE TRIGGER ALL;
INSERT INTO stock_warehouse ( id, name, active, company_id, partner_id, view_location_id, lot_stock_id, code, reception_steps, delivery_steps, wh_input_stock_loc_id, wh_qc_stock_loc_id, wh_output_stock_loc_id, wh_pack_stock_loc_id, mto_pull_id, pick_type_id, pack_type_id, out_type_id, in_type_id, int_type_id, crossdock_route_id, reception_route_id, delivery_route_id, create_uid, create_date, write_uid, write_date, buy_to_resupply, buy_pull_id )
SELECT id, name, active, company_id, partner_id, view_location_id, lot_stock_id, code, reception_steps, delivery_steps, wh_input_stock_loc_id, wh_qc_stock_loc_id, wh_output_stock_loc_id, wh_pack_stock_loc_id, mto_pull_id, pick_type_id, pack_type_id, out_type_id, in_type_id, int_type_id, crossdock_route_id, reception_route_id, delivery_route_id, create_uid, create_date, write_uid, write_date, buy_to_resupply, buy_pull_id FROM migrate.stock_warehouse
WHERE NOT EXISTS (SELECT 1 FROM stock_warehouse WHERE id=migrate.stock_warehouse.id);
SELECT pg_catalog.setval('stock_warehouse_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_warehouse) x;
ALTER TABLE stock_warehouse ENABLE TRIGGER ALL;

ALTER TABLE stock_inventory DISABLE TRIGGER ALL;
INSERT INTO stock_inventory ( id, name, date, state, company_id, exhausted, create_uid, create_date, write_uid, write_date, accounting_date )
SELECT id, name, date, state, company_id, exhausted, create_uid, create_date, write_uid, write_date, accounting_date FROM migrate.stock_inventory
WHERE NOT EXISTS (SELECT 1 FROM stock_inventory WHERE id=migrate.stock_inventory.id);
SELECT pg_catalog.setval('stock_inventory_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_inventory) x;
ALTER TABLE stock_inventory ENABLE TRIGGER ALL;

ALTER TABLE product_product DISABLE TRIGGER ALL;
INSERT INTO product_product ( id, message_main_attachment_id, default_code, active, product_tmpl_id, barcode, volume, weight, create_uid, create_date, write_uid, write_date )
SELECT id, message_main_attachment_id, default_code, active, product_tmpl_id, barcode, volume, weight, create_uid, create_date, write_uid, write_date FROM migrate.product_product
WHERE NOT EXISTS (SELECT 1 FROM product_product WHERE id=migrate.product_product.id);
SELECT pg_catalog.setval('product_product_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_product) x;
ALTER TABLE product_product ENABLE TRIGGER ALL;

ALTER TABLE res_company DISABLE TRIGGER ALL;
INSERT INTO res_company ( id, name, partner_id, currency_id, sequence, create_date, parent_id, report_header, report_footer, logo_web, email, phone, company_registry, paperformat_id, external_report_layout_id, base_onboarding_company_state, create_uid, write_uid, write_date, social_twitter, social_facebook, social_github, social_linkedin, social_youtube, social_instagram, nomenclature_id, resource_calendar_id, snailmail_color, snailmail_duplex, fiscalyear_last_day, fiscalyear_last_month, period_lock_date, fiscalyear_lock_date, transfer_account_id, expects_chart_of_accounts, chart_template_id, bank_account_code_prefix, cash_account_code_prefix, transfer_account_code_prefix, account_sale_tax_id, account_purchase_tax_id, tax_calculation_rounding_method, currency_exchange_journal_id, anglo_saxon_accounting, property_stock_account_input_categ_id, property_stock_account_output_categ_id, property_stock_valuation_account_id, tax_exigibility, incoterm_id, qr_code, invoice_is_email, invoice_is_print, account_opening_move_id, account_setup_bank_data_state, account_setup_fy_data_state, account_setup_coa_state, account_onboarding_invoice_layout_state, account_onboarding_sale_tax_state, account_invoice_onboarding_state, account_dashboard_onboarding_state, tax_cash_basis_journal_id, internal_transit_location_id, extract_show_ocr_option_selection, currency_interval_unit, currency_next_execution_date, currency_provider, payment_acquirer_onboarding_state, payment_onboarding_payment_method, po_lead, po_lock, po_double_validation, po_double_validation_amount, invoice_is_snailmail, totals_below_sections, yodlee_access_token, yodlee_user_login, yodlee_user_password, yodlee_user_access_token, portal_confirmation_sign, portal_confirmation_pay, quotation_validity_days, sale_quotation_onboarding_state, sale_onboarding_order_confirmation_state, sale_onboarding_sample_quotation_state, sale_onboarding_payment_method, security_lead )
SELECT id, name, partner_id, currency_id, sequence, create_date, parent_id, report_header, report_footer, logo_web, email, phone, company_registry, paperformat_id, external_report_layout_id, base_onboarding_company_state, create_uid, write_uid, write_date, social_twitter, social_facebook, social_github, social_linkedin, social_youtube, social_instagram, nomenclature_id, resource_calendar_id, snailmail_color, snailmail_duplex, fiscalyear_last_day, fiscalyear_last_month, period_lock_date, fiscalyear_lock_date, transfer_account_id, expects_chart_of_accounts, chart_template_id, bank_account_code_prefix, cash_account_code_prefix, transfer_account_code_prefix, account_sale_tax_id, account_purchase_tax_id, tax_calculation_rounding_method, currency_exchange_journal_id, anglo_saxon_accounting, property_stock_account_input_categ_id, property_stock_account_output_categ_id, property_stock_valuation_account_id, tax_exigibility, incoterm_id, qr_code, invoice_is_email, invoice_is_print, account_opening_move_id, account_setup_bank_data_state, account_setup_fy_data_state, account_setup_coa_state, account_onboarding_invoice_layout_state, account_onboarding_sale_tax_state, account_invoice_onboarding_state, account_dashboard_onboarding_state, tax_cash_basis_journal_id, internal_transit_location_id, extract_show_ocr_option_selection, currency_interval_unit, currency_next_execution_date, currency_provider, payment_acquirer_onboarding_state, payment_onboarding_payment_method, po_lead, po_lock, po_double_validation, po_double_validation_amount, invoice_is_snailmail, totals_below_sections, yodlee_access_token, yodlee_user_login, yodlee_user_password, yodlee_user_access_token, portal_confirmation_sign, portal_confirmation_pay, quotation_validity_days, sale_quotation_onboarding_state, sale_onboarding_order_confirmation_state, sale_onboarding_sample_quotation_state, sale_onboarding_payment_method, security_lead FROM migrate.res_company
WHERE NOT EXISTS (SELECT 1 FROM res_company WHERE id=migrate.res_company.id);
SELECT pg_catalog.setval('res_company_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_company) x;
ALTER TABLE res_company ENABLE TRIGGER ALL;

ALTER TABLE stock_location_route DISABLE TRIGGER ALL;
INSERT INTO stock_location_route ( id, name, active, sequence, product_selectable, product_categ_selectable, warehouse_selectable, supplied_wh_id, supplier_wh_id, company_id, create_uid, create_date, write_uid, write_date, sale_selectable )
SELECT id, name, active, sequence, product_selectable, product_categ_selectable, warehouse_selectable, supplied_wh_id, supplier_wh_id, company_id, create_uid, create_date, write_uid, write_date, sale_selectable FROM migrate.stock_location_route
WHERE NOT EXISTS (SELECT 1 FROM stock_location_route WHERE id=migrate.stock_location_route.id);
SELECT pg_catalog.setval('stock_location_route_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_location_route) x;
ALTER TABLE stock_location_route ENABLE TRIGGER ALL;

ALTER TABLE stock_picking DISABLE TRIGGER ALL;
INSERT INTO stock_picking ( id, message_main_attachment_id, name, origin, note, backorder_id, move_type, state, group_id, priority, scheduled_date, date, date_done, location_id, location_dest_id, picking_type_id, partner_id, company_id, owner_id, printed, is_locked, immediate_transfer, create_uid, create_date, write_uid, write_date, sale_id )
SELECT id, message_main_attachment_id, name, origin, note, backorder_id, move_type, state, group_id, priority, scheduled_date, date, date_done, location_id, location_dest_id, picking_type_id, partner_id, company_id, owner_id, printed, is_locked, immediate_transfer, create_uid, create_date, write_uid, write_date, sale_id FROM migrate.stock_picking
WHERE NOT EXISTS (SELECT 1 FROM stock_picking WHERE id=migrate.stock_picking.id);
SELECT pg_catalog.setval('stock_picking_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_picking) x;
ALTER TABLE stock_picking ENABLE TRIGGER ALL;

ALTER TABLE stock_location DISABLE TRIGGER ALL;
INSERT INTO stock_location ( id, name, complete_name, active, usage, location_id, comment, posx, posy, posz, parent_path, company_id, scrap_location, return_location, removal_strategy_id, barcode, create_uid, create_date, write_uid, write_date, valuation_in_account_id, valuation_out_account_id )
SELECT id, name, complete_name, active, usage, location_id, comment, posx, posy, posz, parent_path, company_id, scrap_location, return_location, removal_strategy_id, barcode, create_uid, create_date, write_uid, write_date, valuation_in_account_id, valuation_out_account_id FROM migrate.stock_location
WHERE NOT EXISTS (SELECT 1 FROM stock_location WHERE id=migrate.stock_location.id);
SELECT pg_catalog.setval('stock_location_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM stock_location) x;
ALTER TABLE stock_location ENABLE TRIGGER ALL;

--ALTER TABLE bus_presence DISABLE TRIGGER ALL;
--INSERT INTO bus_presence ( id, user_id, last_poll, last_presence, status )
--SELECT id, user_id, last_poll, last_presence, status FROM migrate.bus_presence
--WHERE NOT EXISTS (SELECT 1 FROM bus_presence WHERE id=migrate.bus_presence.id);
--SELECT pg_catalog.setval('bus_presence_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM bus_presence) x;
--ALTER TABLE bus_presence ENABLE TRIGGER ALL;

ALTER TABLE resource_calendar_attendance DISABLE TRIGGER ALL;
INSERT INTO resource_calendar_attendance ( id, name, dayofweek, date_from, date_to, hour_from, hour_to, calendar_id, day_period, create_uid, create_date, write_uid, write_date )
SELECT id, name, dayofweek, date_from, date_to, hour_from, hour_to, calendar_id, day_period, create_uid, create_date, write_uid, write_date FROM migrate.resource_calendar_attendance
WHERE NOT EXISTS (SELECT 1 FROM resource_calendar_attendance WHERE id=migrate.resource_calendar_attendance.id);
SELECT pg_catalog.setval('resource_calendar_attendance_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM resource_calendar_attendance) x;
ALTER TABLE resource_calendar_attendance ENABLE TRIGGER ALL;

ALTER TABLE resource_calendar DISABLE TRIGGER ALL;
INSERT INTO resource_calendar ( id, name, company_id, hours_per_day, tz, create_uid, create_date, write_uid, write_date )
SELECT id, name, company_id, hours_per_day, tz, create_uid, create_date, write_uid, write_date FROM migrate.resource_calendar
WHERE NOT EXISTS (SELECT 1 FROM resource_calendar WHERE id=migrate.resource_calendar.id);
SELECT pg_catalog.setval('resource_calendar_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM resource_calendar) x;
ALTER TABLE resource_calendar ENABLE TRIGGER ALL;

ALTER TABLE utm_medium DISABLE TRIGGER ALL;
INSERT INTO utm_medium ( id, name, active, create_uid, create_date, write_uid, write_date )
SELECT id, name, active, create_uid, create_date, write_uid, write_date FROM migrate.utm_medium
WHERE NOT EXISTS (SELECT 1 FROM utm_medium WHERE id=migrate.utm_medium.id);
SELECT pg_catalog.setval('utm_medium_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM utm_medium) x;
ALTER TABLE utm_medium ENABLE TRIGGER ALL;

--ALTER TABLE utm_campaign DISABLE TRIGGER ALL;
--INSERT INTO utm_campaign ( id, user_id, name, create_uid, create_date, write_uid, write_date )
--SELECT id, create_uid, name, create_uid, create_date, write_uid, write_date FROM migrate.utm_campaign
--WHERE NOT EXISTS (SELECT 1 FROM utm_campaign WHERE id=migrate.utm_campaign.id);
--SELECT pg_catalog.setval('utm_campaign_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM utm_campaign) x;
--ALTER TABLE utm_campaign ENABLE TRIGGER ALL;

ALTER TABLE utm_source DISABLE TRIGGER ALL;
INSERT INTO utm_source ( id, name, create_uid, create_date, write_uid, write_date )
SELECT id, name, create_uid, create_date, write_uid, write_date FROM migrate.utm_source
WHERE NOT EXISTS (SELECT 1 FROM utm_source WHERE id=migrate.utm_source.id);
SELECT pg_catalog.setval('utm_source_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM utm_source) x;
ALTER TABLE utm_source ENABLE TRIGGER ALL;

ALTER TABLE iap_account DISABLE TRIGGER ALL;
INSERT INTO iap_account ( id, service_name, account_token, create_uid, create_date, write_uid, write_date )
SELECT id, service_name, account_token, create_uid, create_date, write_uid, write_date FROM migrate.iap_account
WHERE NOT EXISTS (SELECT 1 FROM iap_account WHERE id=migrate.iap_account.id);
SELECT pg_catalog.setval('iap_account_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM iap_account) x;
ALTER TABLE iap_account ENABLE TRIGGER ALL;

--ALTER TABLE web_tour_tour DISABLE TRIGGER ALL;
--INSERT INTO web_tour_tour ( id, name, user_id )
--SELECT id, name, user_id FROM migrate.web_tour_tour
--WHERE NOT EXISTS (SELECT 1 FROM web_tour_tour WHERE id=migrate.web_tour_tour.id);
--SELECT pg_catalog.setval('web_tour_tour_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM web_tour_tour) x;
--ALTER TABLE web_tour_tour ENABLE TRIGGER ALL;

ALTER TABLE website_lang_rel DISABLE TRIGGER ALL;
INSERT INTO website_lang_rel ( website_id, lang_id )
SELECT website_id, lang_id FROM migrate.website_lang_rel
WHERE NOT EXISTS (SELECT 1 FROM website_lang_rel WHERE website_id=migrate.website_lang_rel.website_id AND lang_id=migrate.website_lang_rel.lang_id);
ALTER TABLE website_lang_rel ENABLE TRIGGER ALL;

ALTER TABLE website_menu DISABLE TRIGGER ALL;
INSERT INTO website_menu ( id, name, url, page_id, new_window, sequence, website_id, parent_id, parent_path, theme_template_id, create_uid, create_date, write_uid, write_date )
SELECT id, name, url, page_id, new_window, sequence, website_id, parent_id, parent_path, theme_template_id, create_uid, create_date, write_uid, write_date FROM migrate.website_menu
WHERE NOT EXISTS (SELECT 1 FROM website_menu WHERE id=migrate.website_menu.id);
SELECT pg_catalog.setval('website_menu_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM website_menu) x;
ALTER TABLE website_menu ENABLE TRIGGER ALL;

--ALTER TABLE mail_tracking_value DISABLE TRIGGER ALL;
--INSERT INTO mail_tracking_value ( id, "field", field_desc, field_type, old_value_integer, old_value_float, old_value_monetary, old_value_char, old_value_text, old_value_datetime, new_value_integer, new_value_float, new_value_monetary, new_value_char, new_value_text, new_value_datetime, mail_message_id, create_uid, create_date, write_uid, write_date )
--SELECT id, "field", field_desc, field_type, old_value_integer, old_value_float, old_value_monetary, old_value_char, old_value_text, old_value_datetime, new_value_integer, new_value_float, new_value_monetary, new_value_char, new_value_text, new_value_datetime, mail_message_id, create_uid, create_date, write_uid, write_date FROM migrate.mail_tracking_value
--WHERE NOT EXISTS (SELECT 1 FROM mail_tracking_value WHERE id=migrate.mail_tracking_value.id);
--SELECT pg_catalog.setval('mail_tracking_value_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_tracking_value) x;
--ALTER TABLE mail_tracking_value ENABLE TRIGGER ALL;

ALTER TABLE mail_followers DISABLE TRIGGER ALL;
INSERT INTO mail_followers ( id, res_model, res_id, partner_id, channel_id )
SELECT id, res_model, res_id, partner_id, channel_id FROM migrate.mail_followers
WHERE NOT EXISTS (SELECT 1 FROM mail_followers WHERE id=migrate.mail_followers.id);
SELECT pg_catalog.setval('mail_followers_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_followers) x;
ALTER TABLE mail_followers ENABLE TRIGGER ALL;

--ALTER TABLE message_attachment_rel DISABLE TRIGGER ALL;
--INSERT INTO message_attachment_rel ( message_id, attachment_id )
--SELECT message_id, attachment_id FROM migrate.message_attachment_rel
--WHERE NOT EXISTS (SELECT 1 FROM message_attachment_rel WHERE message_id=migrate.message_attachment_rel.message_id AND attachment_id=migrate.message_attachment_rel.attachment_id);
--ALTER TABLE message_attachment_rel ENABLE TRIGGER ALL;

--ALTER TABLE theme_ir_attachment DISABLE TRIGGER ALL;
--INSERT INTO theme_ir_attachment ( id, name, key, url, create_uid, create_date, write_uid, write_date )
--SELECT id, name, key, url, create_uid, create_date, write_uid, write_date FROM migrate.theme_ir_attachment
--WHERE NOT EXISTS (SELECT 1 FROM theme_ir_attachment WHERE id=migrate.theme_ir_attachment.id);
--SELECT pg_catalog.setval('theme_ir_attachment_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM theme_ir_attachment) x;
--ALTER TABLE theme_ir_attachment ENABLE TRIGGER ALL;

--ALTER TABLE theme_ir_ui_view DISABLE TRIGGER ALL;
--INSERT INTO theme_ir_ui_view ( id, name, key, type, priority, mode, active, arch, arch_fs, inherit_id, create_uid, create_date, write_uid, write_date )
--SELECT id, name, key, type, priority, mode, active, arch, arch_fs, inherit_id, create_uid, create_date, write_uid, write_date FROM migrate.theme_ir_ui_view
--WHERE NOT EXISTS (SELECT 1 FROM theme_ir_ui_view WHERE id=migrate.theme_ir_ui_view.id);
--SELECT pg_catalog.setval('theme_ir_ui_view_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM theme_ir_ui_view) x;
--ALTER TABLE theme_ir_ui_view ENABLE TRIGGER ALL;

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

ALTER TABLE website_page DISABLE TRIGGER ALL;
INSERT INTO website_page ( id, url, view_id, website_indexed, date_publish, header_overlay, header_color, website_id, theme_template_id, is_published, create_uid, create_date, write_uid, write_date )
SELECT id, url, view_id, website_indexed, date_publish, header_overlay, header_color, website_id, theme_template_id, is_published, create_uid, create_date, write_uid, write_date FROM migrate.website_page
WHERE NOT EXISTS (SELECT 1 FROM website_page WHERE id=migrate.website_page.id);
SELECT pg_catalog.setval('website_page_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM website_page) x;
ALTER TABLE website_page ENABLE TRIGGER ALL;

ALTER TABLE mail_activity DISABLE TRIGGER ALL;
INSERT INTO mail_activity ( id, res_model_id, res_model, res_id, res_name, activity_type_id, summary, note, date_deadline, automated, user_id, recommended_activity_type_id, previous_activity_type_id, create_uid, create_date, write_uid, write_date, calendar_event_id )
SELECT id, res_model_id, res_model, res_id, res_name, activity_type_id, summary, note, date_deadline, automated, user_id, recommended_activity_type_id, previous_activity_type_id, create_uid, create_date, write_uid, write_date, calendar_event_id FROM migrate.mail_activity
WHERE NOT EXISTS (SELECT 1 FROM mail_activity WHERE id=migrate.mail_activity.id);
SELECT pg_catalog.setval('mail_activity_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_activity) x;
ALTER TABLE mail_activity ENABLE TRIGGER ALL;

ALTER TABLE res_users DISABLE TRIGGER ALL;
INSERT INTO res_users ( id, active, login, password, company_id, partner_id, create_date, signature, action_id, share, create_uid, write_uid, write_date, notification_type, odoobot_state, sale_team_id, target_sales_won, target_sales_done, website_id, target_sales_invoiced )
SELECT id, active, login, password, company_id, partner_id, create_date, signature, action_id, share, create_uid, write_uid, write_date, notification_type, odoobot_state, sale_team_id, target_sales_won, target_sales_done, website_id, target_sales_invoiced FROM migrate.res_users
WHERE NOT EXISTS (SELECT 1 FROM res_users WHERE id=migrate.res_users.id);
SELECT pg_catalog.setval('res_users_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_users) x;
ALTER TABLE res_users ENABLE TRIGGER ALL;

ALTER TABLE website DISABLE TRIGGER ALL;
INSERT INTO website ( id, name, domain, company_id, default_lang_id, auto_redirect_lang, social_twitter, social_facebook, social_github, social_linkedin, social_youtube, social_instagram, google_analytics_key, google_management_client_id, google_management_client_secret, google_maps_api_key, user_id, cdn_activated, cdn_url, cdn_filters, homepage_id, theme_id, specific_user_account, auth_signup_uninvited, create_uid, create_date, write_uid, write_date )
SELECT id, name, domain, company_id, default_lang_id, auto_redirect_lang, social_twitter, social_facebook, social_github, social_linkedin, social_youtube, social_instagram, google_analytics_key, google_management_client_id, google_management_client_secret, google_maps_api_key, user_id, cdn_activated, cdn_url, cdn_filters, homepage_id, theme_id, specific_user_account, auth_signup_uninvited, create_uid, create_date, write_uid, write_date FROM migrate.website
WHERE NOT EXISTS (SELECT 1 FROM website WHERE id=migrate.website.id);
SELECT pg_catalog.setval('website_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM website) x;
ALTER TABLE website ENABLE TRIGGER ALL;

ALTER TABLE mail_followers_mail_message_subtype_rel DISABLE TRIGGER ALL;
INSERT INTO mail_followers_mail_message_subtype_rel ( mail_followers_id, mail_message_subtype_id )
SELECT mail_followers_id, mail_message_subtype_id FROM migrate.mail_followers_mail_message_subtype_rel
WHERE NOT EXISTS (SELECT 1 FROM mail_followers_mail_message_subtype_rel WHERE mail_followers_id=migrate.mail_followers_mail_message_subtype_rel.mail_followers_id AND mail_message_subtype_id=migrate.mail_followers_mail_message_subtype_rel.mail_message_subtype_id);
ALTER TABLE mail_followers_mail_message_subtype_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_mail_res_partner_rel DISABLE TRIGGER ALL;
INSERT INTO mail_mail_res_partner_rel ( mail_mail_id, res_partner_id )
SELECT mail_mail_id, res_partner_id FROM migrate.mail_mail_res_partner_rel
WHERE NOT EXISTS (SELECT 1 FROM mail_mail_res_partner_rel WHERE mail_mail_id=migrate.mail_mail_res_partner_rel.mail_mail_id AND res_partner_id=migrate.mail_mail_res_partner_rel.res_partner_id);
ALTER TABLE mail_mail_res_partner_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_mail DISABLE TRIGGER ALL;
INSERT INTO mail_mail ( id, mail_message_id, body_html, "references", headers, notification, email_to, email_cc, state, auto_delete, failure_reason, scheduled_date, create_uid, create_date, write_uid, write_date, fetchmail_server_id )
SELECT id, mail_message_id, body_html, "references", headers, notification, email_to, email_cc, state, auto_delete, failure_reason, scheduled_date, create_uid, create_date, write_uid, write_date, fetchmail_server_id FROM migrate.mail_mail
WHERE NOT EXISTS (SELECT 1 FROM mail_mail WHERE id=migrate.mail_mail.id);
SELECT pg_catalog.setval('mail_mail_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_mail) x;
ALTER TABLE mail_mail ENABLE TRIGGER ALL;

ALTER TABLE mail_channel_partner DISABLE TRIGGER ALL;
INSERT INTO mail_channel_partner ( id, partner_id, channel_id, seen_message_id, fold_state, is_minimized, is_pinned, create_uid, create_date, write_uid, write_date )
SELECT id, partner_id, channel_id, seen_message_id, fold_state, is_minimized, is_pinned, create_uid, create_date, write_uid, write_date FROM migrate.mail_channel_partner
WHERE NOT EXISTS (SELECT 1 FROM mail_channel_partner WHERE id=migrate.mail_channel_partner.id);
SELECT pg_catalog.setval('mail_channel_partner_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_channel_partner) x;
ALTER TABLE mail_channel_partner ENABLE TRIGGER ALL;

ALTER TABLE mail_alias DISABLE TRIGGER ALL;
INSERT INTO mail_alias ( id, alias_name, alias_model_id, alias_user_id, alias_defaults, alias_force_thread_id, alias_parent_model_id, alias_parent_thread_id, alias_contact, create_uid, create_date, write_uid, write_date )
SELECT id, alias_name, alias_model_id, alias_user_id, alias_defaults, alias_force_thread_id, alias_parent_model_id, alias_parent_thread_id, alias_contact, create_uid, create_date, write_uid, write_date FROM migrate.mail_alias
WHERE NOT EXISTS (SELECT 1 FROM mail_alias WHERE id=migrate.mail_alias.id);
SELECT pg_catalog.setval('mail_alias_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_alias) x;
ALTER TABLE mail_alias ENABLE TRIGGER ALL;

ALTER TABLE mail_channel_res_groups_rel DISABLE TRIGGER ALL;
INSERT INTO mail_channel_res_groups_rel ( mail_channel_id, res_groups_id )
SELECT mail_channel_id, res_groups_id FROM migrate.mail_channel_res_groups_rel
WHERE NOT EXISTS (SELECT 1 FROM mail_channel_res_groups_rel WHERE mail_channel_id=migrate.mail_channel_res_groups_rel.mail_channel_id AND res_groups_id=migrate.mail_channel_res_groups_rel.res_groups_id);
ALTER TABLE mail_channel_res_groups_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_channel DISABLE TRIGGER ALL;
INSERT INTO mail_channel ( id, name, channel_type, description, uuid, email_send, public, group_public_id, moderation, moderation_notify, moderation_notify_msg, moderation_guidelines, moderation_guidelines_msg, alias_id, message_main_attachment_id, create_uid, create_date, write_uid, write_date )
SELECT id, name, channel_type, description, uuid, email_send, public, group_public_id, moderation, moderation_notify, moderation_notify_msg, moderation_guidelines, moderation_guidelines_msg, alias_id, message_main_attachment_id, create_uid, create_date, write_uid, write_date FROM migrate.mail_channel
WHERE NOT EXISTS (SELECT 1 FROM mail_channel WHERE id=migrate.mail_channel.id);
SELECT pg_catalog.setval('mail_channel_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_channel) x;
ALTER TABLE mail_channel ENABLE TRIGGER ALL;

ALTER TABLE mail_message_subtype DISABLE TRIGGER ALL;
INSERT INTO mail_message_subtype ( id, name, description, internal, parent_id, relation_field, res_model, sequence, hidden, create_uid, create_date, write_uid, write_date )
SELECT id, name, description, internal, parent_id, relation_field, res_model, sequence, hidden, create_uid, create_date, write_uid, write_date FROM migrate.mail_message_subtype
WHERE NOT EXISTS (SELECT 1 FROM mail_message_subtype WHERE id=migrate.mail_message_subtype.id);
SELECT pg_catalog.setval('mail_message_subtype_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_message_subtype) x;
ALTER TABLE mail_message_subtype ENABLE TRIGGER ALL;

ALTER TABLE mail_activity_type DISABLE TRIGGER ALL;
INSERT INTO mail_activity_type ( id, name, summary, sequence, active, create_uid, delay_count, delay_unit, delay_from, icon, decoration_type, res_model_id, default_next_type_id, force_next, category, create_date, write_uid, write_date )
SELECT id, name, summary, sequence, active, create_uid, delay_count, delay_unit, delay_from, icon, decoration_type, res_model_id, default_next_type_id, force_next, category, create_date, write_uid, write_date FROM migrate.mail_activity_type
WHERE NOT EXISTS (SELECT 1 FROM mail_activity_type WHERE id=migrate.mail_activity_type.id);
SELECT pg_catalog.setval('mail_activity_type_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_activity_type) x;
ALTER TABLE mail_activity_type ENABLE TRIGGER ALL;

--ALTER TABLE mail_message_res_partner_needaction_rel DISABLE TRIGGER ALL;
--INSERT INTO mail_message_res_partner_needaction_rel ( id, mail_message_id, mail_id, res_partner_id, is_read, failure_type, failure_reason )
--SELECT id, mail_message_id, mail_id, res_partner_id, is_read, failure_type, failure_reason FROM migrate.mail_message_res_partner_needaction_rel
--WHERE NOT EXISTS (SELECT 1 FROM mail_message_res_partner_needaction_rel WHERE id=migrate.mail_message_res_partner_needaction_rel.id);
--SELECT pg_catalog.setval('mail_message_res_partner_needaction_rel_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_message_res_partner_needaction_rel) x;
--ALTER TABLE mail_message_res_partner_needaction_rel ENABLE TRIGGER ALL;

--ALTER TABLE payment_acquirer_payment_icon_rel DISABLE TRIGGER ALL;
--INSERT INTO payment_acquirer_payment_icon_rel ( payment_acquirer_id, payment_icon_id )
--SELECT payment_acquirer_id, payment_icon_id FROM migrate.payment_acquirer_payment_icon_rel
--WHERE NOT EXISTS (SELECT 1 FROM payment_acquirer_payment_icon_rel WHERE payment_acquirer_id=migrate.payment_acquirer_payment_icon_rel.payment_acquirer_id AND payment_icon_id=migrate.payment_acquirer_payment_icon_rel.payment_icon_id);
--ALTER TABLE payment_acquirer_payment_icon_rel ENABLE TRIGGER ALL;

ALTER TABLE mail_message DISABLE TRIGGER ALL;
INSERT INTO mail_message ( id, subject, date, body, parent_id, model, res_id, record_name, message_type, subtype_id, mail_activity_type_id, email_from, author_id, no_auto_thread, message_id, reply_to, mail_server_id, moderation_status, moderator_id, add_sign, create_uid, create_date, write_uid, write_date )
SELECT id, subject, date, body, parent_id, model, res_id, record_name, message_type, subtype_id, mail_activity_type_id, email_from, author_id, no_auto_thread, message_id, reply_to, mail_server_id, moderation_status, moderator_id, add_sign, create_uid, create_date, write_uid, write_date FROM migrate.mail_message
WHERE NOT EXISTS (SELECT 1 FROM mail_message WHERE id=migrate.mail_message.id);
SELECT pg_catalog.setval('mail_message_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_message) x;
ALTER TABLE mail_message ENABLE TRIGGER ALL;

--ALTER TABLE payment_icon DISABLE TRIGGER ALL;
--INSERT INTO payment_icon ( id, name, create_uid, create_date, write_uid, write_date )
--SELECT id, name, create_uid, create_date, write_uid, write_date FROM migrate.payment_icon
--WHERE NOT EXISTS (SELECT 1 FROM payment_icon WHERE id=migrate.payment_icon.id);
--SELECT pg_catalog.setval('payment_icon_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM payment_icon) x;
--ALTER TABLE payment_icon ENABLE TRIGGER ALL;

ALTER TABLE mail_template DISABLE TRIGGER ALL;
INSERT INTO mail_template ( id, name, model_id, model, subject, email_from, use_default_to, email_to, partner_to, email_cc, reply_to, body_html, report_name, report_template, mail_server_id, scheduled_date, auto_delete, ref_ir_act_window, lang, create_uid, create_date, write_uid, write_date )
SELECT id, name, model_id, model, subject, email_from, use_default_to, email_to, partner_to, email_cc, reply_to, body_html, report_name, report_template, mail_server_id, scheduled_date, auto_delete, ref_ir_act_window, lang, create_uid, create_date, write_uid, write_date FROM migrate.mail_template
WHERE NOT EXISTS (SELECT 1 FROM mail_template WHERE id=migrate.mail_template.id);
SELECT pg_catalog.setval('mail_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM mail_template) x;
ALTER TABLE mail_template ENABLE TRIGGER ALL;

ALTER TABLE account_invoice_transaction_rel DISABLE TRIGGER ALL;
INSERT INTO account_invoice_transaction_rel ( transaction_id, invoice_id )
SELECT transaction_id, invoice_id FROM migrate.account_invoice_transaction_rel
WHERE NOT EXISTS (SELECT 1 FROM account_invoice_transaction_rel WHERE transaction_id=migrate.account_invoice_transaction_rel.transaction_id AND invoice_id=migrate.account_invoice_transaction_rel.invoice_id);
ALTER TABLE account_invoice_transaction_rel ENABLE TRIGGER ALL;

--ALTER TABLE payment_acquirer DISABLE TRIGGER ALL;
--INSERT INTO payment_acquirer ( id, name, description, sequence, provider, company_id, view_template_id, registration_view_template_id, capture_manually, journal_id, pre_msg, pending_msg, done_msg, cancel_msg, save_token, fees_active, fees_dom_fixed, fees_dom_var, fees_int_fixed, fees_int_var, qr_code, module_id, payment_flow, create_uid, create_date, write_uid, write_date, so_reference_type )
--SELECT id, name, description, sequence, provider, company_id, view_template_id, registration_view_template_id, capture_manually, journal_id, pre_msg, pending_msg, done_msg, cancel_msg, save_token, fees_active, fees_dom_fixed, fees_dom_var, fees_int_fixed, fees_int_var, qr_code, module_id, payment_flow, create_uid, create_date, write_uid, write_date, so_reference_type FROM migrate.payment_acquirer
--WHERE NOT EXISTS (SELECT 1 FROM payment_acquirer WHERE id=migrate.payment_acquirer.id);
--SELECT pg_catalog.setval('payment_acquirer_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM payment_acquirer) x;
--ALTER TABLE payment_acquirer ENABLE TRIGGER ALL;

ALTER TABLE payment_transaction DISABLE TRIGGER ALL;
INSERT INTO payment_transaction ( id, date, acquirer_id, type, state, state_message, amount, fees, currency_id, reference, acquirer_reference, partner_id, partner_name, partner_lang, partner_email, partner_zip, partner_address, partner_city, partner_country_id, partner_phone, html_3ds, callback_model_id, callback_res_id, callback_method, callback_hash, return_url, is_processed, payment_token_id, payment_id, create_uid, create_date, write_uid, write_date )
SELECT id, date, acquirer_id, type, state, state_message, amount, fees, currency_id, reference, acquirer_reference, partner_id, partner_name, partner_lang, partner_email, partner_zip, partner_address, partner_city, partner_country_id, partner_phone, html_3ds, callback_model_id, callback_res_id, callback_method, callback_hash, return_url, is_processed, payment_token_id, payment_id, create_uid, create_date, write_uid, write_date FROM migrate.payment_transaction
WHERE NOT EXISTS (SELECT 1 FROM payment_transaction WHERE id=migrate.payment_transaction.id);
SELECT pg_catalog.setval('payment_transaction_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM payment_transaction) x;
ALTER TABLE payment_transaction ENABLE TRIGGER ALL;

ALTER TABLE account_tax_purchase_order_line_rel DISABLE TRIGGER ALL;
INSERT INTO account_tax_purchase_order_line_rel ( purchase_order_line_id, account_tax_id )
SELECT purchase_order_line_id, account_tax_id FROM migrate.account_tax_purchase_order_line_rel
WHERE NOT EXISTS (SELECT 1 FROM account_tax_purchase_order_line_rel WHERE purchase_order_line_id=migrate.account_tax_purchase_order_line_rel.purchase_order_line_id AND account_tax_id=migrate.account_tax_purchase_order_line_rel.account_tax_id);
ALTER TABLE account_tax_purchase_order_line_rel ENABLE TRIGGER ALL;

ALTER TABLE purchase_order DISABLE TRIGGER ALL;
INSERT INTO purchase_order ( id, message_main_attachment_id, access_token, name, origin, partner_ref, date_order, date_approve, partner_id, dest_address_id, currency_id, state, notes, invoice_count, invoice_status, date_planned, amount_untaxed, amount_tax, amount_total, fiscal_position_id, payment_term_id, incoterm_id, user_id, company_id, create_uid, create_date, write_uid, write_date, picking_count, picking_type_id, group_id )
SELECT id, message_main_attachment_id, access_token, name, origin, partner_ref, date_order, date_approve, partner_id, dest_address_id, currency_id, state, notes, invoice_count, invoice_status, date_planned, amount_untaxed, amount_tax, amount_total, fiscal_position_id, payment_term_id, incoterm_id, user_id, company_id, create_uid, create_date, write_uid, write_date, picking_count, picking_type_id, group_id FROM migrate.purchase_order
WHERE NOT EXISTS (SELECT 1 FROM purchase_order WHERE id=migrate.purchase_order.id);
SELECT pg_catalog.setval('purchase_order_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM purchase_order) x;
ALTER TABLE purchase_order ENABLE TRIGGER ALL;

ALTER TABLE calendar_attendee DISABLE TRIGGER ALL;
INSERT INTO calendar_attendee ( id, event_id, partner_id, state, common_name, availability, access_token, create_uid, create_date, write_uid, write_date )
SELECT id, event_id, partner_id, state, common_name, availability, access_token, create_uid, create_date, write_uid, write_date FROM migrate.calendar_attendee
WHERE NOT EXISTS (SELECT 1 FROM calendar_attendee WHERE id=migrate.calendar_attendee.id);
SELECT pg_catalog.setval('calendar_attendee_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM calendar_attendee) x;
ALTER TABLE calendar_attendee ENABLE TRIGGER ALL;

ALTER TABLE purchase_order_line DISABLE TRIGGER ALL;
INSERT INTO purchase_order_line ( id, name, sequence, product_qty, product_uom_qty, date_planned, product_uom, product_id, price_unit, price_subtotal, price_total, price_tax, order_id, account_analytic_id, company_id, state, qty_invoiced, qty_received, partner_id, currency_id, create_uid, create_date, write_uid, write_date, orderpoint_id, sale_order_id, sale_line_id )
SELECT id, name, sequence, product_qty, product_uom_qty, date_planned, product_uom, product_id, price_unit, price_subtotal, price_total, price_tax, order_id, account_analytic_id, company_id, state, qty_invoiced, qty_received, partner_id, currency_id, create_uid, create_date, write_uid, write_date, orderpoint_id, sale_order_id, sale_line_id FROM migrate.purchase_order_line
WHERE NOT EXISTS (SELECT 1 FROM purchase_order_line WHERE id=migrate.purchase_order_line.id);
SELECT pg_catalog.setval('purchase_order_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM purchase_order_line) x;
ALTER TABLE purchase_order_line ENABLE TRIGGER ALL;

ALTER TABLE res_partner DISABLE TRIGGER ALL;
INSERT INTO res_partner ( id, name, company_id, create_date, display_name, date, title, parent_id, ref, lang, tz, user_id, vat, website, comment, credit_limit, active, employee, function, type, street, street2, zip, city, state_id, country_id, email, phone, mobile, is_company, industry_id, color, partner_share, commercial_partner_id, commercial_company_name, company_name, create_uid, write_uid, write_date, message_main_attachment_id, message_bounce, signup_token, signup_type, signup_expiration, calendar_last_notif_ack, team_id, ocn_token, debit_limit, last_time_entries_checked, invoice_warn, invoice_warn_msg, picking_warn, picking_warn_msg, website_id, is_published, online_partner_vendor_name, online_partner_bank_account, purchase_warn, purchase_warn_msg, sale_warn, sale_warn_msg )
SELECT id, name, company_id, create_date, display_name, date, title, parent_id, ref, lang, tz, user_id, vat, website, comment, credit_limit, active, employee, function, type, street, street2, zip, city, state_id, country_id, email, phone, mobile, is_company, industry_id, color, partner_share, commercial_partner_id, commercial_company_name, company_name, create_uid, write_uid, write_date, message_main_attachment_id, message_bounce, signup_token, signup_type, signup_expiration, calendar_last_notif_ack, team_id, ocn_token, debit_limit, last_time_entries_checked, invoice_warn, invoice_warn_msg, picking_warn, picking_warn_msg, website_id, is_published, online_partner_vendor_name, online_partner_bank_account, purchase_warn, purchase_warn_msg, sale_warn, sale_warn_msg FROM migrate.res_partner
WHERE NOT EXISTS (SELECT 1 FROM res_partner WHERE id=migrate.res_partner.id);
SELECT pg_catalog.setval('res_partner_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_partner) x;
ALTER TABLE res_partner ENABLE TRIGGER ALL;

ALTER TABLE calendar_event_res_partner_rel DISABLE TRIGGER ALL;
INSERT INTO calendar_event_res_partner_rel ( calendar_event_id, res_partner_id )
SELECT calendar_event_id, res_partner_id FROM migrate.calendar_event_res_partner_rel
WHERE NOT EXISTS (SELECT 1 FROM calendar_event_res_partner_rel WHERE calendar_event_id=migrate.calendar_event_res_partner_rel.calendar_event_id AND res_partner_id=migrate.calendar_event_res_partner_rel.res_partner_id);
ALTER TABLE calendar_event_res_partner_rel ENABLE TRIGGER ALL;

ALTER TABLE calendar_alarm DISABLE TRIGGER ALL;
INSERT INTO calendar_alarm ( id, name, duration, interval, duration_minutes, create_uid, create_date, write_uid, write_date )
SELECT id, name, duration, interval, duration_minutes, create_uid, create_date, write_uid, write_date FROM migrate.calendar_alarm
WHERE NOT EXISTS (SELECT 1 FROM calendar_alarm WHERE id=migrate.calendar_alarm.id);
SELECT pg_catalog.setval('calendar_alarm_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM calendar_alarm) x;
ALTER TABLE calendar_alarm ENABLE TRIGGER ALL;

ALTER TABLE calendar_event DISABLE TRIGGER ALL;
INSERT INTO calendar_event ( id, message_main_attachment_id, name, start, stop, allday, start_date, stop_date, duration, description, privacy, location, show_as, res_id, res_model_id, res_model, user_id, active, recurrency, create_uid, create_date, write_uid, write_date, opportunity_id )
SELECT id, message_main_attachment_id, name, start, stop, allday, start_date, stop_date, duration, description, privacy, location, show_as, res_id, res_model_id, res_model, user_id, active, recurrency, create_uid, create_date, write_uid, write_date, opportunity_id FROM migrate.calendar_event
WHERE NOT EXISTS (SELECT 1 FROM calendar_event WHERE id=migrate.calendar_event.id);
SELECT pg_catalog.setval('calendar_event_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM calendar_event) x;
ALTER TABLE calendar_event ENABLE TRIGGER ALL;

ALTER TABLE account_report_manager DISABLE TRIGGER ALL;
INSERT INTO account_report_manager ( id, report_name, summary, company_id, financial_report_id, create_uid, create_date, write_uid, write_date, partner_id )
SELECT id, report_name, summary, company_id, financial_report_id, create_uid, create_date, write_uid, write_date, partner_id FROM migrate.account_report_manager
WHERE NOT EXISTS (SELECT 1 FROM account_report_manager WHERE id=migrate.account_report_manager.id);
SELECT pg_catalog.setval('account_report_manager_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_report_manager) x;
ALTER TABLE account_report_manager ENABLE TRIGGER ALL;

ALTER TABLE product_supplierinfo DISABLE TRIGGER ALL;
INSERT INTO product_supplierinfo ( id, name, product_name, product_code, sequence, min_qty, price, company_id, currency_id, date_start, date_end, product_id, product_tmpl_id, delay, create_uid, create_date, write_uid, write_date )
SELECT id, name, product_name, product_code, sequence, min_qty, price, company_id, currency_id, date_start, date_end, product_id, product_tmpl_id, delay, create_uid, create_date, write_uid, write_date FROM migrate.product_supplierinfo
WHERE NOT EXISTS (SELECT 1 FROM product_supplierinfo WHERE id=migrate.product_supplierinfo.id);
SELECT pg_catalog.setval('product_supplierinfo_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_supplierinfo) x;
ALTER TABLE product_supplierinfo ENABLE TRIGGER ALL;

ALTER TABLE product_packaging DISABLE TRIGGER ALL;
INSERT INTO product_packaging ( id, name, sequence, product_id, qty, barcode, create_uid, create_date, write_uid, write_date )
SELECT id, name, sequence, product_id, qty, barcode, create_uid, create_date, write_uid, write_date FROM migrate.product_packaging
WHERE NOT EXISTS (SELECT 1 FROM product_packaging WHERE id=migrate.product_packaging.id);
SELECT pg_catalog.setval('product_packaging_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_packaging) x;
ALTER TABLE product_packaging ENABLE TRIGGER ALL;

ALTER TABLE account_report_footnote DISABLE TRIGGER ALL;
INSERT INTO account_report_footnote ( id, text, line, manager_id, create_uid, create_date, write_uid, write_date )
SELECT id, text, line, manager_id, create_uid, create_date, write_uid, write_date FROM migrate.account_report_footnote
WHERE NOT EXISTS (SELECT 1 FROM account_report_footnote WHERE id=migrate.account_report_footnote.id);
SELECT pg_catalog.setval('account_report_footnote_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_report_footnote) x;
ALTER TABLE account_report_footnote ENABLE TRIGGER ALL;

ALTER TABLE account_financial_html_report DISABLE TRIGGER ALL;
INSERT INTO account_financial_html_report ( id, name, date_range, comparison, analytic, show_journal_filter, unfold_all_filter, company_id, generated_menu_id, tax_report, create_uid, create_date, write_uid, write_date )
SELECT id, name, date_range, comparison, analytic, show_journal_filter, unfold_all_filter, company_id, generated_menu_id, tax_report, create_uid, create_date, write_uid, write_date FROM migrate.account_financial_html_report
WHERE NOT EXISTS (SELECT 1 FROM account_financial_html_report WHERE id=migrate.account_financial_html_report.id);
SELECT pg_catalog.setval('account_financial_html_report_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_financial_html_report) x;
ALTER TABLE account_financial_html_report ENABLE TRIGGER ALL;

ALTER TABLE account_financial_html_report_line DISABLE TRIGGER ALL;
DELETE FROM account_financial_html_report_line;
INSERT INTO account_financial_html_report_line ( id, name, code, financial_report_id, parent_id, parent_path, sequence, domain, formulas, groupby, figure_type, print_on_new_page, green_on_positive, level, special_date_changer, show_domain, hide_if_zero, action_id, create_uid, create_date, write_uid, write_date )
SELECT id, name, code, financial_report_id, parent_id, parent_path, sequence, domain, formulas, groupby, figure_type, print_on_new_page, green_on_positive, level, special_date_changer, show_domain, hide_if_zero, action_id, create_uid, create_date, write_uid, write_date FROM migrate.account_financial_html_report_line
WHERE NOT EXISTS (SELECT 1 FROM account_financial_html_report_line WHERE id=migrate.account_financial_html_report_line.id);
SELECT pg_catalog.setval('account_financial_html_report_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_financial_html_report_line) x;
ALTER TABLE account_financial_html_report_line ENABLE TRIGGER ALL;

ALTER TABLE purchase_order_stock_picking_rel DISABLE TRIGGER ALL;
INSERT INTO purchase_order_stock_picking_rel ( purchase_order_id, stock_picking_id )
SELECT purchase_order_id, stock_picking_id FROM migrate.purchase_order_stock_picking_rel
WHERE NOT EXISTS (SELECT 1 FROM purchase_order_stock_picking_rel WHERE purchase_order_id=migrate.purchase_order_stock_picking_rel.purchase_order_id AND stock_picking_id=migrate.purchase_order_stock_picking_rel.stock_picking_id);
ALTER TABLE purchase_order_stock_picking_rel ENABLE TRIGGER ALL;

ALTER TABLE product_category DISABLE TRIGGER ALL;
INSERT INTO product_category ( id, name, complete_name, parent_id, parent_path, create_uid, create_date, write_uid, write_date, removal_strategy_id )
SELECT id, name, complete_name, parent_id, parent_path, create_uid, create_date, write_uid, write_date, removal_strategy_id FROM migrate.product_category
WHERE NOT EXISTS (SELECT 1 FROM product_category WHERE id=migrate.product_category.id);
SELECT pg_catalog.setval('product_category_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_category) x;
ALTER TABLE product_category ENABLE TRIGGER ALL;

ALTER TABLE team_favorite_user_rel DISABLE TRIGGER ALL;
INSERT INTO team_favorite_user_rel ( team_id, user_id )
SELECT team_id, user_id FROM migrate.team_favorite_user_rel
WHERE NOT EXISTS (SELECT 1 FROM team_favorite_user_rel WHERE team_id=migrate.team_favorite_user_rel.team_id AND user_id=migrate.team_favorite_user_rel.user_id);
ALTER TABLE team_favorite_user_rel ENABLE TRIGGER ALL;

ALTER TABLE product_pricelist_item DISABLE TRIGGER ALL;
INSERT INTO product_pricelist_item ( id, product_tmpl_id, product_id, categ_id, min_quantity, applied_on, base, base_pricelist_id, pricelist_id, price_surcharge, price_discount, price_round, price_min_margin, price_max_margin, company_id, currency_id, date_start, date_end, compute_price, fixed_price, percent_price, create_uid, create_date, write_uid, write_date )
SELECT id, product_tmpl_id, product_id, categ_id, min_quantity, applied_on, base, base_pricelist_id, pricelist_id, price_surcharge, price_discount, price_round, price_min_margin, price_max_margin, company_id, currency_id, date_start, date_end, compute_price, fixed_price, percent_price, create_uid, create_date, write_uid, write_date FROM migrate.product_pricelist_item
WHERE NOT EXISTS (SELECT 1 FROM product_pricelist_item WHERE id=migrate.product_pricelist_item.id);
SELECT pg_catalog.setval('product_pricelist_item_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_pricelist_item) x;
ALTER TABLE product_pricelist_item ENABLE TRIGGER ALL;

ALTER TABLE sale_order_line_invoice_rel DISABLE TRIGGER ALL;
INSERT INTO sale_order_line_invoice_rel ( invoice_line_id, order_line_id )
SELECT invoice_line_id, order_line_id FROM migrate.sale_order_line_invoice_rel
WHERE NOT EXISTS (SELECT 1 FROM sale_order_line_invoice_rel WHERE invoice_line_id=migrate.sale_order_line_invoice_rel.invoice_line_id AND order_line_id=migrate.sale_order_line_invoice_rel.order_line_id);
ALTER TABLE sale_order_line_invoice_rel ENABLE TRIGGER ALL;

ALTER TABLE product_pricelist DISABLE TRIGGER ALL;
INSERT INTO product_pricelist ( id, name, active, currency_id, company_id, sequence, discount_policy, create_uid, create_date, write_uid, write_date )
SELECT id, name, active, currency_id, company_id, sequence, discount_policy, create_uid, create_date, write_uid, write_date FROM migrate.product_pricelist
WHERE NOT EXISTS (SELECT 1 FROM product_pricelist WHERE id=migrate.product_pricelist.id);
SELECT pg_catalog.setval('product_pricelist_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM product_pricelist) x;
ALTER TABLE product_pricelist ENABLE TRIGGER ALL;

ALTER TABLE crm_team DISABLE TRIGGER ALL;
INSERT INTO crm_team ( id, message_main_attachment_id, name, active, company_id, user_id, color, create_uid, create_date, write_uid, write_date, use_leads, use_opportunities, alias_id, use_quotations, invoiced_target )
SELECT id, message_main_attachment_id, name, active, company_id, user_id, color, create_uid, create_date, write_uid, write_date, use_leads, use_opportunities, alias_id, use_quotations, invoiced_target FROM migrate.crm_team
WHERE NOT EXISTS (SELECT 1 FROM crm_team WHERE id=migrate.crm_team.id);
SELECT pg_catalog.setval('crm_team_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM crm_team) x;
ALTER TABLE crm_team ENABLE TRIGGER ALL;

ALTER TABLE sale_order_transaction_rel DISABLE TRIGGER ALL;
INSERT INTO sale_order_transaction_rel ( sale_order_id, transaction_id )
SELECT sale_order_id, transaction_id FROM migrate.sale_order_transaction_rel
WHERE NOT EXISTS (SELECT 1 FROM sale_order_transaction_rel WHERE sale_order_id=migrate.sale_order_transaction_rel.sale_order_id AND transaction_id=migrate.sale_order_transaction_rel.transaction_id);
ALTER TABLE sale_order_transaction_rel ENABLE TRIGGER ALL;

ALTER TABLE account_tax_sale_order_line_rel DISABLE TRIGGER ALL;
INSERT INTO account_tax_sale_order_line_rel ( sale_order_line_id, account_tax_id )
SELECT sale_order_line_id, account_tax_id FROM migrate.account_tax_sale_order_line_rel
WHERE NOT EXISTS (SELECT 1 FROM account_tax_sale_order_line_rel WHERE sale_order_line_id=migrate.account_tax_sale_order_line_rel.sale_order_line_id AND account_tax_id=migrate.account_tax_sale_order_line_rel.account_tax_id);
ALTER TABLE account_tax_sale_order_line_rel ENABLE TRIGGER ALL;

ALTER TABLE digest_digest_res_users_rel DISABLE TRIGGER ALL;
INSERT INTO digest_digest_res_users_rel ( digest_digest_id, res_users_id )
SELECT digest_digest_id, res_users_id FROM migrate.digest_digest_res_users_rel
WHERE NOT EXISTS (SELECT 1 FROM digest_digest_res_users_rel WHERE digest_digest_id=migrate.digest_digest_res_users_rel.digest_digest_id AND res_users_id=migrate.digest_digest_res_users_rel.res_users_id);
ALTER TABLE digest_digest_res_users_rel ENABLE TRIGGER ALL;

ALTER TABLE digest_tip_res_users_rel DISABLE TRIGGER ALL;
INSERT INTO digest_tip_res_users_rel ( digest_tip_id, res_users_id )
SELECT digest_tip_id, res_users_id FROM migrate.digest_tip_res_users_rel
WHERE NOT EXISTS (SELECT 1 FROM digest_tip_res_users_rel WHERE digest_tip_id=migrate.digest_tip_res_users_rel.digest_tip_id AND res_users_id=migrate.digest_tip_res_users_rel.res_users_id);
ALTER TABLE digest_tip_res_users_rel ENABLE TRIGGER ALL;

ALTER TABLE digest_tip DISABLE TRIGGER ALL;
INSERT INTO digest_tip ( id, sequence, tip_description, group_id, create_uid, create_date, write_uid, write_date )
SELECT id, sequence, tip_description, group_id, create_uid, create_date, write_uid, write_date FROM migrate.digest_tip
WHERE NOT EXISTS (SELECT 1 FROM digest_tip WHERE id=migrate.digest_tip.id);
SELECT pg_catalog.setval('digest_tip_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM digest_tip) x;
ALTER TABLE digest_tip ENABLE TRIGGER ALL;

ALTER TABLE digest_digest DISABLE TRIGGER ALL;
INSERT INTO digest_digest ( id, name, periodicity, next_run_date, company_id, state, kpi_res_users_connected, kpi_mail_message_total, create_uid, create_date, write_uid, write_date, kpi_account_total_revenue, kpi_crm_lead_created, kpi_crm_opportunities_won, kpi_account_bank_cash, kpi_all_sale_total )
SELECT id, name, periodicity, next_run_date, company_id, state, kpi_res_users_connected, kpi_mail_message_total, create_uid, create_date, write_uid, write_date, kpi_account_total_revenue, kpi_crm_lead_created, kpi_crm_opportunities_won, kpi_account_bank_cash, kpi_all_sale_total FROM migrate.digest_digest
WHERE NOT EXISTS (SELECT 1 FROM digest_digest WHERE id=migrate.digest_digest.id);
SELECT pg_catalog.setval('digest_digest_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM digest_digest) x;
ALTER TABLE digest_digest ENABLE TRIGGER ALL;

ALTER TABLE account_fiscal_position_res_country_state_rel DISABLE TRIGGER ALL;
INSERT INTO account_fiscal_position_res_country_state_rel ( account_fiscal_position_id, res_country_state_id )
SELECT account_fiscal_position_id, res_country_state_id FROM migrate.account_fiscal_position_res_country_state_rel
WHERE NOT EXISTS (SELECT 1 FROM account_fiscal_position_res_country_state_rel WHERE account_fiscal_position_id=migrate.account_fiscal_position_res_country_state_rel.account_fiscal_position_id AND res_country_state_id=migrate.account_fiscal_position_res_country_state_rel.res_country_state_id);
ALTER TABLE account_fiscal_position_res_country_state_rel ENABLE TRIGGER ALL;

ALTER TABLE account_fiscal_position_tax DISABLE TRIGGER ALL;
INSERT INTO account_fiscal_position_tax ( id, position_id, tax_src_id, tax_dest_id, create_uid, create_date, write_uid, write_date )
SELECT id, position_id, tax_src_id, tax_dest_id, create_uid, create_date, write_uid, write_date FROM migrate.account_fiscal_position_tax
WHERE NOT EXISTS (SELECT 1 FROM account_fiscal_position_tax WHERE id=migrate.account_fiscal_position_tax.id);
SELECT pg_catalog.setval('account_fiscal_position_tax_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_fiscal_position_tax) x;
ALTER TABLE account_fiscal_position_tax ENABLE TRIGGER ALL;

ALTER TABLE account_fiscal_position_account DISABLE TRIGGER ALL;
INSERT INTO account_fiscal_position_account ( id, position_id, account_src_id, account_dest_id, create_uid, create_date, write_uid, write_date )
SELECT id, position_id, account_src_id, account_dest_id, create_uid, create_date, write_uid, write_date FROM migrate.account_fiscal_position_account
WHERE NOT EXISTS (SELECT 1 FROM account_fiscal_position_account WHERE id=migrate.account_fiscal_position_account.id);
SELECT pg_catalog.setval('account_fiscal_position_account_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_fiscal_position_account) x;
ALTER TABLE account_fiscal_position_account ENABLE TRIGGER ALL;

ALTER TABLE account_journal_inbound_payment_method_rel DISABLE TRIGGER ALL;
INSERT INTO account_journal_inbound_payment_method_rel ( journal_id, inbound_payment_method )
SELECT journal_id, inbound_payment_method FROM migrate.account_journal_inbound_payment_method_rel
WHERE NOT EXISTS (SELECT 1 FROM account_journal_inbound_payment_method_rel WHERE journal_id=migrate.account_journal_inbound_payment_method_rel.journal_id AND inbound_payment_method=migrate.account_journal_inbound_payment_method_rel.inbound_payment_method);
ALTER TABLE account_journal_inbound_payment_method_rel ENABLE TRIGGER ALL;

ALTER TABLE account_journal_outbound_payment_method_rel DISABLE TRIGGER ALL;
INSERT INTO account_journal_outbound_payment_method_rel ( journal_id, outbound_payment_method )
SELECT journal_id, outbound_payment_method FROM migrate.account_journal_outbound_payment_method_rel
WHERE NOT EXISTS (SELECT 1 FROM account_journal_outbound_payment_method_rel WHERE journal_id=migrate.account_journal_outbound_payment_method_rel.journal_id AND outbound_payment_method=migrate.account_journal_outbound_payment_method_rel.outbound_payment_method);
ALTER TABLE account_journal_outbound_payment_method_rel ENABLE TRIGGER ALL;

ALTER TABLE account_tax_filiation_rel DISABLE TRIGGER ALL;
INSERT INTO account_tax_filiation_rel ( parent_tax, child_tax )
SELECT parent_tax, child_tax FROM migrate.account_tax_filiation_rel
WHERE NOT EXISTS (SELECT 1 FROM account_tax_filiation_rel WHERE parent_tax=migrate.account_tax_filiation_rel.parent_tax AND child_tax=migrate.account_tax_filiation_rel.child_tax);
ALTER TABLE account_tax_filiation_rel ENABLE TRIGGER ALL;

ALTER TABLE account_journal_account_reconcile_model_rel DISABLE TRIGGER ALL;
INSERT INTO account_journal_account_reconcile_model_rel ( account_reconcile_model_id, account_journal_id )
SELECT account_reconcile_model_id, account_journal_id FROM migrate.account_journal_account_reconcile_model_rel
WHERE NOT EXISTS (SELECT 1 FROM account_journal_account_reconcile_model_rel WHERE account_reconcile_model_id=migrate.account_journal_account_reconcile_model_rel.account_reconcile_model_id AND account_journal_id=migrate.account_journal_account_reconcile_model_rel.account_journal_id);
ALTER TABLE account_journal_account_reconcile_model_rel ENABLE TRIGGER ALL;

ALTER TABLE account_payment_term_line DISABLE TRIGGER ALL;
INSERT INTO account_payment_term_line ( id, value, value_amount, days, day_of_the_month, option, payment_id, sequence, create_uid, create_date, write_uid, write_date )
SELECT id, value, value_amount, days, day_of_the_month, option, payment_id, sequence, create_uid, create_date, write_uid, write_date FROM migrate.account_payment_term_line
WHERE NOT EXISTS (SELECT 1 FROM account_payment_term_line WHERE id=migrate.account_payment_term_line.id);
SELECT pg_catalog.setval('account_payment_term_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_payment_term_line) x;
ALTER TABLE account_payment_term_line ENABLE TRIGGER ALL;

ALTER TABLE account_fiscal_position DISABLE TRIGGER ALL;
INSERT INTO account_fiscal_position ( id, sequence, name, active, company_id, note, auto_apply, vat_required, country_id, country_group_id, zip_from, zip_to, create_uid, create_date, write_uid, write_date )
SELECT id, sequence, name, active, 1, note, auto_apply, vat_required, country_id, country_group_id, zip_from, zip_to, create_uid, create_date, write_uid, write_date FROM migrate.account_fiscal_position
WHERE NOT EXISTS (SELECT 1 FROM account_fiscal_position WHERE id=migrate.account_fiscal_position.id);
SELECT pg_catalog.setval('account_fiscal_position_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_fiscal_position) x;
ALTER TABLE account_fiscal_position ENABLE TRIGGER ALL;

ALTER TABLE account_payment_term DISABLE TRIGGER ALL;
INSERT INTO account_payment_term ( id, name, active, note, company_id, sequence, create_uid, create_date, write_uid, write_date )
SELECT id, name, active, note, company_id, sequence, create_uid, create_date, write_uid, write_date FROM migrate.account_payment_term
WHERE NOT EXISTS (SELECT 1 FROM account_payment_term WHERE id=migrate.account_payment_term.id);
SELECT pg_catalog.setval('account_payment_term_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_payment_term) x;
ALTER TABLE account_payment_term ENABLE TRIGGER ALL;

--ALTER TABLE account_reconcile_model DISABLE TRIGGER ALL;
--INSERT INTO account_reconcile_model ( id, name, sequence, company_id, rule_type, auto_reconcile, match_nature, match_amount, match_amount_min, match_amount_max, match_label, match_label_param, match_same_currency, match_total_amount, match_total_amount_param, match_partner, create_uid, create_date, write_uid, write_date )
--SELECT id, name, sequence, company_id, rule_type, auto_reconcile, match_nature, match_amount, match_amount_min, match_amount_max, match_label, match_label_param, match_same_currency, match_total_amount, match_total_amount_param, match_partner, create_uid, create_date, write_uid, write_date FROM migrate.account_reconcile_model
--WHERE NOT EXISTS (SELECT 1 FROM account_reconcile_model WHERE id=migrate.account_reconcile_model.id);
--SELECT pg_catalog.setval('account_reconcile_model_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_reconcile_model) x;
--ALTER TABLE account_reconcile_model ENABLE TRIGGER ALL;

ALTER TABLE account_move_line_account_tax_rel DISABLE TRIGGER ALL;
INSERT INTO account_move_line_account_tax_rel ( account_move_line_id, account_tax_id )
SELECT account_move_line_id, account_tax_id FROM migrate.account_move_line_account_tax_rel
WHERE NOT EXISTS (SELECT 1 FROM account_move_line_account_tax_rel WHERE account_move_line_id=migrate.account_move_line_account_tax_rel.account_move_line_id AND account_tax_id=migrate.account_move_line_account_tax_rel.account_tax_id);
ALTER TABLE account_move_line_account_tax_rel ENABLE TRIGGER ALL;

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

--ALTER TABLE account_bank_statement_line DISABLE TRIGGER ALL;
--INSERT INTO account_bank_statement_line ( id, statement_id, sequence, account_number, partner_name, amount, amount_currency, currency_id, partner_id, create_uid, create_date, write_uid, write_date, online_identifier, online_partner_vendor_name, online_partner_bank_account, unique_import_id )
--SELECT id, statement_id, sequence, account_number, partner_name, amount, amount_currency, currency_id, partner_id, create_uid, create_date, write_uid, write_date, online_identifier, online_partner_vendor_name, online_partner_bank_account, unique_import_id FROM migrate.account_bank_statement_line
--WHERE NOT EXISTS (SELECT 1 FROM account_bank_statement_line WHERE id=migrate.account_bank_statement_line.id);
--SELECT pg_catalog.setval('account_bank_statement_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_bank_statement_line) x;
--ALTER TABLE account_bank_statement_line ENABLE TRIGGER ALL;

--ALTER TABLE account_payment DISABLE TRIGGER ALL;
--INSERT INTO account_payment ( id, message_main_attachment_id, payment_method_id, amount, payment_type, partner_type, payment_reference, currency_id, partner_id, create_uid, create_date, write_uid, write_date, payment_transaction_id, payment_token_id )
--SELECT id, message_main_attachment_id, payment_method_id, amount, payment_type, partner_type, payment_reference, currency_id, partner_id, create_uid, create_date, write_uid, write_date, payment_transaction_id, payment_token_id FROM migrate.account_payment
--WHERE NOT EXISTS (SELECT 1 FROM account_payment WHERE id=migrate.account_payment.id);
--SELECT pg_catalog.setval('account_payment_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_payment) x;
--ALTER TABLE account_payment ENABLE TRIGGER ALL;

ALTER TABLE account_bank_statement DISABLE TRIGGER ALL;
INSERT INTO account_bank_statement ( id, message_main_attachment_id, name, reference, date, date_done, balance_start, balance_end_real, state, journal_id, company_id, total_entry_encoding, balance_end, difference, user_id, cashbox_start_id, cashbox_end_id, create_uid, create_date, write_uid, write_date )
SELECT id, message_main_attachment_id, name, reference, date, date_done, balance_start, balance_end_real, state, journal_id, company_id, total_entry_encoding, balance_end, difference, user_id, cashbox_start_id, cashbox_end_id, create_uid, create_date, write_uid, write_date FROM migrate.account_bank_statement
WHERE NOT EXISTS (SELECT 1 FROM account_bank_statement WHERE id=migrate.account_bank_statement.id);
SELECT pg_catalog.setval('account_bank_statement_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_bank_statement) x;
ALTER TABLE account_bank_statement ENABLE TRIGGER ALL;

ALTER TABLE account_account_type DISABLE TRIGGER ALL;
INSERT INTO account_account_type ( id, name, include_initial_balance, type, internal_group, note, create_uid, create_date, write_uid, write_date )
SELECT id, name, include_initial_balance, type, internal_group, note, create_uid, create_date, write_uid, write_date FROM migrate.account_account_type
WHERE NOT EXISTS (SELECT 1 FROM account_account_type WHERE id=migrate.account_account_type.id);
SELECT pg_catalog.setval('account_account_type_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_account_type) x;
ALTER TABLE account_account_type ENABLE TRIGGER ALL;

ALTER TABLE account_account_tag DISABLE TRIGGER ALL;
INSERT INTO account_account_tag ( id, name, applicability, color, active, create_uid, create_date, write_uid, write_date )
SELECT id, name, applicability, color, active, create_uid, create_date, write_uid, write_date FROM migrate.account_account_tag
WHERE NOT EXISTS (SELECT 1 FROM account_account_tag WHERE id=migrate.account_account_tag.id);
SELECT pg_catalog.setval('account_account_tag_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_account_tag) x;
ALTER TABLE account_account_tag ENABLE TRIGGER ALL;

ALTER TABLE account_tax_template_filiation_rel DISABLE TRIGGER ALL;
INSERT INTO account_tax_template_filiation_rel ( parent_tax, child_tax )
SELECT parent_tax, child_tax FROM migrate.account_tax_template_filiation_rel
WHERE NOT EXISTS (SELECT 1 FROM account_tax_template_filiation_rel WHERE parent_tax=migrate.account_tax_template_filiation_rel.parent_tax AND child_tax=migrate.account_tax_template_filiation_rel.child_tax);
ALTER TABLE account_tax_template_filiation_rel ENABLE TRIGGER ALL;

ALTER TABLE account_tax_group DISABLE TRIGGER ALL;
INSERT INTO account_tax_group ( id, name, sequence, create_uid, create_date, write_uid, write_date )
SELECT id, name, sequence, create_uid, create_date, write_uid, write_date FROM migrate.account_tax_group
WHERE NOT EXISTS (SELECT 1 FROM account_tax_group WHERE id=migrate.account_tax_group.id);
SELECT pg_catalog.setval('account_tax_group_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_tax_group) x;
ALTER TABLE account_tax_group ENABLE TRIGGER ALL;

ALTER TABLE account_fiscal_position_template DISABLE TRIGGER ALL;
INSERT INTO account_fiscal_position_template ( id, sequence, name, chart_template_id, note, auto_apply, vat_required, country_id, country_group_id, zip_from, zip_to, create_uid, create_date, write_uid, write_date )
SELECT id, sequence, name, chart_template_id, note, auto_apply, vat_required, country_id, country_group_id, zip_from, zip_to, create_uid, create_date, write_uid, write_date FROM migrate.account_fiscal_position_template
WHERE NOT EXISTS (SELECT 1 FROM account_fiscal_position_template WHERE id=migrate.account_fiscal_position_template.id);
SELECT pg_catalog.setval('account_fiscal_position_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_fiscal_position_template) x;
ALTER TABLE account_fiscal_position_template ENABLE TRIGGER ALL;

ALTER TABLE account_fiscal_position_tax_template DISABLE TRIGGER ALL;
INSERT INTO account_fiscal_position_tax_template ( id, position_id, tax_src_id, tax_dest_id, create_uid, create_date, write_uid, write_date )
SELECT id, position_id, tax_src_id, tax_dest_id, create_uid, create_date, write_uid, write_date FROM migrate.account_fiscal_position_tax_template
WHERE NOT EXISTS (SELECT 1 FROM account_fiscal_position_tax_template WHERE id=migrate.account_fiscal_position_tax_template.id);
SELECT pg_catalog.setval('account_fiscal_position_tax_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_fiscal_position_tax_template) x;
ALTER TABLE account_fiscal_position_tax_template ENABLE TRIGGER ALL;

ALTER TABLE account_fiscal_position_account_template DISABLE TRIGGER ALL;
INSERT INTO account_fiscal_position_account_template ( id, position_id, account_src_id, account_dest_id, create_uid, create_date, write_uid, write_date )
SELECT id, position_id, account_src_id, account_dest_id, create_uid, create_date, write_uid, write_date FROM migrate.account_fiscal_position_account_template
WHERE NOT EXISTS (SELECT 1 FROM account_fiscal_position_account_template WHERE id=migrate.account_fiscal_position_account_template.id);
SELECT pg_catalog.setval('account_fiscal_position_account_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_fiscal_position_account_template) x;
ALTER TABLE account_fiscal_position_account_template ENABLE TRIGGER ALL;

ALTER TABLE account_account_template DISABLE TRIGGER ALL;
INSERT INTO account_account_template ( id, name, currency_id, code, user_type_id, reconcile, note, nocreate, chart_template_id, create_uid, create_date, write_uid, write_date )
SELECT id, name, currency_id, code, user_type_id, reconcile, note, nocreate, chart_template_id, create_uid, create_date, write_uid, write_date FROM migrate.account_account_template
WHERE NOT EXISTS (SELECT 1 FROM account_account_template WHERE id=migrate.account_account_template.id);
SELECT pg_catalog.setval('account_account_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_account_template) x;
ALTER TABLE account_account_template ENABLE TRIGGER ALL;

ALTER TABLE account_tax_template DISABLE TRIGGER ALL;
INSERT INTO account_tax_template ( id, chart_template_id, name, type_tax_use, amount_type, active, sequence, amount, description, price_include, include_base_amount, analytic, tax_group_id, tax_exigibility, create_uid, create_date, write_uid, write_date )
SELECT id, chart_template_id, name, type_tax_use, amount_type, active, sequence, amount, description, price_include, include_base_amount, analytic, tax_group_id, tax_exigibility, create_uid, create_date, write_uid, write_date FROM migrate.account_tax_template
WHERE NOT EXISTS (SELECT 1 FROM account_tax_template WHERE id=migrate.account_tax_template.id);
SELECT pg_catalog.setval('account_tax_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_tax_template) x;
ALTER TABLE account_tax_template ENABLE TRIGGER ALL;

ALTER TABLE product_taxes_rel DISABLE TRIGGER ALL;
INSERT INTO product_taxes_rel ( prod_id, tax_id )
SELECT prod_id, tax_id FROM migrate.product_taxes_rel
WHERE NOT EXISTS (SELECT 1 FROM product_taxes_rel WHERE prod_id=migrate.product_taxes_rel.prod_id AND tax_id=migrate.product_taxes_rel.tax_id);
ALTER TABLE product_taxes_rel ENABLE TRIGGER ALL;

ALTER TABLE account_tax DISABLE TRIGGER ALL;
INSERT INTO account_tax ( id, name, type_tax_use, amount_type, active, company_id, sequence, amount, description, price_include, include_base_amount, analytic, tax_group_id, tax_exigibility, create_uid, create_date, write_uid, write_date )
SELECT id, name, type_tax_use, amount_type, active, company_id, sequence, amount, description, price_include, include_base_amount, analytic, tax_group_id, tax_exigibility, create_uid, create_date, write_uid, write_date FROM migrate.account_tax
WHERE NOT EXISTS (SELECT 1 FROM account_tax WHERE id=migrate.account_tax.id);
SELECT pg_catalog.setval('account_tax_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_tax) x;
ALTER TABLE account_tax ENABLE TRIGGER ALL;

ALTER TABLE product_supplier_taxes_rel DISABLE TRIGGER ALL;
INSERT INTO product_supplier_taxes_rel ( prod_id, tax_id )
SELECT prod_id, tax_id FROM migrate.product_supplier_taxes_rel
WHERE NOT EXISTS (SELECT 1 FROM product_supplier_taxes_rel WHERE prod_id=migrate.product_supplier_taxes_rel.prod_id AND tax_id=migrate.product_supplier_taxes_rel.tax_id);
ALTER TABLE product_supplier_taxes_rel ENABLE TRIGGER ALL;

ALTER TABLE account_chart_template DISABLE TRIGGER ALL;
INSERT INTO account_chart_template ( id, name, parent_id, code_digits, visible, currency_id, use_anglo_saxon, complete_tax_set, bank_account_code_prefix, cash_account_code_prefix, transfer_account_code_prefix, income_currency_exchange_account_id, expense_currency_exchange_account_id, property_account_receivable_id, property_account_payable_id, property_account_expense_categ_id, property_account_income_categ_id, property_account_expense_id, property_account_income_id, property_stock_account_input_categ_id, property_stock_account_output_categ_id, property_stock_valuation_account_id, create_uid, create_date, write_uid, write_date, spoken_languages )
SELECT id, name, parent_id, code_digits, visible, currency_id, use_anglo_saxon, complete_tax_set, bank_account_code_prefix, cash_account_code_prefix, transfer_account_code_prefix, income_currency_exchange_account_id, expense_currency_exchange_account_id, property_account_receivable_id, property_account_payable_id, property_account_expense_categ_id, property_account_income_categ_id, property_account_expense_id, property_account_income_id, property_stock_account_input_categ_id, property_stock_account_output_categ_id, property_stock_valuation_account_id, create_uid, create_date, write_uid, write_date, spoken_languages FROM migrate.account_chart_template
WHERE NOT EXISTS (SELECT 1 FROM account_chart_template WHERE id=migrate.account_chart_template.id);
SELECT pg_catalog.setval('account_chart_template_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_chart_template) x;
ALTER TABLE account_chart_template ENABLE TRIGGER ALL;

ALTER TABLE account_incoterms DISABLE TRIGGER ALL;
INSERT INTO account_incoterms ( id, name, code, active, create_uid, create_date, write_uid, write_date )
SELECT id, name, code, active, create_uid, create_date, write_uid, write_date FROM migrate.account_incoterms
WHERE NOT EXISTS (SELECT 1 FROM account_incoterms WHERE id=migrate.account_incoterms.id);
SELECT pg_catalog.setval('account_incoterms_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_incoterms) x;
ALTER TABLE account_incoterms ENABLE TRIGGER ALL;

ALTER TABLE res_currency DISABLE TRIGGER ALL;
INSERT INTO res_currency ( id, name, symbol, rounding, decimal_places, active, position, currency_unit_label, currency_subunit_label, create_uid, create_date, write_uid, write_date )
SELECT id, name, symbol, rounding, decimal_places, active, position, currency_unit_label, currency_subunit_label, create_uid, create_date, write_uid, write_date FROM migrate.res_currency
WHERE NOT EXISTS (SELECT 1 FROM res_currency WHERE id=migrate.res_currency.id);
SELECT pg_catalog.setval('res_currency_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM res_currency) x;
ALTER TABLE res_currency ENABLE TRIGGER ALL;

ALTER TABLE account_payment_method DISABLE TRIGGER ALL;
INSERT INTO account_payment_method ( id, name, code, payment_type, create_uid, create_date, write_uid, write_date )
SELECT id, name, code, payment_type, create_uid, create_date, write_uid, write_date FROM migrate.account_payment_method
WHERE NOT EXISTS (SELECT 1 FROM account_payment_method WHERE id=migrate.account_payment_method.id);
SELECT pg_catalog.setval('account_payment_method_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_payment_method) x;
ALTER TABLE account_payment_method ENABLE TRIGGER ALL;

--ALTER TABLE account_journal DISABLE TRIGGER ALL;
--INSERT INTO account_journal ( id, name, code, active, type, sequence, currency_id, company_id, refund_sequence, at_least_one_inbound, at_least_one_outbound, profit_account_id, loss_account_id, bank_account_id, bank_statements_source, alias_id, show_on_dashboard, color, create_uid, create_date, write_uid, write_date, account_online_journal_id, bank_statement_creation )
--SELECT id, name, code, active, type, sequence, currency_id, company_id, refund_sequence, at_least_one_inbound, at_least_one_outbound, profit_account_id, loss_account_id, bank_account_id, bank_statements_source, alias_id, show_on_dashboard, color, create_uid, create_date, write_uid, write_date, account_online_journal_id, bank_statement_creation FROM migrate.account_journal
--WHERE NOT EXISTS (SELECT 1 FROM account_journal WHERE id=migrate.account_journal.id);
--SELECT pg_catalog.setval('account_journal_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_journal) x;
--ALTER TABLE account_journal ENABLE TRIGGER ALL;

--ALTER TABLE account_move DISABLE TRIGGER ALL;
--INSERT INTO account_move ( id, name, date, ref, narration, state, journal_id, company_id, currency_id, partner_id, tax_cash_basis_rec_id, create_uid, create_date, write_uid, write_date, stock_move_id )
--SELECT id, name, date, ref, narration, state, journal_id, company_id, currency_id, partner_id, tax_cash_basis_rec_id, create_uid, create_date, write_uid, write_date, stock_move_id FROM migrate.account_move
--WHERE NOT EXISTS (SELECT 1 FROM account_move WHERE id=migrate.account_move.id);
--SELECT pg_catalog.setval('account_move_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_move) x;
--ALTER TABLE account_move ENABLE TRIGGER ALL;
--
--ALTER TABLE account_move_line DISABLE TRIGGER ALL;
--INSERT INTO account_move_line ( id, move_id, date, ref, journal_id, company_id, company_currency_id, account_id, name, quantity, debit, credit, balance, amount_currency, reconciled, blocked, date_maturity, currency_id, partner_id, product_uom_id, product_id, payment_id, statement_line_id, statement_id, tax_line_id, tax_base_amount, tax_exigible, amount_residual, amount_residual_currency, full_reconcile_id, analytic_account_id, create_uid, create_date, write_uid, write_date, expected_pay_date, internal_note, next_action_date, followup_line_id, followup_date )
--SELECT id, move_id, date, ref, journal_id, company_id, company_currency_id, account_id, name, quantity, debit, credit, balance, amount_currency, reconciled, blocked, date_maturity, currency_id, partner_id, product_uom_id, product_id, payment_id, statement_line_id, statement_id, tax_line_id, tax_base_amount, tax_exigible, amount_residual, amount_residual_currency, full_reconcile_id, analytic_account_id, create_uid, create_date, write_uid, write_date, expected_pay_date, internal_note, next_action_date, followup_line_id, followup_date FROM migrate.account_move_line
--WHERE NOT EXISTS (SELECT 1 FROM account_move_line WHERE id=migrate.account_move_line.id);
--SELECT pg_catalog.setval('account_move_line_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_move_line) x;
--ALTER TABLE account_move_line ENABLE TRIGGER ALL;
--
--ALTER TABLE account_account DISABLE TRIGGER ALL;
--INSERT INTO account_account ( id, name, currency_id, code, deprecated, user_type_id, internal_type, internal_group, reconcile, note, company_id, group_id, create_uid, create_date, write_uid, write_date )
--SELECT id, name, currency_id, code, deprecated, user_type_id, internal_type, internal_group, reconcile, note, company_id, group_id, create_uid, create_date, write_uid, write_date FROM migrate.account_account
--WHERE NOT EXISTS (SELECT 1 FROM account_account WHERE id=migrate.account_account.id);
--SELECT pg_catalog.setval('account_account_id_seq', MAX_NUM, true) FROM (SELECT max(id) as MAX_NUM FROM account_account) x;
--ALTER TABLE account_account ENABLE TRIGGER ALL;
