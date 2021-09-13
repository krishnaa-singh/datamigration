from __future__ import print_function

import logging
import psycopg2


logger = logging.getLogger(__name__)


def get_dest_connection():
    conn = psycopg2.connect(database='stellar_14_1', user='odoo', password='odoo', host='127.0.0.1', port='5432')
    print('stellar_14_1 Database connected')
    return conn


def get_src_connection():
    conn = psycopg2.connect(database='stellar_12_1', user='odoo', password='odoo', host='127.0.0.1', port='5432')
    print('stellar_12_1 Database connected')
    return conn


def manage_move_lines(self):
    all_move_line = self.env['account.move.line'].sudo().search([('parent_state', '=', 'posted')])
    for move in all_move_line:
        if move.product_id:
            balance = -(move.balance) if move.balance < 0 else (move.balance)
            qty = move.quantity
            without_tax = balance - move.tax_base_amount
            print(move.id, balance/qty, balance )
            move.with_context(check_move_validity=False).write({
                "price_unit": without_tax / qty,
                "price_subtotal": balance
            })
        else:
            move.with_context(check_move_validity=False).write({
                "exclude_from_invoice_tab": True
            })


def manage_moves(self):
    all_moves = self.env['account.move'].sudo().search([])
    conn = get_src_connection()
    cur = conn.cursor()
    for move in all_moves:
        cur.execute("""SELECT state FROM account_invoice where move_id=%s""" % move.id)
        result = cur.fetchall()
        # print(result)
        move.payment_id = move.invoice_line_ids.payment_id
        if result:
            state = result[0][0]
            if state == 'open':
                move.payment_state = 'not_paid'
                print('open', move.id)
            elif state == 'paid':
                # print('cancel', move.id)
                move.payment_state = 'paid'
            elif state == 'cancel':
                pass
    for move in all_moves:
        move._compute_amount()
        move._compute_payments_widget_reconciled_info()


def update_ir_property(self):
    ir_properties = self.env['ir.property'].sudo().search([('res_id', '!=', False)])
    for prop in ir_properties:
        p = prop.res_id.split(',')
        odoo_field = self.env['ir.model.fields'].sudo().search([('name', '=', prop.name),
                                                           ('model', '=', p[0])])
        if odoo_field:
            prop.fields_id = odoo_field.id


