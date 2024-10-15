FROM amhhaggag/hadoop-base-3.1.1:1.0

ENV HDFS_CONF_DFS_NAMENODE_DATA_DIR=file:///hadoop/dfs/name

RUN mkdir -p /hadoop/dfs/name

COPY ./start-namenode.sh ./start-namenode.sh

RUN chmod +x ./start-namenode.sh

RUN $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format $CLUSTER_NAME

EXPOSE 9870

CMD [ "./start-namenode.sh" ]
