
    database-service:
        image: docker.elastic.co/elasticsearch/elasticsearch-oss:6.8.1
        environment:
            - 'discovery.type=single-node'
ifelse(defn(`PLATFORM'),`VCAC-A',`dnl
        networks:
            - default_net
')dnl
        deploy:
            replicas: 1
            placement:
                constraints:
                    - node.role==manager

