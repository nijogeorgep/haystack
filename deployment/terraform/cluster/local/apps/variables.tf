variable "kubectl_executable_name" {}

variable "haystack_cluster_name" {
  default = "haystack"
}

variable "domain_name" {
  default = "local"
}

variable "kinesis-stream_region" {}
variable "pipes_firehose_writer_firehose_streamname" {}
variable "kinesis-stream_name" {}

# ========================================
# Haystack
# ========================================

# traces config
variable "traces" {
  type = "map"
  default = {
    enabled = true
    version = "316f53fb22b01984099db5c2b99049b703483082"
    indexer_instances = 1
    indexer_environment_overrides = ""
    indexer_cpu_request = "100m"
    indexer_cpu_limit = "1000m"
    indexer_memory_request = "250"
    indexer_memory_limit = "250"
    indexer_jvm_memory_limit = "200"
    indexer_elasticsearch_template = "{\"template\":\"haystack-traces*\",\"settings\":{\"number_of_shards\":4,\"index.mapping.ignore_malformed\":true,\"analysis\":{\"normalizer\":{\"lowercase_normalizer\":{\"type\":\"custom\",\"filter\":[\"lowercase\"]}}}},\"aliases\":{\"haystack-traces\":{}},\"mappings\":{\"spans\":{\"_field_names\":{\"enabled\":false},\"_all\":{\"enabled\":false},\"_source\":{\"includes\":[\"traceid\"]},\"properties\":{\"traceid\":{\"enabled\":false},\"starttime\":{\"type\":\"long\",\"doc_values\": true},\"spans\":{\"type\":\"nested\",\"properties\":{\"servicename\":{\"type\":\"keyword\",\"normalizer\":\"lowercase_normalizer\",\"doc_values\":false,\"norms\":false},\"operationname\":{\"type\":\"keyword\",\"normalizer\":\"lowercase_normalizer\",\"doc_values\":false,\"norms\":false},\"starttime\":{\"enabled\":false}}}},\"dynamic_templates\":[{\"strings_as_keywords_1\":{\"match_mapping_type\":\"string\",\"mapping\":{\"type\":\"keyword\",\"normalizer\":\"lowercase_normalizer\",\"doc_values\":false,\"norms\":false}}},{\"longs_disable_doc_norms\":{\"match_mapping_type\":\"long\",\"mapping\":{\"type\":\"long\",\"doc_values\":false,\"norms\":false}}}]}}}"

    reader_instances = 1
    reader_environment_overrides = ""
    reader_cpu_request = "100m"
    reader_cpu_limit = "1000m"
    reader_memory_request = "250"
    reader_memory_limit = "250"
    reader_jvm_memory_limit = "200"

    backend_cpu_request = "100m"
    backend_cpu_limit = "500m"
    backend_memory_request = "250"
    backend_memory_limit = "250"
    backend_jvm_memory_limit = "200"
    backend_environment_overrides = ""
  }
}

variable "trends" {
  type = "map"
  default = {
    enabled = true
    version = "1.1"
    metricpoint_encoder_type = "periodreplacement"
    span_timeseries_transformer_instances = 1
    span_timeseries_transformer_cpu_request = "100m"
    span_timeseries_transformer_cpu_limit = "1000m"
    span_timeseries_transformer_memory_request = "250"
    span_timeseries_transformer_memory_limit = "250"
    span_timeseries_transformer_jvm_memory_limit = "200"
    span_timeseries_transformer_kafka_num_stream_threads = "3"
    span_timeseries_transformer_environment_overrides = ""

    timeseries_aggregator_instances = 1
    timeseries_aggregator_environment_overrides = ""
    timeseries_aggregator_cpu_request = "100m"
    timeseries_aggregator_cpu_limit = "1000m"
    timeseries_aggregator_memory_request = "250"
    timeseries_aggregator_memory_limit = "250"
    timeseries_aggregator_jvm_memory_limit = "200"
    timeseries_aggregator_enable_metrics_sink = true
    timeseries_aggregator_histogram_max_value = 1800000
    timeseries_aggregator_histogram_precision = 2
    timeseries_aggregator_histogram_value_unit = "millis"
    timeseries_aggregator_additional_tags = ""
  }
}

