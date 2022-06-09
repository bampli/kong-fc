# Ambiente Kong API Gateway

Ambiente de execucao do Kong API Gateway usando ferramenta docker-compose

## Ferramentas necessarias
* docker
* docker-compose
* editor *.yaml


## Ferramentas que serao provisionadas usando o docker-compose
* Fluent-Bit
* Kibana
* ElasticSearch
* Jaeger
* Grafana
* Prometheus
* Prometheus Node Exporter

### Arquivos de configuracao fluent-bit

Na pasta [fluent-bit](compose/fluent-bit) contem os arquivos necessarios para configuracao da ferramenta, o docker-compose utilizara esta pasta para montar as configuracoes


### Arquivos de configuracao prometheus

Na pasta [prom-conf](compose/prom-conf) contem os arquivos necessarios para configuracao do prometheus, inclusive a configuracao de _scraping_ das metricas do Kong API Gateway


## Rodando

Na pasta raiz do projeto voce pode executar

```shell
docker-compose -f compose/kong_compose.yml up -d
```
### Status

##### docker-compose -f compose/kong_compose.yml ps

```
               Name                             Command                  State                                                               Ports                                                        
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
compose_bets_1                       ./application                    Up             0.0.0.0:9999->9999/tcp,:::9999->9999/tcp                                                                             
compose_championships_1              ./application                    Up             9999/tcp                                                                                                             
compose_fluent-bit_1                 /fluent-bit/bin/fluent-bit ...   Up             0.0.0.0:2020->2020/tcp,:::2020->2020/tcp, 0.0.0.0:24224->24224/tcp,:::24224->24224/tcp,                              
                                                                                     0.0.0.0:5140->5140/udp,:::5140->5140/udp, 0.0.0.0:5170->5170/tcp,:::5170->5170/tcp                                   
compose_keycloak_1                   /opt/jboss/tools/docker-en ...   Up             0.0.0.0:8080->8080/tcp,:::8080->8080/tcp, 8443/tcp                                                                   
compose_kibana_1                     /bin/tini -- /usr/local/bi ...   Up             0.0.0.0:5601->5601/tcp,:::5601->5601/tcp                                                                             
compose_kong-database_1              docker-entrypoint.sh postgres    Up (healthy)   5432/tcp                                                                                                             
compose_kong-migration-bootstrap_1   /docker-entrypoint.sh kong ...   Exit 1                                                                                                                              
compose_kong-migration-up_1          /docker-entrypoint.sh kong ...   Exit 1                                                                                                                              
compose_konga_1                      /app/start.sh                    Up             0.0.0.0:1337->1337/tcp,:::1337->1337/tcp                                                                             
compose_matches_1                    ./application                    Up             9999/tcp                                                                                                             
compose_players_1                    ./application                    Up             9999/tcp                                                                                                             
compose_postgres_1                   docker-entrypoint.sh postgres    Up             5432/tcp                                                                                                             
elasticsearch                        /bin/tini -- /usr/local/bi ...   Up             0.0.0.0:9200->9200/tcp,:::9200->9200/tcp, 9300/tcp                                                                   
grafana                              /run.sh                          Up             0.0.0.0:3000->3000/tcp,:::3000->3000/tcp                                                                             
jaeger                               /go/bin/all-in-one-linux         Up             0.0.0.0:14250->14250/tcp,:::14250->14250/tcp, 0.0.0.0:14268->14268/tcp,:::14268->14268/tcp,                          
                                                                                     0.0.0.0:14269->14269/tcp,:::14269->14269/tcp, 0.0.0.0:16686->16686/tcp,:::16686->16686/tcp,                          
                                                                                     0.0.0.0:5775->5775/udp,:::5775->5775/udp, 0.0.0.0:5778->5778/tcp,:::5778->5778/tcp,                                  
                                                                                     0.0.0.0:6831->6831/udp,:::6831->6831/udp, 0.0.0.0:6832->6832/udp,:::6832->6832/udp,                                  
                                                                                     0.0.0.0:9411->9411/tcp,:::9411->9411/tcp                                                                             
kong                                 /docker-entrypoint.sh kong ...   Restarting                                                                                                                          
node_exporter                        /bin/node_exporter               Up             0.0.0.0:9100->9100/tcp,:::9100->9100/tcp                                                                             
prometheus                           /bin/prometheus --config.f ...   Up             0.0.0.0:9090->9090/tcp,:::9090->9090/tcp

```