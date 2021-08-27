#!/bin/bash
set -e

CUR_DIR=$(pwd)

DB_HOST="127.0.0.1"
DB_PORT=5432
DB_USER="odoo"
DB_PASSWD="odoo"
DB_NAME="stellar_pro"
INIT_MODULES="base,mail,sale_management,sale,crm,website,purchase,accounting,account_accountant,barcode,dashboard,calendar,stock,l10n_ca,website_sale,website_sale_coupon,studio_customization,delivery,sale_margin,stock_barcode,stock_account"

ENV_PATH="/home/ksolves/stellar/bin"
PYTHON_ENV_PATH="${ENV_PATH}/python"

SOURCE_DB_TEST="${DB_NAME}_test"
DESTINATION_DB_TEMP="${DB_NAME}_final"
ODOO="$PYTHON_ENV_PATH /home/ksolves/odoo-erp/odoo14/odoo/odoo-bin"

#ODOO="/home/ksolves/odoo-erp/odoo14/odoo/odoo-bin"
ODOO_DIR="/home/ksolves/odoo-erp/odoo14"
ODOO_SOURCE="$ODOO_DIR/odoo/addons,$ODOO_DIR/odoo/odoo/addons"
# Change var name to addons_path
Enterprise="$ODOO_DIR/enterprise-14.0"
#CUSTOM_ADDONS="$Enterprise,$ODOO_DIR/addons/ReNu14/custom_addons,$ODOO_DIR/addons/ReNu14/custom_addons/field_image_editor,$ODOO_DIR/addons/ReNu14/migrated_oca,$ODOO_DIR/addons/ReNu14/custom_theme,$ODOO_DIR/addons/ReNu14/OCA/crm,$ODOO_DIR/addons/ReNu14/OCA/field-service,$ODOO_DIR/addons/ReNu14/OCA/hr,$ODOO_DIR/addons/ReNu14/OCA/hr-attendance,$ODOO_DIR/addons/ReNu14/OCA/partner-contact,$ODOO_DIR/addons/ReNu14/OCA/product-attribute,$ODOO_DIR/addons/ReNu14/OCA/project,$ODOO_DIR/addons/ReNu14/OCA/server-env,$ODOO_DIR/addons/ReNu14/OCA/social,$ODOO_DIR/addons/ReNu14/OCA/web,$ODOO_DIR/addons/ReNu14/OCA/website,$ODOO_DIR/addons/ReNu14"
CUSTOM_ADDONS="$Enterprise,/home/ksolves/odoo-erp/stellar/swinc20619"

echo "Defined Variables List : "
echo "------------------------------------------------"
echo "Current Directory : $CUR_DIR"
echo "DB User : $DB_USER"
echo "DB Name : $DB_NAME"
echo "Temp DB  : $DESTINATION_DB_TEMP"
echo "Odoo Directory : $ODOO_DIR"
echo "Odoo Source Directory : $ODOO_SOURCE"
echo "Odoo Executable Path : $ODOO"
echo "Odoo ADDONS Directory : $CUSTOM_ADDONS"
echo "------------------------------------------------"

echo "Prepare Source DB dump"

echo "$DB_HOST:$DB_PORT:*:$DB_USER:$DB_PASSWD" > ~/.pgpass
chmod 0600 ~/.pgpass

echo
echo "DROP DB $SOURCE_DB_TEST if exist "
dropdb -h $DB_HOST -p $DB_PORT -U $DB_USER $SOURCE_DB_TEST --if-exists

echo
echo "Make a copy of Production Database"
createdb -h $DB_HOST -p $DB_PORT -U $DB_USER -T $DB_NAME $SOURCE_DB_TEST

echo
echo "DROP DB $DESTINATION_DB_TEMP if exist "
dropdb -h $DB_HOST -p $DB_PORT -U $DB_USER $DESTINATION_DB_TEMP --if-exists

echo
echo "Creating new database $DESTINATION_DB_TEMP ..."
createdb -h $DB_HOST -p $DB_PORT -U $DB_USER $DESTINATION_DB_TEMP

echo
echo "Database $DESTINATION_DB_TEMP created"
echo

echo "Executing Odoo using command "
echo "$ODOO --db_host=$DB_HOST --db_port=$DB_PORT -d $DESTINATION_DB_TEMP -r $DB_USER -w $DB_PASSWD --stop-after-init --without-demo=all --addons-path="$ODOO_SOURCE,$CUSTOM_ADDONS" --init=$INIT_MODULES"
echo

$ODOO --db_host=$DB_HOST --db_port=$DB_PORT -d $DESTINATION_DB_TEMP -r $DB_USER -w $DB_PASSWD --stop-after-init --without-demo=all --addons-path="$ODOO_SOURCE,$CUSTOM_ADDONS" --init=$INIT_MODULES

echo
echo "$DESTINATION_DB_TEMP used in Odoo"

#source $ENV_PATH/activate
# # result=`python ./table-script-python.py $DB_HOST $DB_USER $DB_PASSWD $DB_PORT $SOURCE_DB_TEST $CUR_DIR`
# result=$(python $CUR_DIR/table-script-python.py $DB_HOST $DB_USER $DB_PASSWD $DB_PORT $SOURCE_DB_TEST $CUR_DIR)
# echo "${result}"
# echo "End of python table script"