variable "pipes" {
  type = "map"
  default = {
    version = "a20a8087f5ddc3fbf1a1c72dcff840608accadbf"

    firehose_kafka_threadcount = 1
    firehose_writer_enabled = false
    firehose_writer_environment_overrides = ""
    firehose_writer_firehose_initialretrysleep = 1
    firehose_writer_firehose_maxretrysleep = ""
    firehose_writer_firehose_signingregion = ""
    firehose_writer_firehose_streamname = ""
    firehose_writer_firehose_totopic = ""
    firehose_writer_firehose_url = ""
    firehose_writer_haystack_kafka_fromtopic = ""
    firehose_writer_instances = 1
    firehose_writer_cpu_request = "100m"
    firehose_writer_cpu_limit = "500m"
    firehose_writer_memory_request = "250"
    firehose_writer_memory_limit = "250"
    firehose_writer_jvm_memory_limit = "200"

    http_poster_enabled = false
    http_poster_environment_overrides = ""
    http_poster_httppost_pollpercent = ""
    http_poster_httppost_url = ""
    http_poster_instances = 1
    http_poster_cpu_request = "100m"
    http_poster_cpu_limit = "500m"
    http_poster_memory_request = "250"
    http_poster_memory_limit = "250"
    http_poster_jvm_memory_limit = "200"

    json_transformer_enabled = false
    json_transformer_environment_overrides = ""
    json_transformer_instances = 1
    json_transformer_cpu_request = "100m"
    json_transformer_cpu_limit = "500m"
    json_transformer_memory_request = "250"
    json_transformer_memory_limit = "250"
    json_transformer_jvm_memory_limit = "200"

    kafka_producer_enabled = false
    kafka_producer_environment_overrides = ""
    kafka_producer_instances = 1
    kafka_producer_cpu_request = "100m"
    kafka_producer_cpu_limit = "500m"
    kafka_producer_memory_request = "250"
    kafka_producer_memory_limit = "250"
    kafka_producer_jvm_memory_limit = "200"

    secret_detector_enabled = false
    secret_detector_environment_overrides = ""
    secret_detector_instances = 1
    secret_detector_kafka_threadcount = 1
    secret_detector_secretsnotifications_email_from = ""
    secret_detector_secretsnotifications_email_host = ""
    secret_detector_secretsnotifications_email_subject = ""
    secret_detector_secretsnotifications_email_tos = ""
    secret_detector_secretsnotifications_whitelist_bucket = ""
    secret_detector_cpu_request = "100m"
    secret_detector_cpu_limit = "500m"
    secret_detector_memory_request = "250"
    secret_detector_memory_limit = "250"
    secret_detector_jvm_memory_limit = "200"
  }
}

variable "collector" {
  type = "map"
  default = {
    version = "1.1"
    kinesis_span_collector_app_name = "kinesis-span-collector"
    kinesis_span_collector_instances = 1
    kinesis_span_collector_enabled = false
    kinesis_stream_region = ""
    kinesis_stream_name = ""
    kinesis_span_collector_sts_role_arn = ""
    kinesis_span_collector_environment_overrides = ""
    kinesis_span_collector_cpu_request = "100m"
    kinesis_span_collector_cpu_limit = "1000m"
    kinesis_span_collector_memory_request = "250"
    kinesis_span_collector_memory_limit = "250"
    kinesis_span_collector_jvm_memory_limit = "200"
    kinesis_span_collector_max_spansize_validation_enabled = "false"
    kinesis_span_collector_max_spansize_log_only = "false"
    kinesis_span_collector_max_spansize_limit = 5000
    kinesis_span_collector_message_tag_key = ""
    kinesis_span_collector_message_tag_value = ""
    kinesis_span_collector_max_spansize_skip_tags = "[\"error\"]"
    kinesis_span_collector_max_spansize_skip_services = "[]"

    http_span_collector_app_name = "http-span-collector"
    http_span_collector_instances = 1
    http_span_collector_enabled = false
    http_span_collector_environment_overrides = ""
    http_span_collector_cpu_request = "100m"
    http_span_collector_cpu_limit = "1000m"
    http_span_collector_memory_request = "250"
    http_span_collector_memory_limit = "250"
    http_span_collector_jvm_memory_limit = "200"
    http_span_collector_app_name = "http-span-collector"
    http_span_collector_max_spansize_validation_enabled = "false"
    http_span_collector_max_spansize_log_only = "false"
    http_span_collector_max_spansize_limit = 5000
    http_span_collector_message_tag_key = ""
    http_span_collector_message_tag_value = ""
    http_span_collector_max_spansize_skip_tags = "[\"error\"]"
    http_span_collector_max_spansize_skip_services = "[]"
  }
}

