--
-- PostgreSQL database dump
--

-- Dumped from database version 13.22 (Debian 13.22-1.pgdg13+1)
-- Dumped by pg_dump version 14.18 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer,
    version integer DEFAULT 0
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL,
    description character varying(255)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: org; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO keycloak;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: server_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.server_config (
    server_config_key character varying(255) NOT NULL,
    value text NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.server_config OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Name: workflow_state; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.workflow_state (
    execution_id character varying(255) NOT NULL,
    resource_id character varying(255) NOT NULL,
    workflow_id character varying(255) NOT NULL,
    workflow_provider_id character varying(255),
    resource_type character varying(255),
    scheduled_step_id character varying(255),
    scheduled_step_timestamp bigint
);


ALTER TABLE public.workflow_state OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
c45bd6c4-4549-483b-a718-3dcd4eded157	1c1f43df-4512-4896-808a-aab838f66a45
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
9e0cf61f-c036-4cdf-af6e-1abe65b29c46	\N	auth-cookie	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	7d23c3e4-e6d2-407e-a751-384cdfa45ba0	2	10	f	\N	\N
c0044f37-6464-4f67-bd8e-2352b69cf2ed	\N	auth-spnego	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	7d23c3e4-e6d2-407e-a751-384cdfa45ba0	3	20	f	\N	\N
ca6f6644-522a-4b95-b49d-183c7cfcede5	\N	identity-provider-redirector	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	7d23c3e4-e6d2-407e-a751-384cdfa45ba0	2	25	f	\N	\N
086087ea-4011-4e37-b4be-aec4e36471f4	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	7d23c3e4-e6d2-407e-a751-384cdfa45ba0	2	30	t	b2e4b39a-aacd-4b87-831e-168b8e3c8f0b	\N
7524f5ee-7d85-4ab5-9478-f5c7dd9d7408	\N	auth-username-password-form	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	b2e4b39a-aacd-4b87-831e-168b8e3c8f0b	0	10	f	\N	\N
a8352312-bd24-4ea1-9e9c-1574e8cc3ca2	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	b2e4b39a-aacd-4b87-831e-168b8e3c8f0b	1	20	t	5e1a8390-c9f7-4c9e-8428-8d6060bfa57a	\N
970bbc32-60d7-4450-b645-b730de3de4b4	\N	conditional-user-configured	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5e1a8390-c9f7-4c9e-8428-8d6060bfa57a	0	10	f	\N	\N
9d707585-f441-43cb-b357-758505f7d62d	\N	conditional-credential	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5e1a8390-c9f7-4c9e-8428-8d6060bfa57a	0	20	f	\N	647888ce-36a3-4d27-9c39-e7e319da9ee8
05ff472e-e1b6-44ed-921c-26727ad62fa8	\N	auth-otp-form	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5e1a8390-c9f7-4c9e-8428-8d6060bfa57a	2	30	f	\N	\N
1809be54-afb0-42b9-81ad-884d24030975	\N	webauthn-authenticator	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5e1a8390-c9f7-4c9e-8428-8d6060bfa57a	3	40	f	\N	\N
e775ab30-a00d-467f-aca7-436213f360c0	\N	auth-recovery-authn-code-form	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5e1a8390-c9f7-4c9e-8428-8d6060bfa57a	3	50	f	\N	\N
994baa2b-4e7c-40c5-ab80-84d1e6e338dc	\N	direct-grant-validate-username	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5a703da1-1a27-4a50-bb7c-27f1ec7fd7a3	0	10	f	\N	\N
1767dc37-b64f-496d-8405-afd5cb698362	\N	direct-grant-validate-password	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5a703da1-1a27-4a50-bb7c-27f1ec7fd7a3	0	20	f	\N	\N
3a8289b5-4eb4-4c36-b70c-a17d32c8c000	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5a703da1-1a27-4a50-bb7c-27f1ec7fd7a3	1	30	t	bb21e96d-f942-4fcb-9fab-e1ec30d60f03	\N
024dea99-4acf-4949-915d-41aec03d115f	\N	conditional-user-configured	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	bb21e96d-f942-4fcb-9fab-e1ec30d60f03	0	10	f	\N	\N
1fd4fb91-5aaa-458a-8fd5-453fcac57d26	\N	direct-grant-validate-otp	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	bb21e96d-f942-4fcb-9fab-e1ec30d60f03	0	20	f	\N	\N
fe2ca97f-8cfa-403f-8d2e-9abdd0d3e75a	\N	registration-page-form	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	23c085dd-b3f8-40ea-8b2f-8f2efdb0b108	0	10	t	e7481e92-ac4c-46ac-9fc9-be9d79de60d0	\N
8668bfb8-1da9-4521-b86d-e7f439dddc65	\N	registration-user-creation	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	e7481e92-ac4c-46ac-9fc9-be9d79de60d0	0	20	f	\N	\N
ac4983b5-c6dc-467b-b75e-5f40dee34f4f	\N	registration-password-action	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	e7481e92-ac4c-46ac-9fc9-be9d79de60d0	0	50	f	\N	\N
7cb2d508-7220-4792-845c-e3ad9760c181	\N	registration-recaptcha-action	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	e7481e92-ac4c-46ac-9fc9-be9d79de60d0	3	60	f	\N	\N
f570213e-e9d2-48af-b41c-8adc2727fff2	\N	registration-terms-and-conditions	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	e7481e92-ac4c-46ac-9fc9-be9d79de60d0	3	70	f	\N	\N
96e1870d-9d71-4d3f-86af-7f8646211dde	\N	reset-credentials-choose-user	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0514e74e-880e-419b-9660-dd916072e9f1	0	10	f	\N	\N
8a4c900d-240c-42ea-baef-e9550ec369da	\N	reset-credential-email	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0514e74e-880e-419b-9660-dd916072e9f1	0	20	f	\N	\N
a3d445b1-0941-408f-be41-b55b00711751	\N	reset-password	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0514e74e-880e-419b-9660-dd916072e9f1	0	30	f	\N	\N
55de49fa-07a8-414f-9633-cacd0a58e339	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0514e74e-880e-419b-9660-dd916072e9f1	1	40	t	156193e5-dbb7-4802-8379-a8803f786232	\N
ba4da419-a980-4dac-8625-fbe93f905bb3	\N	conditional-user-configured	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	156193e5-dbb7-4802-8379-a8803f786232	0	10	f	\N	\N
0d1e3cdb-9807-4874-acc0-9127ed2a4257	\N	reset-otp	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	156193e5-dbb7-4802-8379-a8803f786232	0	20	f	\N	\N
6d36e78b-2be3-4a73-80dd-cc59415d0497	\N	client-secret	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	6c3bda06-ca34-43ea-8d44-9a4ae49d872e	2	10	f	\N	\N
054037e5-539e-47c3-854c-3643f5e2aa85	\N	client-jwt	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	6c3bda06-ca34-43ea-8d44-9a4ae49d872e	2	20	f	\N	\N
1ec8e219-aac6-4eeb-bc35-fd621095d44b	\N	client-secret-jwt	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	6c3bda06-ca34-43ea-8d44-9a4ae49d872e	2	30	f	\N	\N
cf878385-44fa-4e44-ac54-403dd64eda1b	\N	client-x509	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	6c3bda06-ca34-43ea-8d44-9a4ae49d872e	2	40	f	\N	\N
efc8d98e-2646-4cd9-812d-0bd7eb510645	\N	idp-review-profile	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5e7fadc4-3c0b-4e69-9f3d-462f8d06077d	0	10	f	\N	fcb26645-1aa6-4acf-a756-5d1d4d741ba2
45eab07c-910b-42f8-841f-a28241c5632c	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5e7fadc4-3c0b-4e69-9f3d-462f8d06077d	0	20	t	47a41157-3aad-456e-8068-1d2ebcd1ae5f	\N
95995007-712b-4c40-b088-340d2e0d51dd	\N	idp-create-user-if-unique	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	47a41157-3aad-456e-8068-1d2ebcd1ae5f	2	10	f	\N	7cdd210a-974c-4993-9479-ffa7d51cb026
a57b1b19-5ff8-475c-bfe2-0d736b97c1ce	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	47a41157-3aad-456e-8068-1d2ebcd1ae5f	2	20	t	ad4ce01d-479f-4cb3-aae9-f460b8a3c264	\N
51f917d2-0767-497e-81f1-5ce8b350a3ea	\N	idp-confirm-link	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	ad4ce01d-479f-4cb3-aae9-f460b8a3c264	0	10	f	\N	\N
9e3146ba-a7cc-4912-9e69-0f6dc9ee023c	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	ad4ce01d-479f-4cb3-aae9-f460b8a3c264	0	20	t	c76bd8df-6fec-4cd7-ad07-fa0748f0cb99	\N
a867a6f4-94dd-44e2-b690-d33f013c6413	\N	idp-email-verification	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	c76bd8df-6fec-4cd7-ad07-fa0748f0cb99	2	10	f	\N	\N
be433f48-113c-4ff0-af7c-3b790889c09f	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	c76bd8df-6fec-4cd7-ad07-fa0748f0cb99	2	20	t	7a6c94b2-754f-4199-a3ae-69537dc0f75f	\N
f8fc26f0-3a09-4dd7-b284-29e64dfe736b	\N	idp-username-password-form	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	7a6c94b2-754f-4199-a3ae-69537dc0f75f	0	10	f	\N	\N
7a63729e-9b74-4b85-b36f-3400e9fec56d	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	7a6c94b2-754f-4199-a3ae-69537dc0f75f	1	20	t	9cc919be-4147-4bc1-a8c7-095af4f317ee	\N
9b9d5cc4-9435-4461-9522-22e01e9e39dc	\N	conditional-user-configured	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	9cc919be-4147-4bc1-a8c7-095af4f317ee	0	10	f	\N	\N
f0a3618e-910c-4acc-9e23-258e04d8aeae	\N	conditional-credential	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	9cc919be-4147-4bc1-a8c7-095af4f317ee	0	20	f	\N	61b2c8a1-5754-4c84-86f8-34e5c8f19027
c51b87de-be1b-46d0-aaa0-86e227666ecb	\N	auth-otp-form	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	9cc919be-4147-4bc1-a8c7-095af4f317ee	2	30	f	\N	\N
c400dbe3-7f81-4ded-b613-f09ffec63d09	\N	webauthn-authenticator	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	9cc919be-4147-4bc1-a8c7-095af4f317ee	3	40	f	\N	\N
08853c92-0465-4a71-8a9d-126f5ab50851	\N	auth-recovery-authn-code-form	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	9cc919be-4147-4bc1-a8c7-095af4f317ee	3	50	f	\N	\N
aeb77a7d-441d-47ce-b10c-7162416d20f3	\N	http-basic-authenticator	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	838aec13-082d-4946-bc9a-44ca39553f40	0	10	f	\N	\N
8ebea029-2c1d-4650-a8b8-5c73d22cf176	\N	docker-http-basic-authenticator	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0e24b5d8-5c42-425b-8218-1e70a55a21c5	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
7d23c3e4-e6d2-407e-a751-384cdfa45ba0	browser	Browser based authentication	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	t	t
b2e4b39a-aacd-4b87-831e-168b8e3c8f0b	forms	Username, password, otp and other auth forms.	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
5e1a8390-c9f7-4c9e-8428-8d6060bfa57a	Browser - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
5a703da1-1a27-4a50-bb7c-27f1ec7fd7a3	direct grant	OpenID Connect Resource Owner Grant	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	t	t
bb21e96d-f942-4fcb-9fab-e1ec30d60f03	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
23c085dd-b3f8-40ea-8b2f-8f2efdb0b108	registration	Registration flow	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	t	t
e7481e92-ac4c-46ac-9fc9-be9d79de60d0	registration form	Registration form	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	form-flow	f	t
0514e74e-880e-419b-9660-dd916072e9f1	reset credentials	Reset credentials for a user if they forgot their password or something	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	t	t
156193e5-dbb7-4802-8379-a8803f786232	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
6c3bda06-ca34-43ea-8d44-9a4ae49d872e	clients	Base authentication for clients	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	client-flow	t	t
5e7fadc4-3c0b-4e69-9f3d-462f8d06077d	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	t	t
47a41157-3aad-456e-8068-1d2ebcd1ae5f	User creation or linking	Flow for the existing/non-existing user alternatives	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
ad4ce01d-479f-4cb3-aae9-f460b8a3c264	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
c76bd8df-6fec-4cd7-ad07-fa0748f0cb99	Account verification options	Method with which to verity the existing account	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
7a6c94b2-754f-4199-a3ae-69537dc0f75f	Verify Existing Account by Re-authentication	Reauthentication of existing account	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
9cc919be-4147-4bc1-a8c7-095af4f317ee	First broker login - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	f	t
838aec13-082d-4946-bc9a-44ca39553f40	saml ecp	SAML ECP Profile Authentication Flow	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	t	t
0e24b5d8-5c42-425b-8218-1e70a55a21c5	docker auth	Used by Docker clients to authenticate against the IDP	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
647888ce-36a3-4d27-9c39-e7e319da9ee8	browser-conditional-credential	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a
fcb26645-1aa6-4acf-a756-5d1d4d741ba2	review profile config	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a
7cdd210a-974c-4993-9479-ffa7d51cb026	create unique user config	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a
61b2c8a1-5754-4c84-86f8-34e5c8f19027	first-broker-login-conditional-credential	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
61b2c8a1-5754-4c84-86f8-34e5c8f19027	webauthn-passwordless	credentials
647888ce-36a3-4d27-9c39-e7e319da9ee8	webauthn-passwordless	credentials
7cdd210a-974c-4993-9479-ffa7d51cb026	false	require.password.update.after.registration
fcb26645-1aa6-4acf-a756-5d1d4d741ba2	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
1c878a59-a322-4371-af0e-27aeb921ae71	t	f	master-realm	0	f	\N	\N	t	\N	f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
fdb23330-26e2-450f-9183-53f9ededdd52	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
214a24a6-aca5-4974-852f-6ef4b07c7f8f	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	t	f	broker	0	f	\N	\N	t	\N	f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
8e3f9b65-cea8-4f99-912c-f3893123a855	t	t	admin-cli	0	t	\N	\N	f	\N	f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
e5ac5e77-0380-4734-9b8f-82e72c6205a0	t	t	inventory-api	0	f	8i5AB4DBWh43PusXdW60vFObY129P25C		f		f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	openid-connect	-1	t	f		t	client-secret			\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
fdb23330-26e2-450f-9183-53f9ededdd52	post.logout.redirect.uris	+
214a24a6-aca5-4974-852f-6ef4b07c7f8f	post.logout.redirect.uris	+
214a24a6-aca5-4974-852f-6ef4b07c7f8f	pkce.code.challenge.method	S256
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	post.logout.redirect.uris	+
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	pkce.code.challenge.method	S256
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	client.use.lightweight.access.token.enabled	true
8e3f9b65-cea8-4f99-912c-f3893123a855	client.use.lightweight.access.token.enabled	true
e5ac5e77-0380-4734-9b8f-82e72c6205a0	client.secret.creation.time	1760467069
e5ac5e77-0380-4734-9b8f-82e72c6205a0	standard.token.exchange.enabled	false
e5ac5e77-0380-4734-9b8f-82e72c6205a0	oauth2.device.authorization.grant.enabled	false
e5ac5e77-0380-4734-9b8f-82e72c6205a0	oidc.ciba.grant.enabled	false
e5ac5e77-0380-4734-9b8f-82e72c6205a0	dpop.bound.access.tokens	false
e5ac5e77-0380-4734-9b8f-82e72c6205a0	backchannel.logout.session.required	true
e5ac5e77-0380-4734-9b8f-82e72c6205a0	backchannel.logout.revoke.offline.tokens	false
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
38b67e0c-5fad-4222-ae5d-cb3526a609b1	offline_access	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect built-in scope: offline_access	openid-connect
14edb98a-72a6-4a4a-a2ec-e25b51706372	role_list	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	SAML role list	saml
0cfb6ba5-99b3-48e9-a39f-d351393886e0	saml_organization	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	Organization Membership	saml
4085e9c9-2afd-43c2-bb92-9f05acfca8c2	profile	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect built-in scope: profile	openid-connect
0d3669fd-518e-4141-a884-4e1fe86474d6	email	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect built-in scope: email	openid-connect
3ec72451-66b5-47f5-969e-447b359fe8dc	address	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect built-in scope: address	openid-connect
b85dec55-1c32-4e07-822d-74367c54c667	phone	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect built-in scope: phone	openid-connect
5ac564c1-8b3f-409a-b377-e8b369a720a7	roles	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect scope for add user roles to the access token	openid-connect
decb4212-910c-4978-9bfb-925cb3297fcd	web-origins	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect scope for add allowed web origins to the access token	openid-connect
248a2371-2165-4044-8137-0519d59e5886	microprofile-jwt	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	Microprofile - JWT built-in scope	openid-connect
ee4f5a6c-6053-48f7-8592-b32470c3ce73	acr	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
22c9d427-c3f9-4b30-855f-2842902cc1ce	basic	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	OpenID Connect scope for add all basic claims to the token	openid-connect
1a9a525b-e62b-404c-8702-1ee11b0a777d	service_account	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	Specific scope for a client enabled for service accounts	openid-connect
03b46025-5606-4b58-a929-71d558b648ed	organization	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	Additional claims about the organization a subject belongs to	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
38b67e0c-5fad-4222-ae5d-cb3526a609b1	true	display.on.consent.screen
38b67e0c-5fad-4222-ae5d-cb3526a609b1	${offlineAccessScopeConsentText}	consent.screen.text
14edb98a-72a6-4a4a-a2ec-e25b51706372	true	display.on.consent.screen
14edb98a-72a6-4a4a-a2ec-e25b51706372	${samlRoleListScopeConsentText}	consent.screen.text
0cfb6ba5-99b3-48e9-a39f-d351393886e0	false	display.on.consent.screen
4085e9c9-2afd-43c2-bb92-9f05acfca8c2	true	display.on.consent.screen
4085e9c9-2afd-43c2-bb92-9f05acfca8c2	${profileScopeConsentText}	consent.screen.text
4085e9c9-2afd-43c2-bb92-9f05acfca8c2	true	include.in.token.scope
0d3669fd-518e-4141-a884-4e1fe86474d6	true	display.on.consent.screen
0d3669fd-518e-4141-a884-4e1fe86474d6	${emailScopeConsentText}	consent.screen.text
0d3669fd-518e-4141-a884-4e1fe86474d6	true	include.in.token.scope
3ec72451-66b5-47f5-969e-447b359fe8dc	true	display.on.consent.screen
3ec72451-66b5-47f5-969e-447b359fe8dc	${addressScopeConsentText}	consent.screen.text
3ec72451-66b5-47f5-969e-447b359fe8dc	true	include.in.token.scope
b85dec55-1c32-4e07-822d-74367c54c667	true	display.on.consent.screen
b85dec55-1c32-4e07-822d-74367c54c667	${phoneScopeConsentText}	consent.screen.text
b85dec55-1c32-4e07-822d-74367c54c667	true	include.in.token.scope
5ac564c1-8b3f-409a-b377-e8b369a720a7	true	display.on.consent.screen
5ac564c1-8b3f-409a-b377-e8b369a720a7	${rolesScopeConsentText}	consent.screen.text
5ac564c1-8b3f-409a-b377-e8b369a720a7	false	include.in.token.scope
decb4212-910c-4978-9bfb-925cb3297fcd	false	display.on.consent.screen
decb4212-910c-4978-9bfb-925cb3297fcd		consent.screen.text
decb4212-910c-4978-9bfb-925cb3297fcd	false	include.in.token.scope
248a2371-2165-4044-8137-0519d59e5886	false	display.on.consent.screen
248a2371-2165-4044-8137-0519d59e5886	true	include.in.token.scope
ee4f5a6c-6053-48f7-8592-b32470c3ce73	false	display.on.consent.screen
ee4f5a6c-6053-48f7-8592-b32470c3ce73	false	include.in.token.scope
22c9d427-c3f9-4b30-855f-2842902cc1ce	false	display.on.consent.screen
22c9d427-c3f9-4b30-855f-2842902cc1ce	false	include.in.token.scope
1a9a525b-e62b-404c-8702-1ee11b0a777d	false	display.on.consent.screen
1a9a525b-e62b-404c-8702-1ee11b0a777d	false	include.in.token.scope
03b46025-5606-4b58-a929-71d558b648ed	true	display.on.consent.screen
03b46025-5606-4b58-a929-71d558b648ed	${organizationScopeConsentText}	consent.screen.text
03b46025-5606-4b58-a929-71d558b648ed	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
fdb23330-26e2-450f-9183-53f9ededdd52	decb4212-910c-4978-9bfb-925cb3297fcd	t
fdb23330-26e2-450f-9183-53f9ededdd52	4085e9c9-2afd-43c2-bb92-9f05acfca8c2	t
fdb23330-26e2-450f-9183-53f9ededdd52	5ac564c1-8b3f-409a-b377-e8b369a720a7	t
fdb23330-26e2-450f-9183-53f9ededdd52	22c9d427-c3f9-4b30-855f-2842902cc1ce	t
fdb23330-26e2-450f-9183-53f9ededdd52	ee4f5a6c-6053-48f7-8592-b32470c3ce73	t
fdb23330-26e2-450f-9183-53f9ededdd52	0d3669fd-518e-4141-a884-4e1fe86474d6	t
fdb23330-26e2-450f-9183-53f9ededdd52	3ec72451-66b5-47f5-969e-447b359fe8dc	f
fdb23330-26e2-450f-9183-53f9ededdd52	b85dec55-1c32-4e07-822d-74367c54c667	f
fdb23330-26e2-450f-9183-53f9ededdd52	03b46025-5606-4b58-a929-71d558b648ed	f
fdb23330-26e2-450f-9183-53f9ededdd52	38b67e0c-5fad-4222-ae5d-cb3526a609b1	f
fdb23330-26e2-450f-9183-53f9ededdd52	248a2371-2165-4044-8137-0519d59e5886	f
214a24a6-aca5-4974-852f-6ef4b07c7f8f	decb4212-910c-4978-9bfb-925cb3297fcd	t
214a24a6-aca5-4974-852f-6ef4b07c7f8f	4085e9c9-2afd-43c2-bb92-9f05acfca8c2	t
214a24a6-aca5-4974-852f-6ef4b07c7f8f	5ac564c1-8b3f-409a-b377-e8b369a720a7	t
214a24a6-aca5-4974-852f-6ef4b07c7f8f	22c9d427-c3f9-4b30-855f-2842902cc1ce	t
214a24a6-aca5-4974-852f-6ef4b07c7f8f	ee4f5a6c-6053-48f7-8592-b32470c3ce73	t
214a24a6-aca5-4974-852f-6ef4b07c7f8f	0d3669fd-518e-4141-a884-4e1fe86474d6	t
214a24a6-aca5-4974-852f-6ef4b07c7f8f	3ec72451-66b5-47f5-969e-447b359fe8dc	f
214a24a6-aca5-4974-852f-6ef4b07c7f8f	b85dec55-1c32-4e07-822d-74367c54c667	f
214a24a6-aca5-4974-852f-6ef4b07c7f8f	03b46025-5606-4b58-a929-71d558b648ed	f
214a24a6-aca5-4974-852f-6ef4b07c7f8f	38b67e0c-5fad-4222-ae5d-cb3526a609b1	f
214a24a6-aca5-4974-852f-6ef4b07c7f8f	248a2371-2165-4044-8137-0519d59e5886	f
8e3f9b65-cea8-4f99-912c-f3893123a855	decb4212-910c-4978-9bfb-925cb3297fcd	t
8e3f9b65-cea8-4f99-912c-f3893123a855	4085e9c9-2afd-43c2-bb92-9f05acfca8c2	t
8e3f9b65-cea8-4f99-912c-f3893123a855	5ac564c1-8b3f-409a-b377-e8b369a720a7	t
8e3f9b65-cea8-4f99-912c-f3893123a855	22c9d427-c3f9-4b30-855f-2842902cc1ce	t
8e3f9b65-cea8-4f99-912c-f3893123a855	ee4f5a6c-6053-48f7-8592-b32470c3ce73	t
8e3f9b65-cea8-4f99-912c-f3893123a855	0d3669fd-518e-4141-a884-4e1fe86474d6	t
8e3f9b65-cea8-4f99-912c-f3893123a855	3ec72451-66b5-47f5-969e-447b359fe8dc	f
8e3f9b65-cea8-4f99-912c-f3893123a855	b85dec55-1c32-4e07-822d-74367c54c667	f
8e3f9b65-cea8-4f99-912c-f3893123a855	03b46025-5606-4b58-a929-71d558b648ed	f
8e3f9b65-cea8-4f99-912c-f3893123a855	38b67e0c-5fad-4222-ae5d-cb3526a609b1	f
8e3f9b65-cea8-4f99-912c-f3893123a855	248a2371-2165-4044-8137-0519d59e5886	f
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	decb4212-910c-4978-9bfb-925cb3297fcd	t
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	4085e9c9-2afd-43c2-bb92-9f05acfca8c2	t
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	5ac564c1-8b3f-409a-b377-e8b369a720a7	t
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	22c9d427-c3f9-4b30-855f-2842902cc1ce	t
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	ee4f5a6c-6053-48f7-8592-b32470c3ce73	t
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	0d3669fd-518e-4141-a884-4e1fe86474d6	t
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	3ec72451-66b5-47f5-969e-447b359fe8dc	f
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	b85dec55-1c32-4e07-822d-74367c54c667	f
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	03b46025-5606-4b58-a929-71d558b648ed	f
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	38b67e0c-5fad-4222-ae5d-cb3526a609b1	f
c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	248a2371-2165-4044-8137-0519d59e5886	f
1c878a59-a322-4371-af0e-27aeb921ae71	decb4212-910c-4978-9bfb-925cb3297fcd	t
1c878a59-a322-4371-af0e-27aeb921ae71	4085e9c9-2afd-43c2-bb92-9f05acfca8c2	t
1c878a59-a322-4371-af0e-27aeb921ae71	5ac564c1-8b3f-409a-b377-e8b369a720a7	t
1c878a59-a322-4371-af0e-27aeb921ae71	22c9d427-c3f9-4b30-855f-2842902cc1ce	t
1c878a59-a322-4371-af0e-27aeb921ae71	ee4f5a6c-6053-48f7-8592-b32470c3ce73	t
1c878a59-a322-4371-af0e-27aeb921ae71	0d3669fd-518e-4141-a884-4e1fe86474d6	t
1c878a59-a322-4371-af0e-27aeb921ae71	3ec72451-66b5-47f5-969e-447b359fe8dc	f
1c878a59-a322-4371-af0e-27aeb921ae71	b85dec55-1c32-4e07-822d-74367c54c667	f
1c878a59-a322-4371-af0e-27aeb921ae71	03b46025-5606-4b58-a929-71d558b648ed	f
1c878a59-a322-4371-af0e-27aeb921ae71	38b67e0c-5fad-4222-ae5d-cb3526a609b1	f
1c878a59-a322-4371-af0e-27aeb921ae71	248a2371-2165-4044-8137-0519d59e5886	f
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	decb4212-910c-4978-9bfb-925cb3297fcd	t
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	4085e9c9-2afd-43c2-bb92-9f05acfca8c2	t
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	5ac564c1-8b3f-409a-b377-e8b369a720a7	t
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	22c9d427-c3f9-4b30-855f-2842902cc1ce	t
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	ee4f5a6c-6053-48f7-8592-b32470c3ce73	t
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	0d3669fd-518e-4141-a884-4e1fe86474d6	t
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	3ec72451-66b5-47f5-969e-447b359fe8dc	f
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	b85dec55-1c32-4e07-822d-74367c54c667	f
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	03b46025-5606-4b58-a929-71d558b648ed	f
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	38b67e0c-5fad-4222-ae5d-cb3526a609b1	f
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	248a2371-2165-4044-8137-0519d59e5886	f
e5ac5e77-0380-4734-9b8f-82e72c6205a0	decb4212-910c-4978-9bfb-925cb3297fcd	t
e5ac5e77-0380-4734-9b8f-82e72c6205a0	4085e9c9-2afd-43c2-bb92-9f05acfca8c2	t
e5ac5e77-0380-4734-9b8f-82e72c6205a0	5ac564c1-8b3f-409a-b377-e8b369a720a7	t
e5ac5e77-0380-4734-9b8f-82e72c6205a0	22c9d427-c3f9-4b30-855f-2842902cc1ce	t
e5ac5e77-0380-4734-9b8f-82e72c6205a0	ee4f5a6c-6053-48f7-8592-b32470c3ce73	t
e5ac5e77-0380-4734-9b8f-82e72c6205a0	0d3669fd-518e-4141-a884-4e1fe86474d6	t
e5ac5e77-0380-4734-9b8f-82e72c6205a0	3ec72451-66b5-47f5-969e-447b359fe8dc	f
e5ac5e77-0380-4734-9b8f-82e72c6205a0	b85dec55-1c32-4e07-822d-74367c54c667	f
e5ac5e77-0380-4734-9b8f-82e72c6205a0	03b46025-5606-4b58-a929-71d558b648ed	f
e5ac5e77-0380-4734-9b8f-82e72c6205a0	38b67e0c-5fad-4222-ae5d-cb3526a609b1	f
e5ac5e77-0380-4734-9b8f-82e72c6205a0	248a2371-2165-4044-8137-0519d59e5886	f
e5ac5e77-0380-4734-9b8f-82e72c6205a0	1a9a525b-e62b-404c-8702-1ee11b0a777d	t
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
38b67e0c-5fad-4222-ae5d-cb3526a609b1	14f895c3-f61b-4562-a83a-845745930db6
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
bfd14e0d-6415-42bf-b377-2143973dba39	Trusted Hosts	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	anonymous
b66896e8-c672-4c63-a6d7-76482d8dc192	Consent Required	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	anonymous
f22156c2-b11e-4f57-9137-c4cb49a3dab1	Full Scope Disabled	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	anonymous
904f22e0-4fa2-4fc2-80ee-4c247c0685ea	Max Clients Limit	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	anonymous
65122aaf-dfc0-445c-abdd-2ebd844ba26e	Allowed Protocol Mapper Types	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	anonymous
54f5177f-f94a-4803-a678-c57e03f1111b	Allowed Client Scopes	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	anonymous
ab2077a5-961d-416a-b226-d0b9ca11395b	Allowed Protocol Mapper Types	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	authenticated
22cf59ef-fafc-4cb4-9bce-fff38d7ebb86	Allowed Client Scopes	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	authenticated
1e57144a-f6d2-42cc-a280-cdf5a1b562a6	rsa-generated	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	rsa-generated	org.keycloak.keys.KeyProvider	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N
085574f8-6ba6-4ed5-b21c-c6c11e75229d	rsa-enc-generated	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	rsa-enc-generated	org.keycloak.keys.KeyProvider	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N
790dac08-b08b-4574-9f4f-d841e24197f3	hmac-generated-hs512	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	hmac-generated	org.keycloak.keys.KeyProvider	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N
5e8daeb7-7ed7-4982-a04b-4d5cfea834f5	aes-generated	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	aes-generated	org.keycloak.keys.KeyProvider	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N
a7ec6500-9f99-4cf7-86b0-a008767483e0	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
d2a2cc7a-826e-4c07-a644-f4af2f9cdcb8	bfd14e0d-6415-42bf-b377-2143973dba39	host-sending-registration-request-must-match	true
f5f99ce9-5041-4f02-a4e0-88dccf1ec25b	bfd14e0d-6415-42bf-b377-2143973dba39	client-uris-must-match	true
f744ba47-ffc4-4950-8843-8e363131d1e9	65122aaf-dfc0-445c-abdd-2ebd844ba26e	allowed-protocol-mapper-types	oidc-full-name-mapper
5f3016d4-ce57-4985-8493-141336e3cbd6	65122aaf-dfc0-445c-abdd-2ebd844ba26e	allowed-protocol-mapper-types	saml-user-property-mapper
c02212b7-0752-4e15-aedd-6e9086c5d4ad	65122aaf-dfc0-445c-abdd-2ebd844ba26e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
4ad53657-bddd-4d07-a16c-31114b7441c1	65122aaf-dfc0-445c-abdd-2ebd844ba26e	allowed-protocol-mapper-types	saml-user-attribute-mapper
76fb9340-02c1-4db1-9ea8-5a782ed1e1cd	65122aaf-dfc0-445c-abdd-2ebd844ba26e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
43400d5b-f46f-44b2-bfae-eccf9127c2ec	65122aaf-dfc0-445c-abdd-2ebd844ba26e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
28d6e8e5-c104-499b-bc1f-c715b3246d46	65122aaf-dfc0-445c-abdd-2ebd844ba26e	allowed-protocol-mapper-types	oidc-address-mapper
37363ea4-cd3a-4f3c-b8af-e136bf8b58a4	65122aaf-dfc0-445c-abdd-2ebd844ba26e	allowed-protocol-mapper-types	saml-role-list-mapper
71a64b7f-9025-43b1-abbb-55cafcd12a06	904f22e0-4fa2-4fc2-80ee-4c247c0685ea	max-clients	200
34591f7d-dba4-4d77-a444-b96c1ce0f05f	22cf59ef-fafc-4cb4-9bce-fff38d7ebb86	allow-default-scopes	true
38dd0bd9-c662-4550-b30c-483cce54a5bc	54f5177f-f94a-4803-a678-c57e03f1111b	allow-default-scopes	true
8e917f22-21e9-414e-9a90-24cf5016fe3a	ab2077a5-961d-416a-b226-d0b9ca11395b	allowed-protocol-mapper-types	saml-user-property-mapper
4e80145a-6c57-4982-9ab5-ddfa3f526925	ab2077a5-961d-416a-b226-d0b9ca11395b	allowed-protocol-mapper-types	oidc-address-mapper
5c373b23-5a28-4740-8b26-6617632ea180	ab2077a5-961d-416a-b226-d0b9ca11395b	allowed-protocol-mapper-types	oidc-full-name-mapper
5e1545ce-38e1-4f42-bb0b-69554af25606	ab2077a5-961d-416a-b226-d0b9ca11395b	allowed-protocol-mapper-types	saml-user-attribute-mapper
d4a4002e-c708-4d9d-83f2-c6ae6ce1dabd	ab2077a5-961d-416a-b226-d0b9ca11395b	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
94106607-0c33-46d5-8b2a-f8efb2018225	ab2077a5-961d-416a-b226-d0b9ca11395b	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9e689120-d713-4c5e-ada3-d8910435d3a8	ab2077a5-961d-416a-b226-d0b9ca11395b	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
0b15fa4c-954b-47fc-a0ce-012571606ee2	ab2077a5-961d-416a-b226-d0b9ca11395b	allowed-protocol-mapper-types	saml-role-list-mapper
8e96a136-bc5f-4c7d-a6c5-abb7c4294e80	790dac08-b08b-4574-9f4f-d841e24197f3	secret	hUpQSqxOgzPVR7DJ5R0x1FSyc_XEJ3GbvwiaoHB6mzVKPlsZmNYdTDHIkrkXeJAccIfi0eqcdBGjjsMIVnyCdZDC884sXCrfmB_RrJL0jOjl_WAft2-NSTXqBm6Xoe1KKJ2LET8Ljc9U--OjY82Zs4ddhp9ex2VrOOlrzLtLZD4
615da4b4-e582-45ca-908a-c1cac9ab06b7	790dac08-b08b-4574-9f4f-d841e24197f3	kid	cc7b4b7b-0fd5-429d-8d4c-ae6fbb2272da
71bb9142-c754-4e90-9a5f-800abb43d2dc	790dac08-b08b-4574-9f4f-d841e24197f3	algorithm	HS512
2f5bde15-b0bd-4bdd-8006-8d6441b1b670	790dac08-b08b-4574-9f4f-d841e24197f3	priority	100
d04947c3-df8e-4796-b33b-338112cc3adc	a7ec6500-9f99-4cf7-86b0-a008767483e0	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
9a9b5a9d-de03-4c53-9774-86f2a2ddda1c	1e57144a-f6d2-42cc-a280-cdf5a1b562a6	certificate	MIICmzCCAYMCBgGZyZAUUjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUxMDA5MTUxOTQ2WhcNMzUxMDA5MTUyMTI2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZ2rctZp++oZXGqNeCvSEEl230juuogFnvRaE9V3VuwYe9Kum91/kZFbLwTlroHgPsaNM/cBTC/emxYF66QYJYbakX4KTsgnBS3XLiIZJvUugrpxEtx0PW04L8OHvV93PaQFQ+NBS0KypLkIij5SqH4Bu48VocswsdiP/rkUJZJqxMdVR9hqrPYtSkDTtucGNJh2+skBf3Ad3l6xIsfAx8J9Bq3BH87HKJF4gJr4447rvQ5OfJVU3YuXt6Ey8PtexVFnfHMnKws1tEeYl0PB8Xx8TenGs6QJE8rOZpRCJJfA0kZXU8Ph8uXPY9PrKHgnYQXEty3Hv0V1w01JuNGu7nAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAF1q7IBPM268rrYd4t82r3dl/wF8Q2GecQIuB8OD38OuuriHztyTBwhh7RTGnRcJMfF9bIk4jlBHmTDWJzzo0Pw79Z8UqRGBY5d8Dh9kB0vbhZSXv7nR0wEvVxv1t9O4jN2G6Md3Czn4Lh0tGAeGFxtqP2zanq5MPNswnxcm1+BFWdgCMzNQGV18LNFcUmvRRPoDIK2mfggpVYaxddg5obolhzXV8gDJ2u6y+bdQlv+346ifAIIjkAu6STpIxn6RoqlqrxHmno3CFJ2C9G9m0tLUtJNejYvqSYLicYLUoFg+DlcIhsPR2vVClCMbq+GX/QmxujnNED72o/qROPlwlXU=
1e6da41d-162e-4193-9cbd-638d3f4f6bfc	1e57144a-f6d2-42cc-a280-cdf5a1b562a6	keyUse	SIG
87a16514-788f-4f24-95be-520091135a04	1e57144a-f6d2-42cc-a280-cdf5a1b562a6	privateKey	MIIEowIBAAKCAQEAmdq3LWafvqGVxqjXgr0hBJdt9I7rqIBZ70WhPVd1bsGHvSrpvdf5GRWy8E5a6B4D7GjTP3AUwv3psWBeukGCWG2pF+Ck7IJwUt1y4iGSb1LoK6cRLcdD1tOC/Dh71fdz2kBUPjQUtCsqS5CIo+Uqh+AbuPFaHLMLHYj/65FCWSasTHVUfYaqz2LUpA07bnBjSYdvrJAX9wHd5esSLHwMfCfQatwR/OxyiReICa+OOO670OTnyVVN2Ll7ehMvD7XsVRZ3xzJysLNbRHmJdDwfF8fE3pxrOkCRPKzmaUQiSXwNJGV1PD4fLlz2PT6yh4J2EFxLctx79FdcNNSbjRru5wIDAQABAoIBAAV6zDu3jtNNJwFQgdMmuvZ9EY38dHk9D7bywxePtgov+2PUk5xO2mY3JyHhmzbu3BM/TTLSYkhASeKm54jOYimVx518Q0jR1n/6YifwASqqMxmxlW43eCY+b0kIwU8GxV9jG30BrDEZ485ALhWu86ZWPYvckL86mJfrNA48T2F5wyCDASrH3jw+g1nVMxAKOivrcaZv3Jutx6w/CbNGGtHC03AAEQrdSvNkvzegsxw8RYkgQ9BGJrt9N8Z4PWXmjkNQOLKeU6FvQyzersjoSxzvmp2sEL4z/fPtOw0vSvAD07BeVYEv8hi589L27qGlgpD1UPNNCTT8Ur6UIEmxWXkCgYEA1kfgiKY/fh1cvRz53gCWk99S4rI9b5WDWCpbALAteA9SksBd09mW4TBizTbVmuNlF7lzY8Vpl3xcVtBlK8cOrT0rY9Q2X8fJPJfURWhWEP2SQe5OFDXvwNw+d/KNPHfGHyJshwXbH4Sl7ittVAjhxHsZoVLP+XqXHBuNGrVM4bkCgYEAt88U9/QxHB9E/5lLYkPeSKBV5w1sXyG2TvchOqvDSDviNzIpKq2iZazlgTis8Hiu5po8DkGr9C8Szy/iRO1fQ2vzC+Mm91DvUT0HuASdbfz08ZbBMoU7NYrpDPjJtj3EOE83u8JygT5WcFMspRSJv41EWzN7K8ZpG0bmaz0TJZ8CgYBb1WwmRFGbxAu1xNBVU500/JXyL/9ibgpfY6+iqN6jwLVbzXOo0mz2T51YY7LB8cimlUUdskJhuNt+HUvuqh3hIwEQhKdU/zOAc3V21ZNlLrda6D2wLbl1xy5Ci8H58z8GouMuLtVNObU/UH9Hb5MKeNNwLySQv/g5BJnBo4eyiQKBgCY69RKJgLlnq5M6EBrVIOOcLaHMAfFbcq7D6e5pEUnx4qA2V6efy7o4FtgksJunjkE6bSlN8XTtYY0kWXyanojIaBnd2hnwhIYyGmvk0dWxmkSxZWebnHALf2OKT3IPMMPBfkcYL3bAP3xHYG7Jcckcmc4aTBETyIK64WwGnPfjAoGBAJFX3BZB1jzDpInz3mNn7xGe6Z1WMbt9yz5FcRqdZHp/hCHrVwzRd9RSaPSnTwhhXEl/gDgrX6BhWyJQNaUdot8Qob2Tenpdujj1zKzeYZU7LSmeryiom1O4gNNHK2zhaqLARLb+Wku0Vm8st7iwD8nGo+bS2HEpLsfKc9DQg/DU
4c9aa160-8180-45d2-ab42-cc9aa1a00377	1e57144a-f6d2-42cc-a280-cdf5a1b562a6	priority	100
c9444b31-372f-4ccf-a895-df1829fdaec8	085574f8-6ba6-4ed5-b21c-c6c11e75229d	privateKey	MIIEowIBAAKCAQEA7HF5vEjkGupaWZTIHsPBBAf9ymIfPMKvV3iKIVgFnPf4rYkwVHzduTBANweLn/V9bP9+3sujGGc6/A4RghCQxzWNsAGb6ngVOv2N8U06zOj2hRoB7QgDBPuwvND+/IcSUYkdDAt9wg1X2ooRIBfNxb1M1XAxWMkenqA3VgVhWgdQx7Pg+WTsm/NCggQ1E0TPenrwZX/zMDl5ueXqEw10sB8w01b+A7T8wB9mKNznoCGawA1vZXJDGKm2sWqoyI+n1R1UcF9F7E3VaBg2g2d0+zRDNOQtpRm+RZhzpyitnQnF++jGJYTVDoQnKAei9fZy/vZ9NmBuJ2eDwCL37Xf4nQIDAQABAoIBAAIYHMaqU5xQ/WvxxQQiK16Wzofl0zsTN+63FLVDijadvTcWRE02IFfnT2UmhhC+4bWMnaDgVRKVXg570dgX0dNQJ6bc5VtiQGWZ96zFf2C4vjjME+xcR9dsR2mR3CxOWKy5s8cyI9wdmxFY2X8yBaKpVXU0El2IjsdVrnITR8RZ9Rc+ks6XJ8ZoOSnO7L/g8W5tkoJkH8ewxKzJyK+ZEOImUFZwfNWXf3DiVlx+MaOQL0k7ERGtsDQAM6W/gnvWbqWL1vaMK2kImqlFg5jG4dmvtZEm5iIPMpcBIXii4VtkWj3dS8MAM+RdqFFsaX8qAiJYT58wCP3kze39s4nGKOECgYEA/GdONdIA0gxRPvAifqGeU8YLvp0bkqiQ0+BNx8jvKOdUUiMnaKkqpO3fAOVGUa3gNSmeXwKmlPUUobeebLfGOuJ5zBGpS6gBT94ANmUstWL+z13HliGxzW2/OOFF4shsWC7EexiWd6ULWsZUPSlnx8qH0ygYXQM6tSPLqoQRcWECgYEA78/zm+3elFHbwd/fe2bOt1TrRsd3iJJhLqNBg+MfQ9xs9+dwPwz+abwj95YZSrd40+3CTS/KdOU8HkZziIprzxXtSkxJaMO3tyGGVLLFJJ9RVIaPhtn4Fy+0WgPua2LA53HVLv5EVWFaogn2Bx45QvuIVlMLPIj17g+gnDFpxL0CgYBNcTTh9okh6X2UHgG3cMcvVPiNh47KNMYa/BthTRl0J2YLvZV920mmSQW/NJmavgqoxRg+doW99mRaKgiFuu0rbAmKv3B+MhIU+zx9dBV/odwkq9VtDvGK4j1lqljS+EOl2tOWITkphI4zT97Q1T9uYYnDE+5Fu5PruAvpSZRAgQKBgHg1QgSweLjaS5DkOm7t+sK1I3aIN+fSkDpDhWyp5Zsrm8esUHyac9DmiRTrPWRRkZSSAqqUQSTVX4xBflo8IIxejmKG2OlV6fo3KNG+Bsozvh3jkYBkNFLTC9FvVQypJM8fJWB3/iLaOQcufQ/WW5ey5AV5fRFsCfK6DKUes8j1AoGBAPGN0Un6anUaOq0tmbHqRws6Vx36i+bFDgo2Wjmu13jFb4V2pQrYf/k+VfPxwxKdpHpMRBRwePRdcxKOnh5ohgW/PoFo1pk2R4yxvn0xbNVvlkOmPHyRWAYUfFMb4dD4IbJBgWMnKndMH1CWEfUfk9D6XwqZSy80zLgaRXoN6jpD
5c66bbf8-7992-44c7-83e4-70befca8ab0f	085574f8-6ba6-4ed5-b21c-c6c11e75229d	certificate	MIICmzCCAYMCBgGZyZAU1DANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUxMDA5MTUxOTQ2WhcNMzUxMDA5MTUyMTI2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDscXm8SOQa6lpZlMgew8EEB/3KYh88wq9XeIohWAWc9/itiTBUfN25MEA3B4uf9X1s/37ey6MYZzr8DhGCEJDHNY2wAZvqeBU6/Y3xTTrM6PaFGgHtCAME+7C80P78hxJRiR0MC33CDVfaihEgF83FvUzVcDFYyR6eoDdWBWFaB1DHs+D5ZOyb80KCBDUTRM96evBlf/MwOXm55eoTDXSwHzDTVv4DtPzAH2Yo3OegIZrADW9lckMYqbaxaqjIj6fVHVRwX0XsTdVoGDaDZ3T7NEM05C2lGb5FmHOnKK2dCcX76MYlhNUOhCcoB6L19nL+9n02YG4nZ4PAIvftd/idAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAG8g2lD548NeEJAKkH14ctUAzCJx1l8FiPsH+fKtNbsM/b4lAbws1re1wtoqYFU56NJ4SnStb5gF9wwn6IIJ6NoAYNkshoeQRGe3kB9NFa1aE1I8cUTLkp8TfsQ3tb4yvdtoNcN/GX/tF+bRzNa8vpaw5lWp1MBw1zMHWRpCbh/5Uk0K/H+Jt9uQwi1vjT6hxHTlUj4foZlHBLftbJ+Lc9r67cMaW8vZMPoe5BacaKsjJQh9ZVF3gadfc6nRS+HX2HmQaPzatkAycsHRerivuLM/wJ/JQ6AgVJ+wKnuySlYVGorgbRWii/qlj1eNpLDKlRXSUJyLCKSVXYRhQfwgI+Q=
fff4f9f7-fb5b-4590-80d9-6d4244c247a9	085574f8-6ba6-4ed5-b21c-c6c11e75229d	priority	100
7ce110f0-2681-4f87-a6d9-57c6f63534ed	085574f8-6ba6-4ed5-b21c-c6c11e75229d	algorithm	RSA-OAEP
af51bfe5-694c-445d-b3c9-0477cae29c7d	085574f8-6ba6-4ed5-b21c-c6c11e75229d	keyUse	ENC
e757d922-850d-4fb4-9c14-6ccb21672974	5e8daeb7-7ed7-4982-a04b-4d5cfea834f5	priority	100
8b1aad51-9533-4e18-b4f1-03e17f9fdf75	5e8daeb7-7ed7-4982-a04b-4d5cfea834f5	secret	aarRs4X_44h-mcMnybRS8A
0079e0a9-6083-423c-afad-f2c297aefef9	5e8daeb7-7ed7-4982-a04b-4d5cfea834f5	kid	c5afe8ec-220a-4a04-8ae2-4d03388b40e5
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
81c12366-d572-48b8-8dc2-385dc21c2c0c	5571c4b7-c9eb-4231-aaaf-4d334c813f3f
81c12366-d572-48b8-8dc2-385dc21c2c0c	c111acdb-663e-45f5-b6f5-40ea9755138c
81c12366-d572-48b8-8dc2-385dc21c2c0c	ec2fb845-50d6-46d5-9cc5-cb5aa9d55b8e
81c12366-d572-48b8-8dc2-385dc21c2c0c	873aead7-8f40-4e4b-b0c8-110cecc0a6d1
81c12366-d572-48b8-8dc2-385dc21c2c0c	f0d06db5-18b8-417a-a214-3cadeb7a0bc5
81c12366-d572-48b8-8dc2-385dc21c2c0c	fca61354-8f6c-4bfd-9830-356c6af7ea35
81c12366-d572-48b8-8dc2-385dc21c2c0c	fda3da10-80ef-423f-bbc0-305714d50a09
81c12366-d572-48b8-8dc2-385dc21c2c0c	a587ffe0-3c63-43f5-b93c-ce0ab9f7f251
81c12366-d572-48b8-8dc2-385dc21c2c0c	de24e4f8-5a1a-4b09-8b76-9aef0bdf3049
81c12366-d572-48b8-8dc2-385dc21c2c0c	6d7d3ad4-4bdd-4028-a1e1-a93620b3a2b8
81c12366-d572-48b8-8dc2-385dc21c2c0c	dc9e8a7c-2e44-4157-ab96-503f986aec44
81c12366-d572-48b8-8dc2-385dc21c2c0c	09957b2c-be64-4f7b-ad80-51e6fb745f53
81c12366-d572-48b8-8dc2-385dc21c2c0c	965ada69-6e15-4ac3-a2f0-0fd7dece70da
81c12366-d572-48b8-8dc2-385dc21c2c0c	dd58c3ca-cd76-4c0e-ab67-3f8714695192
81c12366-d572-48b8-8dc2-385dc21c2c0c	b0cd05f8-6cf3-4068-acfa-c9545f46a072
81c12366-d572-48b8-8dc2-385dc21c2c0c	c2b903a6-5db1-4bcc-a161-e8269be6a6f9
81c12366-d572-48b8-8dc2-385dc21c2c0c	763b280e-02c4-40ed-b051-b80db4504566
81c12366-d572-48b8-8dc2-385dc21c2c0c	892378a4-d19e-41fc-a50b-fb22ef851dd7
6be5efd6-28a6-427f-9d76-754fcd286da4	175abb1e-ce47-4ac8-897a-f752899261db
873aead7-8f40-4e4b-b0c8-110cecc0a6d1	892378a4-d19e-41fc-a50b-fb22ef851dd7
873aead7-8f40-4e4b-b0c8-110cecc0a6d1	b0cd05f8-6cf3-4068-acfa-c9545f46a072
f0d06db5-18b8-417a-a214-3cadeb7a0bc5	c2b903a6-5db1-4bcc-a161-e8269be6a6f9
6be5efd6-28a6-427f-9d76-754fcd286da4	719798fd-7c5a-45e9-8491-49a533af3230
719798fd-7c5a-45e9-8491-49a533af3230	e01277e9-03af-4217-9feb-c6b15e881b0e
8e1571f1-19a3-416f-ad3e-a11afd000131	7f9e8333-3452-4368-b929-613a2ff54c28
81c12366-d572-48b8-8dc2-385dc21c2c0c	eac3b840-62e5-41de-b136-891547d62264
6be5efd6-28a6-427f-9d76-754fcd286da4	14f895c3-f61b-4562-a83a-845745930db6
6be5efd6-28a6-427f-9d76-754fcd286da4	889b55e9-ef01-496f-adfd-7813e4c98dea
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) FROM stdin;
a5ebbade-0292-4871-a26d-965b05b47dc3	\N	password	9ad1bd18-e889-409c-be96-3250537bd27f	1760023287106	\N	{"value":"jJ1z2lgEJ++0b1UlI3qvVanEzAJ9sDlCVn5YvawLql0=","salt":"QOPzeJl0Mt7ow1Z35gjgNQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
890c0046-5596-4e86-a9d6-67518d377bf3	\N	password	077a693b-dcd7-4395-a0d1-f2a5237cb9f9	1760029699391	My password	{"value":"iA06DggqvAW7fODlgn9wZuazO5sQoew7gjkIxXlGqHE=","salt":"XdNd7Ea0dPay+9YFZd1kRw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-10-09 15:21:23.766821	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.33.0	\N	\N	0023281995
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-10-09 15:21:23.774908	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.33.0	\N	\N	0023281995
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-10-09 15:21:23.788156	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.33.0	\N	\N	0023281995
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-10-09 15:21:23.789427	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	0023281995
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-10-09 15:21:23.8202	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.33.0	\N	\N	0023281995
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-10-09 15:21:23.822903	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.33.0	\N	\N	0023281995
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-10-09 15:21:23.849678	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.33.0	\N	\N	0023281995
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-10-09 15:21:23.852302	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.33.0	\N	\N	0023281995
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-10-09 15:21:23.854461	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.33.0	\N	\N	0023281995
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-10-09 15:21:23.881924	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.33.0	\N	\N	0023281995
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-10-09 15:21:23.898196	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	0023281995
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-10-09 15:21:23.900048	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	0023281995
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-10-09 15:21:23.905838	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	0023281995
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-10-09 15:21:23.9125	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.33.0	\N	\N	0023281995
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-10-09 15:21:23.913081	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-10-09 15:21:23.914076	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.33.0	\N	\N	0023281995
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-10-09 15:21:23.915049	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.33.0	\N	\N	0023281995
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-10-09 15:21:23.928216	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.33.0	\N	\N	0023281995
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-10-09 15:21:23.93983	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.33.0	\N	\N	0023281995
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-10-09 15:21:23.941039	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.33.0	\N	\N	0023281995
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-10-09 15:21:25.110277	119	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.33.0	\N	\N	0023281995
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-10-09 15:21:23.942076	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.33.0	\N	\N	0023281995
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-10-09 15:21:23.942932	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.33.0	\N	\N	0023281995
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-10-09 15:21:23.964962	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.33.0	\N	\N	0023281995
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-10-09 15:21:23.966796	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.33.0	\N	\N	0023281995
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-10-09 15:21:23.967266	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.33.0	\N	\N	0023281995
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-10-09 15:21:24.075839	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.33.0	\N	\N	0023281995
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-10-09 15:21:24.097486	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.33.0	\N	\N	0023281995
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-10-09 15:21:24.098721	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.33.0	\N	\N	0023281995
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-10-09 15:21:24.115574	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.33.0	\N	\N	0023281995
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-10-09 15:21:24.119808	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.33.0	\N	\N	0023281995
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-10-09 15:21:24.125724	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.33.0	\N	\N	0023281995
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-10-09 15:21:24.126916	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.33.0	\N	\N	0023281995
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-10-09 15:21:24.128294	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-10-09 15:21:24.129105	34	MARK_RAN	9:f9753208029f582525ed12011a19d054	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.33.0	\N	\N	0023281995
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-10-09 15:21:24.136094	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.33.0	\N	\N	0023281995
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-10-09 15:21:24.137505	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.33.0	\N	\N	0023281995
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-10-09 15:21:24.139149	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	0023281995
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-10-09 15:21:24.140081	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.33.0	\N	\N	0023281995
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-10-09 15:21:24.140859	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.33.0	\N	\N	0023281995
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-10-09 15:21:24.141167	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.33.0	\N	\N	0023281995
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-10-09 15:21:24.141696	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.33.0	\N	\N	0023281995
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-10-09 15:21:24.143143	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.33.0	\N	\N	0023281995
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-10-09 15:21:24.584442	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.33.0	\N	\N	0023281995
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-10-09 15:21:24.585834	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.33.0	\N	\N	0023281995
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-09 15:21:24.586944	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.33.0	\N	\N	0023281995
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-09 15:21:24.58814	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.33.0	\N	\N	0023281995
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-09 15:21:24.588533	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.33.0	\N	\N	0023281995
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-09 15:21:24.620935	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.33.0	\N	\N	0023281995
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-09 15:21:24.622592	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.33.0	\N	\N	0023281995
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-10-09 15:21:24.632902	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.33.0	\N	\N	0023281995
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-10-09 15:21:24.725361	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.33.0	\N	\N	0023281995
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-10-09 15:21:24.726427	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-10-09 15:21:24.727275	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.33.0	\N	\N	0023281995
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-10-09 15:21:24.727994	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.33.0	\N	\N	0023281995
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-10-09 15:21:24.729792	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.33.0	\N	\N	0023281995
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-10-09 15:21:24.7311	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.33.0	\N	\N	0023281995
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-10-09 15:21:24.745588	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.33.0	\N	\N	0023281995
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-10-09 15:21:24.845055	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.33.0	\N	\N	0023281995
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-10-09 15:21:24.852224	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.33.0	\N	\N	0023281995
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-10-09 15:21:24.853692	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.33.0	\N	\N	0023281995
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-10-09 15:21:24.855486	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.33.0	\N	\N	0023281995
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-10-09 15:21:24.857028	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.33.0	\N	\N	0023281995
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-10-09 15:21:24.857938	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.33.0	\N	\N	0023281995
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-10-09 15:21:24.858709	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.33.0	\N	\N	0023281995
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-10-09 15:21:24.859483	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.33.0	\N	\N	0023281995
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-10-09 15:21:24.870731	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.33.0	\N	\N	0023281995
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-10-09 15:21:24.87976	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.33.0	\N	\N	0023281995
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-10-09 15:21:24.880844	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.33.0	\N	\N	0023281995
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-10-09 15:21:24.901552	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.33.0	\N	\N	0023281995
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-10-09 15:21:24.903294	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.33.0	\N	\N	0023281995
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-10-09 15:21:24.904398	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.33.0	\N	\N	0023281995
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-09 15:21:24.905931	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	0023281995
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-09 15:21:24.907725	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	0023281995
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-09 15:21:24.908361	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	0023281995
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-09 15:21:24.912289	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.33.0	\N	\N	0023281995
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-09 15:21:24.922422	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	0023281995
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-10-09 15:21:24.923514	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.33.0	\N	\N	0023281995
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-10-09 15:21:24.923907	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.33.0	\N	\N	0023281995
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-10-09 15:21:24.928548	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.33.0	\N	\N	0023281995
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-10-09 15:21:24.929048	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.33.0	\N	\N	0023281995
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-09 15:21:24.939289	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.33.0	\N	\N	0023281995
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-09 15:21:24.939854	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	0023281995
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-09 15:21:24.940881	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	0023281995
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-09 15:21:24.941219	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	0023281995
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-09 15:21:24.951187	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	0023281995
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-10-09 15:21:24.952372	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.33.0	\N	\N	0023281995
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-10-09 15:21:24.954037	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.33.0	\N	\N	0023281995
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-10-09 15:21:24.956353	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.33.0	\N	\N	0023281995
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-09 15:21:24.957693	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.33.0	\N	\N	0023281995
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-09 15:21:24.959097	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.33.0	\N	\N	0023281995
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-09 15:21:24.968986	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-09 15:21:24.970736	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.33.0	\N	\N	0023281995
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-09 15:21:24.971091	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.33.0	\N	\N	0023281995
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-09 15:21:24.973155	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.33.0	\N	\N	0023281995
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-09 15:21:24.973653	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.33.0	\N	\N	0023281995
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-09 15:21:24.975135	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.33.0	\N	\N	0023281995
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-09 15:21:25.004515	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-09 15:21:25.005192	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-09 15:21:25.009381	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-09 15:21:25.020978	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-09 15:21:25.021543	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-09 15:21:25.032578	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.33.0	\N	\N	0023281995
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-09 15:21:25.033922	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.33.0	\N	\N	0023281995
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-10-09 15:21:25.035857	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.33.0	\N	\N	0023281995
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-10-09 15:21:25.047151	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.33.0	\N	\N	0023281995
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-10-09 15:21:25.057531	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.33.0	\N	\N	0023281995
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-10-09 15:21:25.070091	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.33.0	\N	\N	0023281995
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-10-09 15:21:25.071247	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.33.0	\N	\N	0023281995
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-09 15:21:25.081916	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	0023281995
20.0.0-12964-supported-dbs-edb-migration	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-09 15:21:25.094724	110	EXECUTED	9:a6b18a8e38062df5793edbe064f4aecd	dropIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE; createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	0023281995
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-09 15:21:25.095406	111	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	0023281995
client-attributes-string-accomodation-fixed-pre-drop-index	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-09 15:21:25.096711	112	EXECUTED	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-09 15:21:25.098393	113	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
client-attributes-string-accomodation-fixed-post-create-index	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-09 15:21:25.098879	114	MARK_RAN	9:bd2bd0fc7768cf0845ac96a8786fa735	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-10-09 15:21:25.100231	115	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.33.0	\N	\N	0023281995
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-10-09 15:21:25.107859	116	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.33.0	\N	\N	0023281995
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-10-09 15:21:25.108681	117	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.33.0	\N	\N	0023281995
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-10-09 15:21:25.109916	118	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.33.0	\N	\N	0023281995
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-10-09 15:21:25.111649	120	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.33.0	\N	\N	0023281995
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-10-09 15:21:25.112514	121	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	0023281995
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-09 15:21:25.14982	122	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.33.0	\N	\N	0023281995
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-09 15:21:25.150958	123	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.33.0	\N	\N	0023281995
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-09 15:21:25.152576	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-09 15:21:25.162937	125	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
24.0.0-26618-edb-migration	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-09 15:21:25.174531	126	EXECUTED	9:2f684b29d414cd47efe3a3599f390741	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES; createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-10-09 15:21:25.175684	127	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.33.0	\N	\N	0023281995
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-10-09 15:21:25.176143	128	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-10-09 15:21:25.176727	129	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	0023281995
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.178247	130	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	0023281995
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.188348	131	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.190448	132	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.192271	133	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.194323	134	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.196176	135	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	0023281995
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.196573	136	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.207259	137	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	0023281995
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.212862	138	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.33.0	\N	\N	0023281995
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.216055	139	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	0023281995
unique-consentuser-edb-migration	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.218612	140	MARK_RAN	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	0023281995
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.219251	141	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	0023281995
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-09 15:21:25.240253	142	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.33.0	\N	\N	0023281995
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.242216	143	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.33.0	\N	\N	0023281995
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.243979	144	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.33.0	\N	\N	0023281995
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.253704	145	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.33.0	\N	\N	0023281995
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.254974	146	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.33.0	\N	\N	0023281995
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.256844	147	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.33.0	\N	\N	0023281995
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.266462	148	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.33.0	\N	\N	0023281995
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.286796	149	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.33.0	\N	\N	0023281995
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.288922	150	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	0023281995
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.292308	151	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.33.0	\N	\N	0023281995
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-09 15:21:25.293217	152	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.33.0	\N	\N	0023281995
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-10-09 15:21:25.295823	153	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.33.0	\N	\N	0023281995
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-10-09 15:21:25.297712	154	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.33.0	\N	\N	0023281995
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-10-09 15:21:25.298794	155	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.33.0	\N	\N	0023281995
26.2.0-36750	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-10-09 15:21:25.301296	156	EXECUTED	9:b49ce951c22f7eb16480ff085640a33a	createTable tableName=SERVER_CONFIG		\N	4.33.0	\N	\N	0023281995
26.2.0-26106	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-10-09 15:21:25.302265	157	EXECUTED	9:b5877d5dab7d10ff3a9d209d7beb6680	addColumn tableName=CREDENTIAL		\N	4.33.0	\N	\N	0023281995
26.2.6-39866-duplicate	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-10-09 15:21:25.303437	158	EXECUTED	9:1dc67ccee24f30331db2cba4f372e40e	customChange		\N	4.33.0	\N	\N	0023281995
26.2.6-39866-uk	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-10-09 15:21:25.304939	159	EXECUTED	9:b70b76f47210cf0a5f4ef0e219eac7cd	addUniqueConstraint constraintName=UK_MIGRATION_VERSION, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	0023281995
26.2.6-40088-duplicate	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-10-09 15:21:25.305998	160	EXECUTED	9:cc7e02ed69ab31979afb1982f9670e8f	customChange		\N	4.33.0	\N	\N	0023281995
26.2.6-40088-uk	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-10-09 15:21:25.307456	161	EXECUTED	9:5bb848128da7bc4595cc507383325241	addUniqueConstraint constraintName=UK_MIGRATION_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	0023281995
26.3.0-groups-description	keycloak	META-INF/jpa-changelog-26.3.0.xml	2025-10-09 15:21:25.30887	162	EXECUTED	9:e1a3c05574326fb5b246b73b9a4c4d49	addColumn tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	0023281995
26.4.0-40933-saml-encryption-attributes	keycloak	META-INF/jpa-changelog-26.4.0.xml	2025-10-09 15:21:25.309875	163	EXECUTED	9:7e9eaba362ca105efdda202303a4fe49	customChange		\N	4.33.0	\N	\N	0023281995
26.4.0-51321	keycloak	META-INF/jpa-changelog-26.4.0.xml	2025-10-09 15:21:25.319741	164	EXECUTED	9:34bab2bc56f75ffd7e347c580874e306	createIndex indexName=IDX_EVENT_ENTITY_USER_ID_TYPE, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	0023281995
40343-workflow-state-table	keycloak	META-INF/jpa-changelog-26.4.0.xml	2025-10-09 15:21:25.340142	165	EXECUTED	9:ed3ab4723ceed210e5b5e60ac4562106	createTable tableName=WORKFLOW_STATE; addPrimaryKey constraintName=PK_WORKFLOW_STATE, tableName=WORKFLOW_STATE; addUniqueConstraint constraintName=UQ_WORKFLOW_RESOURCE, tableName=WORKFLOW_STATE; createIndex indexName=IDX_WORKFLOW_STATE_STEP, table...		\N	4.33.0	\N	\N	0023281995
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	38b67e0c-5fad-4222-ae5d-cb3526a609b1	f
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	14edb98a-72a6-4a4a-a2ec-e25b51706372	t
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0cfb6ba5-99b3-48e9-a39f-d351393886e0	t
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	4085e9c9-2afd-43c2-bb92-9f05acfca8c2	t
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0d3669fd-518e-4141-a884-4e1fe86474d6	t
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	3ec72451-66b5-47f5-969e-447b359fe8dc	f
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	b85dec55-1c32-4e07-822d-74367c54c667	f
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5ac564c1-8b3f-409a-b377-e8b369a720a7	t
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	decb4212-910c-4978-9bfb-925cb3297fcd	t
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	248a2371-2165-4044-8137-0519d59e5886	f
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	ee4f5a6c-6053-48f7-8592-b32470c3ce73	t
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	22c9d427-c3f9-4b30-855f-2842902cc1ce	t
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	03b46025-5606-4b58-a929-71d558b648ed	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type, description) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
6be5efd6-28a6-427f-9d76-754fcd286da4	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	f	${role_default-roles}	default-roles-master	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N	\N
5571c4b7-c9eb-4231-aaaf-4d334c813f3f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	f	${role_create-realm}	create-realm	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N	\N
81c12366-d572-48b8-8dc2-385dc21c2c0c	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	f	${role_admin}	admin	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N	\N
c111acdb-663e-45f5-b6f5-40ea9755138c	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_create-client}	create-client	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
ec2fb845-50d6-46d5-9cc5-cb5aa9d55b8e	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_view-realm}	view-realm	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
873aead7-8f40-4e4b-b0c8-110cecc0a6d1	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_view-users}	view-users	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
f0d06db5-18b8-417a-a214-3cadeb7a0bc5	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_view-clients}	view-clients	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
fca61354-8f6c-4bfd-9830-356c6af7ea35	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_view-events}	view-events	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
fda3da10-80ef-423f-bbc0-305714d50a09	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_view-identity-providers}	view-identity-providers	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
a587ffe0-3c63-43f5-b93c-ce0ab9f7f251	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_view-authorization}	view-authorization	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
de24e4f8-5a1a-4b09-8b76-9aef0bdf3049	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_manage-realm}	manage-realm	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
6d7d3ad4-4bdd-4028-a1e1-a93620b3a2b8	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_manage-users}	manage-users	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
dc9e8a7c-2e44-4157-ab96-503f986aec44	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_manage-clients}	manage-clients	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
09957b2c-be64-4f7b-ad80-51e6fb745f53	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_manage-events}	manage-events	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
965ada69-6e15-4ac3-a2f0-0fd7dece70da	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_manage-identity-providers}	manage-identity-providers	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
dd58c3ca-cd76-4c0e-ab67-3f8714695192	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_manage-authorization}	manage-authorization	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
b0cd05f8-6cf3-4068-acfa-c9545f46a072	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_query-users}	query-users	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
c2b903a6-5db1-4bcc-a161-e8269be6a6f9	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_query-clients}	query-clients	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
763b280e-02c4-40ed-b051-b80db4504566	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_query-realms}	query-realms	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
892378a4-d19e-41fc-a50b-fb22ef851dd7	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_query-groups}	query-groups	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
175abb1e-ce47-4ac8-897a-f752899261db	fdb23330-26e2-450f-9183-53f9ededdd52	t	${role_view-profile}	view-profile	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	fdb23330-26e2-450f-9183-53f9ededdd52	\N
719798fd-7c5a-45e9-8491-49a533af3230	fdb23330-26e2-450f-9183-53f9ededdd52	t	${role_manage-account}	manage-account	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	fdb23330-26e2-450f-9183-53f9ededdd52	\N
e01277e9-03af-4217-9feb-c6b15e881b0e	fdb23330-26e2-450f-9183-53f9ededdd52	t	${role_manage-account-links}	manage-account-links	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	fdb23330-26e2-450f-9183-53f9ededdd52	\N
76c14485-15e2-4bc6-858e-3e382a16afdd	fdb23330-26e2-450f-9183-53f9ededdd52	t	${role_view-applications}	view-applications	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	fdb23330-26e2-450f-9183-53f9ededdd52	\N
7f9e8333-3452-4368-b929-613a2ff54c28	fdb23330-26e2-450f-9183-53f9ededdd52	t	${role_view-consent}	view-consent	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	fdb23330-26e2-450f-9183-53f9ededdd52	\N
8e1571f1-19a3-416f-ad3e-a11afd000131	fdb23330-26e2-450f-9183-53f9ededdd52	t	${role_manage-consent}	manage-consent	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	fdb23330-26e2-450f-9183-53f9ededdd52	\N
6a023c80-8e5e-4c26-aa9e-01ccba98e7af	fdb23330-26e2-450f-9183-53f9ededdd52	t	${role_view-groups}	view-groups	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	fdb23330-26e2-450f-9183-53f9ededdd52	\N
87e0deb8-5cd4-4ac0-b1bf-9243119f17b7	fdb23330-26e2-450f-9183-53f9ededdd52	t	${role_delete-account}	delete-account	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	fdb23330-26e2-450f-9183-53f9ededdd52	\N
74b92da7-26c8-49b9-bc51-09a1f2be40ed	c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	t	${role_read-token}	read-token	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	c28ad97d-fcd9-4c4f-a97d-88940e12fe1c	\N
eac3b840-62e5-41de-b136-891547d62264	1c878a59-a322-4371-af0e-27aeb921ae71	t	${role_impersonation}	impersonation	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1c878a59-a322-4371-af0e-27aeb921ae71	\N
14f895c3-f61b-4562-a83a-845745930db6	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	f	${role_offline-access}	offline_access	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N	\N
889b55e9-ef01-496f-adfd-7813e4c98dea	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	f	${role_uma_authorization}	uma_authorization	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	\N	\N
62abe84e-b5e3-477f-b63c-314a456ad18e	e5ac5e77-0380-4734-9b8f-82e72c6205a0	t	\N	uma_protection	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	e5ac5e77-0380-4734-9b8f-82e72c6205a0	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
n80uk	26.4.0	1760023286
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
3cf51680-0cb3-b34e-3bb5-ea760f7e89b3	9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	0	1760707988	{"authMethod":"openid-connect","redirectUri":"http://localhost:8080/admin/master/console/","notes":{"clientId":"9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be","iss":"http://localhost:8080/realms/master","startedAt":"1760707891","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"3581033b-ec8b-41c4-a842-11be8d0d153e","response_mode":"query","scope":"openid","userSessionStartedAt":"1760707891","redirect_uri":"http://localhost:8080/admin/master/console/","state":"933ed1bd-f78b-4629-8ba4-7d30f38a77f9","code_challenge":"NRGXf5HrvUANIgHMZF3Cj4OqRL1QQ6HpqbWp0BpZk4g"}}	local	local	1
8460c54f-27c4-538b-47f2-9720561f667f	e5ac5e77-0380-4734-9b8f-82e72c6205a0	0	1760708014	{"authMethod":"openid-connect","redirectUri":"http://localhost/login_check","notes":{"clientId":"e5ac5e77-0380-4734-9b8f-82e72c6205a0","scope":"openid","userSessionStartedAt":"1760708014","iss":"http://localhost:8080/realms/master","startedAt":"1760708014","response_type":"code","level-of-authentication":"-1","redirect_uri":"http://localhost/login_check","state":"4b419bd4074a7b383f3c20c49b82b56c","nonce":"147a77df239d84f6e57c0de9d3d08524"}}	local	local	0
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
3cf51680-0cb3-b34e-3bb5-ea760f7e89b3	9ad1bd18-e889-409c-be96-3250537bd27f	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1760707891	0	{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQxLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1760707891","authenticators-completed":"{\\"7524f5ee-7d85-4ab5-9478-f5c7dd9d7408\\":1760707891}"},"state":"LOGGED_IN"}	1760707988	\N	1
8460c54f-27c4-538b-47f2-9720561f667f	077a693b-dcd7-4395-a0d1-f2a5237cb9f9	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1760708014	0	{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQxLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1760708014","authenticators-completed":"{\\"7524f5ee-7d85-4ab5-9478-f5c7dd9d7408\\":1760708014}"},"state":"LOGGED_IN"}	1760708014	\N	0
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
1c1f43df-4512-4896-808a-aab838f66a45	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
c45bd6c4-4549-483b-a718-3dcd4eded157	defaultResourceType	urn:inventory-api:resources:default
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
585ba40a-9165-4428-96ac-fcc8e7437bb6	audience resolve	openid-connect	oidc-audience-resolve-mapper	214a24a6-aca5-4974-852f-6ef4b07c7f8f	\N
a267a267-2b89-4cb9-8e5e-eb475af0106e	locale	openid-connect	oidc-usermodel-attribute-mapper	9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	\N
04a531d4-d0c2-4844-a8d3-8b26d873e127	role list	saml	saml-role-list-mapper	\N	14edb98a-72a6-4a4a-a2ec-e25b51706372
3c750d46-dfa2-4ede-be15-091ac57acab6	organization	saml	saml-organization-membership-mapper	\N	0cfb6ba5-99b3-48e9-a39f-d351393886e0
53feb13a-677c-41ac-a6e3-6edc3435337b	full name	openid-connect	oidc-full-name-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
0fdbc9f7-36f0-4095-b201-2385df5ead69	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
417807af-1738-4382-9f41-36a1388a05bf	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
f6bda519-ae44-4950-ace5-0fd4c1e68795	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
217cb174-56f8-452c-b523-0cbce9943776	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
b72a7c35-c724-41dc-b89c-1d0dc1c3a9b3	username	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
8a0050a0-7452-4c3c-8da8-c2f6880e2461	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
005404e1-843e-4b47-b682-4edf22f2b82a	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
14a5eb16-ec69-4671-99e8-4006fb8ca89a	website	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
edb87139-7599-4ea1-93f3-2b79c0369a9c	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
7ab61f85-e334-462a-a4ff-209f9cd94eb6	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
765c79a6-333f-4030-8c34-b50b7605ba30	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
24c438ca-d4b9-4d7b-af2b-d7dc5d321489	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
da01aaff-b26f-4231-8927-6c5e6fb4899b	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	4085e9c9-2afd-43c2-bb92-9f05acfca8c2
bc1cfc29-caac-47f3-a65b-26b32c26b4c8	email	openid-connect	oidc-usermodel-attribute-mapper	\N	0d3669fd-518e-4141-a884-4e1fe86474d6
44285397-60b2-4cbf-9104-617f1335820b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	0d3669fd-518e-4141-a884-4e1fe86474d6
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	address	openid-connect	oidc-address-mapper	\N	3ec72451-66b5-47f5-969e-447b359fe8dc
591a07a2-9d9d-4853-aebf-ab5717cd9d74	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	b85dec55-1c32-4e07-822d-74367c54c667
064b1316-d28d-4976-a4b9-8ae748e74845	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	b85dec55-1c32-4e07-822d-74367c54c667
260d1d52-65d8-443d-8044-b2ce30d31750	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	5ac564c1-8b3f-409a-b377-e8b369a720a7
de323df2-8f13-4bc2-8122-21a16096780c	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	5ac564c1-8b3f-409a-b377-e8b369a720a7
cc33a1b5-af0a-40a2-8e7a-4a9c5d7972cd	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	5ac564c1-8b3f-409a-b377-e8b369a720a7
beeb2c43-54ac-4178-b3a5-e8775b224a7b	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	decb4212-910c-4978-9bfb-925cb3297fcd
40dec7bd-922e-4689-bda6-c6fa3c031cc2	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	248a2371-2165-4044-8137-0519d59e5886
9f10b199-7039-4ebd-bd78-9f08daa40528	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	248a2371-2165-4044-8137-0519d59e5886
22469c78-855a-4073-99fe-06f2aef2ff1c	acr loa level	openid-connect	oidc-acr-mapper	\N	ee4f5a6c-6053-48f7-8592-b32470c3ce73
d9425c24-5315-4e6a-bd65-7d4f62a470a2	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	22c9d427-c3f9-4b30-855f-2842902cc1ce
d94a38c1-8d01-41f1-b0d5-e771b11c3c81	sub	openid-connect	oidc-sub-mapper	\N	22c9d427-c3f9-4b30-855f-2842902cc1ce
e112863d-27c2-401e-832d-56bb13616ba2	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	1a9a525b-e62b-404c-8702-1ee11b0a777d
514999ae-0079-4004-8c6d-0846c1e25dcb	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	1a9a525b-e62b-404c-8702-1ee11b0a777d
fc904bab-89a2-4c33-b5ff-d5eef41cdfe4	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	1a9a525b-e62b-404c-8702-1ee11b0a777d
ea780ce4-50ac-492e-805e-74ac170f3fd9	organization	openid-connect	oidc-organization-membership-mapper	\N	03b46025-5606-4b58-a929-71d558b648ed
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
a267a267-2b89-4cb9-8e5e-eb475af0106e	true	introspection.token.claim
a267a267-2b89-4cb9-8e5e-eb475af0106e	true	userinfo.token.claim
a267a267-2b89-4cb9-8e5e-eb475af0106e	locale	user.attribute
a267a267-2b89-4cb9-8e5e-eb475af0106e	true	id.token.claim
a267a267-2b89-4cb9-8e5e-eb475af0106e	true	access.token.claim
a267a267-2b89-4cb9-8e5e-eb475af0106e	locale	claim.name
a267a267-2b89-4cb9-8e5e-eb475af0106e	String	jsonType.label
04a531d4-d0c2-4844-a8d3-8b26d873e127	false	single
04a531d4-d0c2-4844-a8d3-8b26d873e127	Basic	attribute.nameformat
04a531d4-d0c2-4844-a8d3-8b26d873e127	Role	attribute.name
005404e1-843e-4b47-b682-4edf22f2b82a	true	introspection.token.claim
005404e1-843e-4b47-b682-4edf22f2b82a	true	userinfo.token.claim
005404e1-843e-4b47-b682-4edf22f2b82a	picture	user.attribute
005404e1-843e-4b47-b682-4edf22f2b82a	true	id.token.claim
005404e1-843e-4b47-b682-4edf22f2b82a	true	access.token.claim
005404e1-843e-4b47-b682-4edf22f2b82a	picture	claim.name
005404e1-843e-4b47-b682-4edf22f2b82a	String	jsonType.label
0fdbc9f7-36f0-4095-b201-2385df5ead69	true	introspection.token.claim
0fdbc9f7-36f0-4095-b201-2385df5ead69	true	userinfo.token.claim
0fdbc9f7-36f0-4095-b201-2385df5ead69	lastName	user.attribute
0fdbc9f7-36f0-4095-b201-2385df5ead69	true	id.token.claim
0fdbc9f7-36f0-4095-b201-2385df5ead69	true	access.token.claim
0fdbc9f7-36f0-4095-b201-2385df5ead69	family_name	claim.name
0fdbc9f7-36f0-4095-b201-2385df5ead69	String	jsonType.label
14a5eb16-ec69-4671-99e8-4006fb8ca89a	true	introspection.token.claim
14a5eb16-ec69-4671-99e8-4006fb8ca89a	true	userinfo.token.claim
14a5eb16-ec69-4671-99e8-4006fb8ca89a	website	user.attribute
14a5eb16-ec69-4671-99e8-4006fb8ca89a	true	id.token.claim
14a5eb16-ec69-4671-99e8-4006fb8ca89a	true	access.token.claim
14a5eb16-ec69-4671-99e8-4006fb8ca89a	website	claim.name
14a5eb16-ec69-4671-99e8-4006fb8ca89a	String	jsonType.label
217cb174-56f8-452c-b523-0cbce9943776	true	introspection.token.claim
217cb174-56f8-452c-b523-0cbce9943776	true	userinfo.token.claim
217cb174-56f8-452c-b523-0cbce9943776	nickname	user.attribute
217cb174-56f8-452c-b523-0cbce9943776	true	id.token.claim
217cb174-56f8-452c-b523-0cbce9943776	true	access.token.claim
217cb174-56f8-452c-b523-0cbce9943776	nickname	claim.name
217cb174-56f8-452c-b523-0cbce9943776	String	jsonType.label
24c438ca-d4b9-4d7b-af2b-d7dc5d321489	true	introspection.token.claim
24c438ca-d4b9-4d7b-af2b-d7dc5d321489	true	userinfo.token.claim
24c438ca-d4b9-4d7b-af2b-d7dc5d321489	locale	user.attribute
24c438ca-d4b9-4d7b-af2b-d7dc5d321489	true	id.token.claim
24c438ca-d4b9-4d7b-af2b-d7dc5d321489	true	access.token.claim
24c438ca-d4b9-4d7b-af2b-d7dc5d321489	locale	claim.name
24c438ca-d4b9-4d7b-af2b-d7dc5d321489	String	jsonType.label
417807af-1738-4382-9f41-36a1388a05bf	true	introspection.token.claim
417807af-1738-4382-9f41-36a1388a05bf	true	userinfo.token.claim
417807af-1738-4382-9f41-36a1388a05bf	firstName	user.attribute
417807af-1738-4382-9f41-36a1388a05bf	true	id.token.claim
417807af-1738-4382-9f41-36a1388a05bf	true	access.token.claim
417807af-1738-4382-9f41-36a1388a05bf	given_name	claim.name
417807af-1738-4382-9f41-36a1388a05bf	String	jsonType.label
53feb13a-677c-41ac-a6e3-6edc3435337b	true	introspection.token.claim
53feb13a-677c-41ac-a6e3-6edc3435337b	true	userinfo.token.claim
53feb13a-677c-41ac-a6e3-6edc3435337b	true	id.token.claim
53feb13a-677c-41ac-a6e3-6edc3435337b	true	access.token.claim
765c79a6-333f-4030-8c34-b50b7605ba30	true	introspection.token.claim
765c79a6-333f-4030-8c34-b50b7605ba30	true	userinfo.token.claim
765c79a6-333f-4030-8c34-b50b7605ba30	zoneinfo	user.attribute
765c79a6-333f-4030-8c34-b50b7605ba30	true	id.token.claim
765c79a6-333f-4030-8c34-b50b7605ba30	true	access.token.claim
765c79a6-333f-4030-8c34-b50b7605ba30	zoneinfo	claim.name
765c79a6-333f-4030-8c34-b50b7605ba30	String	jsonType.label
7ab61f85-e334-462a-a4ff-209f9cd94eb6	true	introspection.token.claim
7ab61f85-e334-462a-a4ff-209f9cd94eb6	true	userinfo.token.claim
7ab61f85-e334-462a-a4ff-209f9cd94eb6	birthdate	user.attribute
7ab61f85-e334-462a-a4ff-209f9cd94eb6	true	id.token.claim
7ab61f85-e334-462a-a4ff-209f9cd94eb6	true	access.token.claim
7ab61f85-e334-462a-a4ff-209f9cd94eb6	birthdate	claim.name
7ab61f85-e334-462a-a4ff-209f9cd94eb6	String	jsonType.label
8a0050a0-7452-4c3c-8da8-c2f6880e2461	true	introspection.token.claim
8a0050a0-7452-4c3c-8da8-c2f6880e2461	true	userinfo.token.claim
8a0050a0-7452-4c3c-8da8-c2f6880e2461	profile	user.attribute
8a0050a0-7452-4c3c-8da8-c2f6880e2461	true	id.token.claim
8a0050a0-7452-4c3c-8da8-c2f6880e2461	true	access.token.claim
8a0050a0-7452-4c3c-8da8-c2f6880e2461	profile	claim.name
8a0050a0-7452-4c3c-8da8-c2f6880e2461	String	jsonType.label
b72a7c35-c724-41dc-b89c-1d0dc1c3a9b3	true	introspection.token.claim
b72a7c35-c724-41dc-b89c-1d0dc1c3a9b3	true	userinfo.token.claim
b72a7c35-c724-41dc-b89c-1d0dc1c3a9b3	username	user.attribute
b72a7c35-c724-41dc-b89c-1d0dc1c3a9b3	true	id.token.claim
b72a7c35-c724-41dc-b89c-1d0dc1c3a9b3	true	access.token.claim
b72a7c35-c724-41dc-b89c-1d0dc1c3a9b3	preferred_username	claim.name
b72a7c35-c724-41dc-b89c-1d0dc1c3a9b3	String	jsonType.label
da01aaff-b26f-4231-8927-6c5e6fb4899b	true	introspection.token.claim
da01aaff-b26f-4231-8927-6c5e6fb4899b	true	userinfo.token.claim
da01aaff-b26f-4231-8927-6c5e6fb4899b	updatedAt	user.attribute
da01aaff-b26f-4231-8927-6c5e6fb4899b	true	id.token.claim
da01aaff-b26f-4231-8927-6c5e6fb4899b	true	access.token.claim
da01aaff-b26f-4231-8927-6c5e6fb4899b	updated_at	claim.name
da01aaff-b26f-4231-8927-6c5e6fb4899b	long	jsonType.label
edb87139-7599-4ea1-93f3-2b79c0369a9c	true	introspection.token.claim
edb87139-7599-4ea1-93f3-2b79c0369a9c	true	userinfo.token.claim
edb87139-7599-4ea1-93f3-2b79c0369a9c	gender	user.attribute
edb87139-7599-4ea1-93f3-2b79c0369a9c	true	id.token.claim
edb87139-7599-4ea1-93f3-2b79c0369a9c	true	access.token.claim
edb87139-7599-4ea1-93f3-2b79c0369a9c	gender	claim.name
edb87139-7599-4ea1-93f3-2b79c0369a9c	String	jsonType.label
f6bda519-ae44-4950-ace5-0fd4c1e68795	true	introspection.token.claim
f6bda519-ae44-4950-ace5-0fd4c1e68795	true	userinfo.token.claim
f6bda519-ae44-4950-ace5-0fd4c1e68795	middleName	user.attribute
f6bda519-ae44-4950-ace5-0fd4c1e68795	true	id.token.claim
f6bda519-ae44-4950-ace5-0fd4c1e68795	true	access.token.claim
f6bda519-ae44-4950-ace5-0fd4c1e68795	middle_name	claim.name
f6bda519-ae44-4950-ace5-0fd4c1e68795	String	jsonType.label
44285397-60b2-4cbf-9104-617f1335820b	true	introspection.token.claim
44285397-60b2-4cbf-9104-617f1335820b	true	userinfo.token.claim
44285397-60b2-4cbf-9104-617f1335820b	emailVerified	user.attribute
44285397-60b2-4cbf-9104-617f1335820b	true	id.token.claim
44285397-60b2-4cbf-9104-617f1335820b	true	access.token.claim
44285397-60b2-4cbf-9104-617f1335820b	email_verified	claim.name
44285397-60b2-4cbf-9104-617f1335820b	boolean	jsonType.label
bc1cfc29-caac-47f3-a65b-26b32c26b4c8	true	introspection.token.claim
bc1cfc29-caac-47f3-a65b-26b32c26b4c8	true	userinfo.token.claim
bc1cfc29-caac-47f3-a65b-26b32c26b4c8	email	user.attribute
bc1cfc29-caac-47f3-a65b-26b32c26b4c8	true	id.token.claim
bc1cfc29-caac-47f3-a65b-26b32c26b4c8	true	access.token.claim
bc1cfc29-caac-47f3-a65b-26b32c26b4c8	email	claim.name
bc1cfc29-caac-47f3-a65b-26b32c26b4c8	String	jsonType.label
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	formatted	user.attribute.formatted
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	country	user.attribute.country
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	true	introspection.token.claim
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	postal_code	user.attribute.postal_code
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	true	userinfo.token.claim
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	street	user.attribute.street
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	true	id.token.claim
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	region	user.attribute.region
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	true	access.token.claim
1ee3346c-3dc6-4d1f-a623-2cdf590a5f9a	locality	user.attribute.locality
064b1316-d28d-4976-a4b9-8ae748e74845	true	introspection.token.claim
064b1316-d28d-4976-a4b9-8ae748e74845	true	userinfo.token.claim
064b1316-d28d-4976-a4b9-8ae748e74845	phoneNumberVerified	user.attribute
064b1316-d28d-4976-a4b9-8ae748e74845	true	id.token.claim
064b1316-d28d-4976-a4b9-8ae748e74845	true	access.token.claim
064b1316-d28d-4976-a4b9-8ae748e74845	phone_number_verified	claim.name
064b1316-d28d-4976-a4b9-8ae748e74845	boolean	jsonType.label
591a07a2-9d9d-4853-aebf-ab5717cd9d74	true	introspection.token.claim
591a07a2-9d9d-4853-aebf-ab5717cd9d74	true	userinfo.token.claim
591a07a2-9d9d-4853-aebf-ab5717cd9d74	phoneNumber	user.attribute
591a07a2-9d9d-4853-aebf-ab5717cd9d74	true	id.token.claim
591a07a2-9d9d-4853-aebf-ab5717cd9d74	true	access.token.claim
591a07a2-9d9d-4853-aebf-ab5717cd9d74	phone_number	claim.name
591a07a2-9d9d-4853-aebf-ab5717cd9d74	String	jsonType.label
260d1d52-65d8-443d-8044-b2ce30d31750	true	introspection.token.claim
260d1d52-65d8-443d-8044-b2ce30d31750	true	multivalued
260d1d52-65d8-443d-8044-b2ce30d31750	foo	user.attribute
260d1d52-65d8-443d-8044-b2ce30d31750	true	access.token.claim
260d1d52-65d8-443d-8044-b2ce30d31750	realm_access.roles	claim.name
260d1d52-65d8-443d-8044-b2ce30d31750	String	jsonType.label
cc33a1b5-af0a-40a2-8e7a-4a9c5d7972cd	true	introspection.token.claim
cc33a1b5-af0a-40a2-8e7a-4a9c5d7972cd	true	access.token.claim
de323df2-8f13-4bc2-8122-21a16096780c	true	introspection.token.claim
de323df2-8f13-4bc2-8122-21a16096780c	true	multivalued
de323df2-8f13-4bc2-8122-21a16096780c	foo	user.attribute
de323df2-8f13-4bc2-8122-21a16096780c	true	access.token.claim
de323df2-8f13-4bc2-8122-21a16096780c	resource_access.${client_id}.roles	claim.name
de323df2-8f13-4bc2-8122-21a16096780c	String	jsonType.label
beeb2c43-54ac-4178-b3a5-e8775b224a7b	true	introspection.token.claim
beeb2c43-54ac-4178-b3a5-e8775b224a7b	true	access.token.claim
40dec7bd-922e-4689-bda6-c6fa3c031cc2	true	introspection.token.claim
40dec7bd-922e-4689-bda6-c6fa3c031cc2	true	userinfo.token.claim
40dec7bd-922e-4689-bda6-c6fa3c031cc2	username	user.attribute
40dec7bd-922e-4689-bda6-c6fa3c031cc2	true	id.token.claim
40dec7bd-922e-4689-bda6-c6fa3c031cc2	true	access.token.claim
40dec7bd-922e-4689-bda6-c6fa3c031cc2	upn	claim.name
40dec7bd-922e-4689-bda6-c6fa3c031cc2	String	jsonType.label
9f10b199-7039-4ebd-bd78-9f08daa40528	true	introspection.token.claim
9f10b199-7039-4ebd-bd78-9f08daa40528	true	multivalued
9f10b199-7039-4ebd-bd78-9f08daa40528	foo	user.attribute
9f10b199-7039-4ebd-bd78-9f08daa40528	true	id.token.claim
9f10b199-7039-4ebd-bd78-9f08daa40528	true	access.token.claim
9f10b199-7039-4ebd-bd78-9f08daa40528	groups	claim.name
9f10b199-7039-4ebd-bd78-9f08daa40528	String	jsonType.label
22469c78-855a-4073-99fe-06f2aef2ff1c	true	introspection.token.claim
22469c78-855a-4073-99fe-06f2aef2ff1c	true	id.token.claim
22469c78-855a-4073-99fe-06f2aef2ff1c	true	access.token.claim
d9425c24-5315-4e6a-bd65-7d4f62a470a2	AUTH_TIME	user.session.note
d9425c24-5315-4e6a-bd65-7d4f62a470a2	true	introspection.token.claim
d9425c24-5315-4e6a-bd65-7d4f62a470a2	true	id.token.claim
d9425c24-5315-4e6a-bd65-7d4f62a470a2	true	access.token.claim
d9425c24-5315-4e6a-bd65-7d4f62a470a2	auth_time	claim.name
d9425c24-5315-4e6a-bd65-7d4f62a470a2	long	jsonType.label
d94a38c1-8d01-41f1-b0d5-e771b11c3c81	true	introspection.token.claim
d94a38c1-8d01-41f1-b0d5-e771b11c3c81	true	access.token.claim
514999ae-0079-4004-8c6d-0846c1e25dcb	clientHost	user.session.note
514999ae-0079-4004-8c6d-0846c1e25dcb	true	introspection.token.claim
514999ae-0079-4004-8c6d-0846c1e25dcb	true	id.token.claim
514999ae-0079-4004-8c6d-0846c1e25dcb	true	access.token.claim
514999ae-0079-4004-8c6d-0846c1e25dcb	clientHost	claim.name
514999ae-0079-4004-8c6d-0846c1e25dcb	String	jsonType.label
e112863d-27c2-401e-832d-56bb13616ba2	client_id	user.session.note
e112863d-27c2-401e-832d-56bb13616ba2	true	introspection.token.claim
e112863d-27c2-401e-832d-56bb13616ba2	true	id.token.claim
e112863d-27c2-401e-832d-56bb13616ba2	true	access.token.claim
e112863d-27c2-401e-832d-56bb13616ba2	client_id	claim.name
e112863d-27c2-401e-832d-56bb13616ba2	String	jsonType.label
fc904bab-89a2-4c33-b5ff-d5eef41cdfe4	clientAddress	user.session.note
fc904bab-89a2-4c33-b5ff-d5eef41cdfe4	true	introspection.token.claim
fc904bab-89a2-4c33-b5ff-d5eef41cdfe4	true	id.token.claim
fc904bab-89a2-4c33-b5ff-d5eef41cdfe4	true	access.token.claim
fc904bab-89a2-4c33-b5ff-d5eef41cdfe4	clientAddress	claim.name
fc904bab-89a2-4c33-b5ff-d5eef41cdfe4	String	jsonType.label
ea780ce4-50ac-492e-805e-74ac170f3fd9	true	introspection.token.claim
ea780ce4-50ac-492e-805e-74ac170f3fd9	true	multivalued
ea780ce4-50ac-492e-805e-74ac170f3fd9	true	id.token.claim
ea780ce4-50ac-492e-805e-74ac170f3fd9	true	access.token.claim
ea780ce4-50ac-492e-805e-74ac170f3fd9	organization	claim.name
ea780ce4-50ac-492e-805e-74ac170f3fd9	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	60	300	7200	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	1c878a59-a322-4371-af0e-27aeb921ae71	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	7d23c3e4-e6d2-407e-a751-384cdfa45ba0	23c085dd-b3f8-40ea-8b2f-8f2efdb0b108	5a703da1-1a27-4a50-bb7c-27f1ec7fd7a3	0514e74e-880e-419b-9660-dd916072e9f1	6c3bda06-ca34-43ea-8d44-9a4ae49d872e	2592000	f	900	t	f	0e24b5d8-5c42-425b-8218-1e70a55a21c5	0	f	0	0	6be5efd6-28a6-427f-9d76-754fcd286da4
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	
_browser_header.xContentTypeOptions	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	nosniff
_browser_header.referrerPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	no-referrer
_browser_header.xRobotsTag	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	none
_browser_header.xFrameOptions	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	SAMEORIGIN
_browser_header.contentSecurityPolicy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	max-age=31536000; includeSubDomains
bruteForceProtected	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
permanentLockout	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
maxTemporaryLockouts	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0
bruteForceStrategy	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	MULTIPLE
maxFailureWaitSeconds	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	900
minimumQuickLoginWaitSeconds	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	60
waitIncrementSeconds	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	60
quickLoginCheckMilliSeconds	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	1000
maxDeltaTimeSeconds	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	43200
failureFactor	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	30
realmReusableOtpCode	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
firstBrokerLoginFlowId	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5e7fadc4-3c0b-4e69-9f3d-462f8d06077d
displayName	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	Keycloak
displayNameHtml	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	RS256
offlineSessionMaxLifespanEnabled	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
offlineSessionMaxLifespan	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5184000
cibaBackchannelTokenDeliveryMode	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	poll
cibaExpiresIn	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	120
cibaAuthRequestedUserHint	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	login_hint
parRequestUriLifespan	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	60
cibaInterval	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5
organizationsEnabled	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
adminPermissionsEnabled	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
verifiableCredentialsEnabled	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
actionTokenGeneratedByAdminLifespan	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	43200
actionTokenGeneratedByUserLifespan	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	300
oauth2DeviceCodeLifespan	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	600
oauth2DevicePollingInterval	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	5
clientSessionIdleTimeout	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0
clientSessionMaxLifespan	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0
clientOfflineSessionIdleTimeout	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0
clientOfflineSessionMaxLifespan	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0
webAuthnPolicyRpEntityName	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	keycloak
webAuthnPolicySignatureAlgorithms	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	ES256,RS256
webAuthnPolicyRpId	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	
webAuthnPolicyAttestationConveyancePreference	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	not specified
webAuthnPolicyAuthenticatorAttachment	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	not specified
webAuthnPolicyRequireResidentKey	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	not specified
webAuthnPolicyUserVerificationRequirement	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	not specified
webAuthnPolicyCreateTimeout	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0
webAuthnPolicyAvoidSameAuthenticatorRegister	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
webAuthnPolicyRpEntityNamePasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	ES256,RS256
webAuthnPolicyRpIdPasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	
webAuthnPolicyAttestationConveyancePreferencePasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	not specified
webAuthnPolicyRequireResidentKeyPasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	Yes
webAuthnPolicyUserVerificationRequirementPasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	required
webAuthnPolicyCreateTimeoutPasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	false
client-policies.profiles	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	{"profiles":[]}
client-policies.policies	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	{"policies":[]}
shortVerificationUri	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	
actionTokenGeneratedByUserLifespan.verify-email	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	
actionTokenGeneratedByUserLifespan.idp-verify-account-via-email	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	
actionTokenGeneratedByUserLifespan.reset-credentials	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	
actionTokenGeneratedByUserLifespan.execute-actions	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
fdb23330-26e2-450f-9183-53f9ededdd52	/realms/master/account/*
214a24a6-aca5-4974-852f-6ef4b07c7f8f	/realms/master/account/*
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	/admin/master/console/*
e5ac5e77-0380-4734-9b8f-82e72c6205a0	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
445fc0cf-368c-4a5d-a61f-75f9329be8b1	VERIFY_EMAIL	Verify Email	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	VERIFY_EMAIL	50
74624740-fb01-43de-b6f9-cb79b62ea256	UPDATE_PROFILE	Update Profile	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	UPDATE_PROFILE	40
b67891e7-356f-40cc-8895-155b5bdd3fd1	CONFIGURE_TOTP	Configure OTP	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	CONFIGURE_TOTP	10
c43557cc-ab3f-440b-af0a-918a5e490734	UPDATE_PASSWORD	Update Password	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	UPDATE_PASSWORD	30
e5cbb851-c1cc-4e67-8759-bcb5bbfe7ab4	TERMS_AND_CONDITIONS	Terms and Conditions	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	f	f	TERMS_AND_CONDITIONS	20
450cbb6b-2e41-4425-80e6-d5030431fd74	delete_account	Delete Account	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	f	f	delete_account	60
c7cbe3b4-5766-4aff-9df0-17368cce459f	delete_credential	Delete Credential	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	delete_credential	110
e42e3734-c37b-4dd2-a3aa-59a61b9d4e2b	update_user_locale	Update User Locale	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	update_user_locale	1000
6b508341-5c4c-4472-a95c-3a337760af2d	UPDATE_EMAIL	Update Email	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	f	f	UPDATE_EMAIL	70
306c0119-41ce-4c0b-a443-e0458cdefc53	CONFIGURE_RECOVERY_AUTHN_CODES	Recovery Authentication Codes	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	CONFIGURE_RECOVERY_AUTHN_CODES	130
b22e0a8a-9980-4565-85a3-75620483480a	webauthn-register	Webauthn Register	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	webauthn-register	80
95dff0b6-58bd-42d2-9fe0-c5d75fe8a38c	webauthn-register-passwordless	Webauthn Register Passwordless	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	webauthn-register-passwordless	90
17ec5363-6819-49d5-871c-897b53c841ea	VERIFY_PROFILE	Verify Profile	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	VERIFY_PROFILE	100
d3cf2ba0-b3c9-4849-844f-8c65b97a2829	idp_link	Linking Identity Provider	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	t	f	idp_link	120
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
e5ac5e77-0380-4734-9b8f-82e72c6205a0	t	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
1c1f43df-4512-4896-808a-aab838f66a45	Default Policy	A policy that grants access only for users within this realm	js	0	0	e5ac5e77-0380-4734-9b8f-82e72c6205a0	\N
c45bd6c4-4549-483b-a718-3dcd4eded157	Default Permission	A permission that applies to the default resource type	resource	1	0	e5ac5e77-0380-4734-9b8f-82e72c6205a0	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
06e45bf9-76d8-4c0a-85da-e71d7f7faa5b	Default Resource	urn:inventory-api:resources:default	\N	e5ac5e77-0380-4734-9b8f-82e72c6205a0	e5ac5e77-0380-4734-9b8f-82e72c6205a0	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
06e45bf9-76d8-4c0a-85da-e71d7f7faa5b	/*
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
214a24a6-aca5-4974-852f-6ef4b07c7f8f	6a023c80-8e5e-4c26-aa9e-01ccba98e7af
214a24a6-aca5-4974-852f-6ef4b07c7f8f	719798fd-7c5a-45e9-8491-49a533af3230
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: server_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.server_config (server_config_key, value, version) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	9ad1bd18-e889-409c-be96-3250537bd27f	f949ae70-73e9-46c5-a07f-e9d04579cf58	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
9ad1bd18-e889-409c-be96-3250537bd27f	\N	9a158b47-5c45-4690-b929-4527fefe2513	f	t	\N	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	admin	1760023287046	\N	0
077a693b-dcd7-4395-a0d1-f2a5237cb9f9	hello.world@example.com	hello.world@example.com	f	t	\N	Hello	World	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	hello.world@example.com	1760029679998	\N	0
a3ee8e95-0390-4644-b722-4bc0c1780e79	\N	2896f0ce-b23b-4a23-b927-0bf6b94b8e2f	f	t	\N	\N	\N	17a1deaa-57e1-46fe-a0b9-1dbf7786ae0a	service-account-inventory-api	1760467069902	e5ac5e77-0380-4734-9b8f-82e72c6205a0	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
6be5efd6-28a6-427f-9d76-754fcd286da4	9ad1bd18-e889-409c-be96-3250537bd27f
81c12366-d572-48b8-8dc2-385dc21c2c0c	9ad1bd18-e889-409c-be96-3250537bd27f
6be5efd6-28a6-427f-9d76-754fcd286da4	077a693b-dcd7-4395-a0d1-f2a5237cb9f9
6be5efd6-28a6-427f-9d76-754fcd286da4	a3ee8e95-0390-4644-b722-4bc0c1780e79
62abe84e-b5e3-477f-b63c-314a456ad18e	a3ee8e95-0390-4644-b722-4bc0c1780e79
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
9fbf0b0f-5eb3-4fd8-9bd3-5b4a14ddb8be	+
e5ac5e77-0380-4734-9b8f-82e72c6205a0	*
\.


--
-- Data for Name: workflow_state; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.workflow_state (execution_id, resource_id, workflow_id, workflow_provider_id, resource_type, scheduled_step_id, scheduled_step_timestamp) FROM stdin;
\.


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: server_config SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.server_config
    ADD CONSTRAINT "SERVER_CONFIG_pkey" PRIMARY KEY (server_config_key);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: workflow_state pk_workflow_state; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.workflow_state
    ADD CONSTRAINT pk_workflow_state PRIMARY KEY (execution_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: migration_model uk_migration_update_time; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_update_time UNIQUE (update_time);


--
-- Name: migration_model uk_migration_version; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_version UNIQUE (version);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: workflow_state uq_workflow_resource; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.workflow_state
    ADD CONSTRAINT uq_workflow_resource UNIQUE (workflow_id, resource_id);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_entity_user_id_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_entity_user_id_type ON public.event_entity USING btree (user_id, type, event_time);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: idx_workflow_state_provider; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_workflow_state_provider ON public.workflow_state USING btree (resource_id, workflow_provider_id);


--
-- Name: idx_workflow_state_step; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_workflow_state_step ON public.workflow_state USING btree (workflow_id, scheduled_step_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