echo ""; echo "Move $SOURCE_DB_TEST table to schema migrate"
psql -h $DB_HOST -p $DB_PORT --set=ON_ERROR_STOP= -1 -qf 01-sql-script.sql -U $DB_USER $SOURCE_DB_TEST

echo
echo "Save schema migrate"
pg_dump -h $DB_HOST -p $DB_PORT -U $DB_USER $SOURCE_DB_TEST -n migrate |gzip>migrate.sql.gz

echo "Load Source DB init dump"
pg_dump -h $DB_HOST -p $DB_PORT -U $DB_USER $DESTINATION_DB_TEMP | \
grep -v -e "SET statement_timeout" | \
grep -v -e "SET lock_timeout" | \
grep -v -e "SET idle_in_transaction_session_timeout" | \
grep -v -e "SET client_encoding" | \
grep -v -e "SET standard_conforming_strings" | \
grep -v -e "SET check_function_bodies" | \
grep -v -e "SET client_min_messages" | \
grep -v -e "SET row_security" | \
grep -v "EXTENSION" | psql -h $DB_HOST -p $DB_PORT -1 -q --set=ON_ERROR_STOP= -U $DB_USER $SOURCE_DB_TEST >/dev/null

echo "Start of preparing 2nd column script"
#source $ENV_PATH/activate
# result=$(python $CUR_DIR/column-script-python.py $DB_HOST $DB_USER $DB_PASSWD $DB_PORT $DB_NAME $CUR_DIR $DESTINATION_DB_TEMP)
# echo "${result}"
# echo "End of preparing 2nd column script"

echo "Dropping $DESTINATION_DB_TEMP"
dropdb -h $DB_HOST -p $DB_PORT -U $DB_USER $DESTINATION_DB_TEMP --if-exists

echo "Transfer Source DB data into Destination DB"
psql -h $DB_HOST -p $DB_PORT --set=ON_ERROR_STOP= -1 -qf 02-sql-script.sql -U $DB_USER $SOURCE_DB_TEST
echo "Final Migration Script Execution Done"

# # echo "Drop migrate schema"
# psql -h $DB_HOST -p $DB_PORT --set=ON_ERROR_STOP= -1 -c "DROP SCHEMA migrate CASCADE;" -U $DB_USER $SOURCE_DB_TEST

# echo "Name of custom modules need to install: "
# read answer
# if [ "$answer" ] ;then
# 	echo "Install Custom modules ......"
# 	echo $ODOO --db_host=$DB_HOST --db_port=$DB_PORT -d $SOURCE_DB_TEST -r $DB_USER -w $DB_PASSWD --stop-after-init --without-demo=all --addons-path="$ODOO_SOURCE,$CUSTOM_ADDONS" --init=base,$answer

#   $ODOO --db_host=$DB_HOST --db_port=$DB_PORT -d $SOURCE_DB_TEST -r $DB_USER -w $DB_PASSWD --stop-after-init --without-demo=all --addons-path="$ODOO_SOURCE,$CUSTOM_ADDONS" --init=base,$answer
# 	echo "Custom modules installation done ......"
# fi

# echo
# zcat migrate.sql.gz | \
# grep -v -e "SET statement_timeout" | \
# grep -v -e "SET lock_timeout" | \
# grep -v -e "SET idle_in_transaction_session_timeout" | \
# grep -v -e "SET client_encoding" | \
# grep -v -e "SET standard_conforming_strings" | \
# grep -v -e "SET check_function_bodies" | \
# grep -v -e "SET client_min_messages" | \
# grep -v -e "SET row_security" | \
# grep -v "EXTENSION" | psql -h $DB_HOST -p $DB_PORT --set=ON_ERROR_STOP= -1 -q -U $DB_USER $SOURCE_DB_TEST

# #source $ENV_PATH/activate
# result=$(python $CUR_DIR/column-script-python.py $DB_HOST $DB_USER $DB_PASSWD $DB_PORT $DB_NAME $CUR_DIR $DESTINATION_DB_TEMP)
# echo "${result}"
# echo "End of python column script"

echo
echo "Executing final migration script ..."
psql -h $DB_HOST -p $DB_PORT --set=ON_ERROR_STOP= -1 -qf final-sql-script.sql -U $DB_USER $SOURCE_DB_TEST
echo "Final Migration Script Execution Done"

echo "Drop migrate schema"
psql -h $DB_HOST -p $DB_PORT --set=ON_ERROR_STOP= -1 -c "DROP SCHEMA migrate CASCADE;" -U $DB_USER $SOURCE_DB_TEST

echo "Want to update all Y/N: "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
	echo "Update all modules into V13 ......"
	$ODOO --db_host=$DB_HOST --db_port=$DB_PORT -d $SOURCE_DB_TEST -r $DB_USER -w $DB_PASSWD --stop-after-init --without-demo=all --addons-path="$ODOO_SOURCE" --update=all

	$ODOO --db_host=$DB_HOST --db_port=$DB_PORT -d $SOURCE_DB_TEST -r $DB_USER -w $DB_PASSWD --stop-after-init --without-demo=all --addons-path="$ODOO_SOURCE" --update=all
	echo "Update all Done in V13 ......"
fi

rm -f migrate.sql.gz

echo "Done"


# base,renu_base,renu_portal,renu_custom_fsm,renu_custom_homepage,renu_custom_features,contacts_maps,studio_customization