variable "service-graph" {
  type = "map"
  default = {
    enabled = false
    version = "1.0"
    metricpoint_encoder_type = "base64"
    node_finder_instances = 1
    node_finder_environment_overrides = ""
    node_finder_cpu_request = "100m"
    node_finder_cpu_limit = "1000m"
    node_finder_memory_request = "250"
    node_finder_memory_limit = "250"
    node_finder_jvm_memory_limit = "200"
    collect_tags = "[]"

    graph_builder_instances = 1
    graph_builder_environment_overrides = ""
    graph_builder_cpu_request = "100m"
    graph_builder_cpu_limit = "1000m"
    graph_builder_memory_request = "250"
    graph_builder_memory_limit = "250"
    graph_builder_jvm_memory_limit = "200"
  }
}

variable "ui" {
  type = "map"
  default = {
    enabled = true
    version = "1.1"
    instances = 1
    whitelisted_fields = ""
    enable_sso = false
    saml_callback_url = ""
    saml_entry_point = ""
    saml_issuer = ""
    session_secret = ""
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
    encoder_type = "base64"
  }
}

variable "haystack-console" {
  type = "map"
  default = {
    enabled = false
    version = "1.0"
    influxdb_endpoint_port = "8086"
    influxdb_endpoint_host = "monitoring-influxd"
    console_instances = 1
    console_attributor_endpoint= "attributor:8080"
    console_grafana_endpoint = "https://metrics.haystack.local:32300"
    console_environment_overrides = ""
    console_cpu_request = "500m"
    console_cpu_limit = "500m"
    console_memory_request = "1000"
    console_memory_limit = "1000"
    console_jvm_memory_limit = "768"
    healthcheckthreshold_trends_iteratorAgeSeconds = "300"
    healthcheckthreshold_traces_iteratorAgeSeconds = "300"
    healthcheckthreshold_service-graph_iteratorAgeSeconds = "300"
    healthcheckthreshold_collector_iteratorAgeSeconds = "300"
    attributorAdditionalTags = "{ \"blobsCount\" : { \"tagDisplayName\" : \"Blobs Count\", \"valueType\": \"COUNT\" }}"
  }
}

variable "metrictank" {
  type = "map"
  default = {
    instances = 1,
    environment_overrides = ""
    tag_support = "true"
    external_kafka_broker_hostname = ""
    external_kafka_broker_port = 9092
    external_hostname = ""
    external_port = 6060
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
  }
}

variable "haystack-alerts" {
  type = "map"
  default = {
    enabled = false
    es_curator_enabled = false
    version = "f7f7e516ac0459fb4e4cf3df977a3255a729bed8"
    elasticsearch_template = "{\"template\": \"haystack-anomalies*\",\"settings\": {\"number_of_shards\": 1,\"index.mapping.ignore_malformed\": true,\"analysis\": {\"normalizer\": {\"lowercase_normalizer\": {\"type\": \"custom\",\"filter\": [\"lowercase\"]}}}},\"mappings\": {\"anomaly\": {\"_source\": {\"enabled\": true},\"_field_names\": {\"enabled\": false},\"_all\": {\"enabled\": false},\"properties\": {\"startTime\": {\"type\": \"long\",\"doc_values\": true}},\"dynamic_templates\": [{\"strings_as_keywords_1\": {\"match_mapping_type\": \"string\",\"mapping\": {\"type\": \"keyword\",\"normalizer\": \"lowercase_normalizer\",\"doc_values\": false,\"norms\": false}}}, {\"longs_disable_doc_norms\": {\"match_mapping_type\": \"long\",\"mapping\": {\"type\": \"long\",\"doc_values\": false,\"norms\": false}}}]}}}"
    alert-api_instances = 1
    alert-api_environment_overrides = ""
    alert-api_cpu_request = "100m"
    alert-api_cpu_limit = "1000m"
    alert-api_memory_request = "250"
    alert-api_memory_limit = "250"
    alert-api_jvm_memory_limit = "200"
    subscription_service_hostname = "http://alert-manager-service.aa-apps.svc.cluster.local"
    subscription_service_port = 80

    anomaly-store_instances = 1
    anomaly-store_environment_overrides = ""
    anomaly-store_cpu_request = "100m"
    anomaly-store_cpu_limit = "1000m"
    anomaly-store_memory_request = "250"
    anomaly-store_memory_limit = "250"
    anomaly-store_jvm_memory_limit = "200"
  }
}

variable "pitchfork" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "hotelsdotcom/pitchfork:1.6"
    cpu_request = "1"
    cpu_limit = "1"
    memory_request = "1536"
    memory_limit = "2000"
    jvm_memory_limit = "1024"
    pitchfork_port = 9411
    kafka_enabled = "true"
    logging_enabled = "true"
    logging_span_enabled = "false"
    kafka_topic = "proto-spans"
    env_vars = ""
  }
}

