resource "yandex_compute_snapshot_schedule" "default2" {
  name = "default2"
  description    = "Ежедневные снимки, хранятся 7 дней"
 
    schedule_policy {
    expression = "0 1 * * *"
  }

  retention_period = "168h"

  snapshot_spec {
    description = "retention-snapshot"

  }

  disk_ids = [
    "${yandex_compute_disk.disk-webserv-1.id}",
    "${yandex_compute_disk.disk-webserv-2.id}",
    "${yandex_compute_disk.disk-bastion.id}",
    "${yandex_compute_disk.disk-zabbix.id}",
    "${yandex_compute_disk.disk-elastic.id}",
    "${yandex_compute_disk.disk-kibana.id}",
  ]

  depends_on = [
     yandex_compute_instance.webserv-1,
     yandex_compute_instance.webserv-2,
     yandex_compute_instance.bastion,
     yandex_compute_instance.zabbix,
     yandex_compute_instance.elastic,
     yandex_compute_instance.kibana
  ]

}
