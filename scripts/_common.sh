#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="sqlite3 haveged schleuder schleuder-cli zlibc zlib1g libxml2 libxml2-dev zlib1g-dev ruby ruby-dev git gcc g++ make libsqlite3-dev"


### Define which playbooks should be run:
schleuder_install_web="True"
schleuder_install_cli="True"
schleuder_install_gitlab_ticket_plugin="False"

### schleuder vars:
schleuder_schleuder_user="schleuder"
schleuder_gpg_use_tor="False"
schleuder_gpg_tor_keyserver="hkp://zkaan2xfbuxia2wpf7ofnkbz6r5zdbbvxbunvp5g2iebopbfc4iqmbad.onion"
schleuder_admin_keys_path="/var/lib/schleuder/adminkeys"

schleuder_lists=("")
# - name: foobar@cryptolists.systemli.org
#   admin: admin@systemli.org
#   # be sure to copy public_key of list admin to
#   # files/schleuder/adminkeys/{{ name }}_{{ admin }}.pub
#   # else set admin_pubkey_present to false
#   # ---
#   send_list_key: True
#   present: True
#   # ---
#   admin_pubkey_present: True
#   # if admin_pubkey_present is set to false
#   schleuder list will be created, but is not functional

### schleuder-web vars:
schleuder_schleuder_web_repo="https://0xacab.org/schleuder/schleuder-web"
schleuder_schleuder_web_home="/var/www/schleuder-web"
schleuder_schleuder_web_user="schleuder-web"
schleuder_schleuder_web_path="$schleuder_schleuder_web_home/$schleuder_schleuder_web_user"
schleuder_schleuder_web_systemd_path="/etc/systemd/system/schleuder-web.service"
schleuder_schleuder_web_environment_vars_path="/etc/default/schleuder-web"
# set to false will make rails server listen on localhost only
schleuder_schleuder_web_allow_access_from_outside="True"

### schleuder-gitlab-ticketing-plugin vars:
schleuder_gitlab_plugin_path="/opt/local/gitlab-ticketing"
schleuder_gitlab_plugin_repo="https://0xacab.org/schleuder/schleuder-gitlab-ticketing"
schleuder_gitlab_plugin_git_update="False"

### schleuder-cli vars:
schleuder_cli_path="/admin/.schleuder-cli"

###### File Section

### schleuder/schleuder.yml.j2
schleuder_lists_dir="/var/lib/schleuder/lists"
schleuder_listlogs_dir="/var/lib/schleuder/lists"
schleuder_plugins_dir="/etc/schleuder/plugins"
schleuder_filters_dir="/usr/local/lib/schleuder/filters"
schleuder_log_level="warn"
schleuder_keyserver="hkps://keys.openpgp.org" 
schleuder_superadmin="admin@localhost"
#schleuder_smtp_settings:
  schleuder_smtp_settings_address="localhost"
  schleuder_smtp_settings_port="25"
  # domain:
  # enable_starttls_auto:
  # openssl_verify_mode:
  # authentication:
  # user_name:
  # password:
schleuder_database_production_adapter="'sqlite3'"
schleuder_database_production_database="var/lib/schleuder/db.sqlite"
schleuder_database_production_pool="5"
schleuder_database_production_timeout="5000"
#schleuder_api:
schleuder_api_host="localhost"
schleuder_api_port="4443"
  # Certificate and key to use. You can create new ones with `schleuder cert generate`.
  tls_cert_file="/etc/schleuder/schleuder-certificate.pem"
  tls_key_file="/etc/schleuder/schleuder-private-key.pem"

# List of api_keys to allow access to the API.
# Example:
# valid_api_keys:
#   - abcdef...
#   - zyxwvu...
schleuder_valid_api_keys=("")


### schleuder/list-defaults.yml.j2
schleuder_send_encrypted_only="true"
schleuder_receive_encrypted_only="true"
schleuder_receive_signed_only="false"
schleuder_receive_authenticated_only="false"
schleuder_receive_from_subscribed_emailaddresses_only="true"
schleuder_receive_admin_only="false"
schleuder_headers_to_meta=("from" "to" "cc" "date" "sig" "enc")
schleuder_keep_msgid="true"
schleuder_keywords_admin_only=("subscribe" "unsubscribe" "delete-key" )
schleuder_keywords_admin_notify=("add-key")
schleuder_internal_footer=""
schleuder_public_footer=""
schleuder_subject_prefix=""
schleuder_subject_prefix_in=""
schleuder_subject_prefix_out=""
schleuder_bounces_drop_all="false"
schleuder_bounces_drop_on_headers=([x-spam-flag]="yes" )
schleuder_bounces_notify_admins="true"
schleuder_include_list_headers="true"
schleuder_include_openpgp_header="true"
schleuder_openpgp_header_preference="signencrypt"
schleuder_max_message_size_kb="10240"
schleuder_lists_log_level="warn"
schleuder_logfiles_to_keep="2"
# Available: en, de.
schleuder_language="en"
schleuder_forward_all_incoming_to_admins="false"

### schleuder-web/database.yml
# schleuder-web uses it's own database to store user credentials
schleuder_web_database_production_adapter="'sqlite3'"
schleuder_web_database_production_database="db/production.sqlite"
schleuder_web_database_production_pool="5"
schleuder_web_database_production_timeout="5000"

### schleuder-web/schleuder-web.yml
schleuder_web_web_hostname="example.org"
schleuder_web_mailer_from="noreply@example.org"
schleuder_web_superadmins=( "$schleuder_superadmin" )

schleuder_web_version= "debian/buster/0.0.3"
#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