variable "reverse-proxy" {
  type = "map"
  default = {
    enabled = false
    proxy_instances = 0
    version = "1.0.2"
    proxy_jvm_memory_limit = "1024"
    proxy_memory_request = "1536"
    proxy_memory_limit = "1536"
    proxy_cpu_request = "1"
    proxy_cpu_limit = "1"
  }
}

variable "haystack-agent" {
  type = "map"
  default = {
    enabled = false
    enable_spans = false
    enable_ossblobs = false
    enable_pitchfork = false
    use_sts_arn = false
    sts_arn_role = ""
    instances = 0
    version = "0.1.12"
    jvm_memory_limit = "1024"
    memory_request = "1536"
    memory_limit = "1536"
    cpu_request = "1"
    cpu_limit = "1"
    blobs_aws_bucket_name = "haystack-blobs"
    blobs_aws_region = "us-west-2"
  }
}

# ========================================
# Adaptive Alerting
# ========================================

variable "alerting" {
  type = "map"
  default = {
    version = "e90821e5ca0e0d895e01d9cb87612c463dcf0dc6"
  }
}

variable "modelservice" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/adaptive-alerting-modelservice:e90821e5ca0e0d895e01d9cb87612c463dcf0dc6"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    db_endpoint = ""
    detector_mapper_es_urls = ""
    graphite_url=""
    detector_mapper_doctype=""
    detector_mapper_es_config_max_total_connection=""
    detector_mapper_es_config_connection_retry_timeout= ""
    detector_doctype=""
    detector_mapper_es_config_connection_timeout=""
    detector_mapper_index_name=""
    detector_index_name=""
    detector_mapper_es_config_aws_iam_auth_required=""
  }
}

variable "ad-mapper" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/adaptive-alerting-ad-mapper:e90821e5ca0e0d895e01d9cb87612c463dcf0dc6"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
    jvm_memory_limit = "200"
    environment_overrides = ""
    modelservice_uri_template = "http://modelservice/api/detectors/search/findByMetricHash?hash=%s"
    kafka_hostname = "kafka-service.haystack-apps.svc.cluster.local"
    detector_mapper_index_name=""
    detector_index_name=""
    detector_mapping_cache_update_period=""
    detector_mapper_es_config_aws_iam_auth_required=""
    modelservice_base_uri=""
  }
}

variable "ad-manager" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/adaptive-alerting-ad-manager:e90821e5ca0e0d895e01d9cb87612c463dcf0dc6"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
    jvm_memory_limit = "200"
    environment_overrides = ""
    modelservice_uri_template = "http://modelservice/api/models/search/findLatestByDetectorUuid?uuid=%s"
    kafka_hostname = "kafka-service.haystack-apps.svc.cluster.local"
    graphite_data_retrieval_key=""
    metric_consumer_topic=""
    anomaly_producer_bootstrap_servers=""
    metric_consumer_bootstrap_servers=""
    modelservice_base_uri=""
    metric_consumer_key_deserializer=""
    graphite_base_uri=""
    metric_consumer_value_deserializer=""
    anomaly_producer_outlier_topic=""
    detector_refresh_period = ""
    anomaly_producer_client_id=""
    anomaly_producer_key_serializer=""
    anomaly_producer_value_serializer=""
    metric_consumer_group_id=""
    anomaly_producer_breakout_topic=""
    throttle_gate_likelihood=""
  }
}


variable "mc-a2m-mapper" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/adaptive-alerting-mc-a2m-mapper:e90821e5ca0e0d895e01d9cb87612c463dcf0dc6"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
    jvm_memory_limit = "200"
    environment_overrides = ""
    anomaly_consumer_bootstrap_servers = "kafka-service.haystack-apps.svc.cluster.local:9092"
    anomaly_consumer_group_id = "mc-a2m-mapper"
    anomaly_consumer_topic = "anomalies"
    anomaly_consumer_key_deserializer = "org.apache.kafka.common.serialization.StringDeserializer"
    anomaly_consumer_value_deserializer = "com.expedia.adaptivealerting.kafka.serde.AnomalyResultJsonDeserializer"
    metric_producer_bootstrap_servers = "kafka-service.haystack-apps.svc.cluster.local:9092"
    metric_producer_client_id = "mc-a2m-mapper"
    metric_producer_topic = "metrics"
    metric_producer_key_serializer = "org.apache.kafka.common.serialization.StringSerializer"

    # TODO Rename the serializer after we merge Haystack integration into AA. [WLW]
#    metric_producer_value_serializer = "com.expedia.adaptivealerting.kafka.serde.MetricDataMessagePackSerializer"
    metric_producer_value_serializer = "com.expedia.adaptivealerting.kafka.serde.MetricDataSerializer"
  }
}

