module "cassandra" {
  source = "cassandra"
  aws_vpc_id = "${var.aws_vpc_id}"
  aws_subnet = "${var.aws_nodes_subnet}"
  aws_hosted_zone_id = "${var.aws_hosted_zone_id}"
  node_image = "${var.cassandra_node_image}"
  seed_node_count = "${var.cassandra_seed_node_instance_count}"
  non_seed_node_count = "${var.cassandra_non_seed_node_instance_count}"
  node_volume_size = "${var.cassandra_node_volume_size}"
  node_instance_type = "${var.cassandra_node_instance_type}"
  aws_ssh_key_pair_name = "${var.aws_ssh_key}"
  graphite_host = "${var.graphite_hostname}"
  graphite_port = "${var.graphite_port}"
  haystack_cluster_name = "${var.haystack_cluster_name}"
}

module "es" {
  source = "elasticsearch"
  master_instance_count = "${var.es_master_instance_count}"
  master_instance_type = "${var.es_master_instance_type}"
  worker_instance_count = "${var.es_worker_instance_count}"
  worker_instance_type = "${var.es_worker_instance_type}"
  haystack_cluster_name = "${var.haystack_cluster_name}"
  aws_vpc_id = "${var.aws_vpc_id}"
  aws_subnet = "${var.aws_nodes_subnet}"
  aws_region = "${var.aws_region}"
  k8s_nodes_iam-instance-profile_arn = "${var.k8s_nodes_iam-instance-profile_arn}"
}

module "kafka" {
  source = "kafka"
  aws_vpc_id = "${var.aws_vpc_id}"
  zookeeper_count = "${var.zookeeper_count}"
  zookeeper_volume_size = "${var.zookeeper_volume_size}"
  broker_count = "${var.kafka_broker_count}"
  broker_instance_type = "${var.kafka_broker_instance_type}"
  broker_volume_size = "${var.kafka_broker_volume_size}"
  aws_subnet = "${var.aws_nodes_subnet}"
  aws_hosted_zone_id = "${var.aws_hosted_zone_id}"
  aws_ssh_key_pair_name = "${var.aws_ssh_key}"
  aws_graphite_host = "${var.graphite_hostname}"
  aws_graphite_port = "${var.graphite_port}"
  haystack_cluster_name = "${var.haystack_cluster_name}"
}