variable "notifier" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    webhook_url = ""
  }
}


variable "aa-metric-functions" {
  type = "map"
  default = {
    enabled = false
    image=""
    instances = 0
    cpu_request = "100m"
    cpu_limit = "1000m"
    jvm_memory_limit = "300"
    memory_request = "500"
    memory_limit = "500"
    environment_overrides = ""
    image_pull_policy = "IfNotPresent"
    is_graphite_server_metrictank = false
    metric_source_graphite_host =""
    initContainer_image = ""
    aggregator_producer_topic = ""
    download_input_file_command =""
  }
}


variable "visualizer" {
  type = "map"
  default = {
    enabled = false
    image=""
    instances = 0
    cpu_request = "100m"
    cpu_limit = "1000m"
    jvm_memory_limit = "300"
    memory_request = "500"
    memory_limit = "500"
    elasticsearch_endpoint = ""
    image_pull_policy = "IfNotPresent"
    topic=""
    value_deserializer=""
    elasticsearch_port1=""
    environment_overrides=""
    elasticsearch_scheme=""
    elasticsearch_port2=""
    key_deserializer = ""
    group_id=""
  }
}

# ========================================
# Alert Manager
# ========================================

variable "alert-manager-service" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/alert-manager-service:67a10b9e28dfc51e806b9ee629ad91a7dfc1d505"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "700"
    memory_limit = "700"
    jvm_memory_limit = "300"
    environment_overrides = ""
    es_aws_region = ""
    es_urls = ""
    es_aws_iam_auth_required = false
    additional_email_validator_expression = ""
    subscription_es_urls = ""
    subscription_es_config_vars_json = ""
    alert_store_es_config_vars_json=""
    alert_store_es_urls=""
  }
}

variable "alert-manager-store" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/alert-manager-store:67a10b9e28dfc51e806b9ee629ad91a7dfc1d505"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    es_urls = ""
    es_aws_iam_auth_required = false
    es_aws_region = ""
    alert_store_es_config_vars_json = ""
    alert_store_es_urls = ""
  }
}

variable "alert-manager-notifier" {
  type = "map"
  default = {
    enabled = false
    image = "expediadotcom/alert-manager-notifier:67a10b9e28dfc51e806b9ee629ad91a7dfc1d505"
    instances = 1
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "700"
    memory_limit = "700"
    jvm_memory_limit = "300"
    environment_overrides = ""
    subscription_search_url = ""
    mail_from = ""
    es_urls = ""
    es_aws_region = ""
    es_aws_iam_auth_required = false
    alert_rate_limit_enabled = false
    alert_rate_limit_value = "1000"
    alert_expiry_time_in_sec = 36000
    alert_store_es_urls= ""
    alert_store_es_config_vars_json=""
  }
}

variable "haystack-attribution" {
  type = "map"
  default = {
    enabled = false
    version = "1.0"
    environment_name = ""
    influxdb_endpoint_port = ""
    influxdb_endpoint_host = ""
    docker_registry = ""

    attributor_instances = 0
    attributor_environment_overrides = ""
    attributor_cpu_request = "100m"
    attributor_cpu_limit = "100m"
    attributor_memory_request = "200"
    attributor_memory_limit = "200"
    attributor_jvm_memory_limit = "100"
    attributor_tags = "{\"items\":[{\"attributeName\":\"blobsCount\",\"spanTagKeys\":[\"request\",\"response\"],\"operatorType\":\"count\"}]}"
    attributor_num_stream_threads = 2

    attribution-persistence-email_instances = 0
    attribution-persistence-email_environment_overrides = ""
    attribution-persistence-email_cpu_request = "100m"
    attribution-persistence-email_cpu_limit = "100m"
    attribution-persistence-email_memory_request = "200"
    attribution-persistence-email_memory_limit = "200"
    attribution-persistence-email_jvm_memory_limit = "100"
    attribution_to_email_ids = ""
    attribution_from_email_id = ""
    attribution_email_subject_line = ""
    attribution_email_override_template = ""

    attribution-persistence-s3_instances = 0
    attribution-persistence-s3_environment_overrides = ""
    attribution-persistence-s3_cpu_request = "100m"
    attribution-persistence-s3_cpu_limit = "100m"
    attribution-persistence-s3_memory_request = "200"
    attribution-persistence-s3_memory_limit = "200"
    attribution-persistence-s3_jvm_memory_limit = "100"
    attribution_s3_aws_config = ""
    attribution_s3_transformers_config = ""
  }
}